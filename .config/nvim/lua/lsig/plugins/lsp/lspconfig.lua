local on_attach = function(client, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = "LSP: " .. desc
    end

    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
  end

  nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
  nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

  -- See `:help K` for why this keymap
  nmap("K", vim.lsp.buf.hover, "Hover Documentation")
  nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
  nmap("<leader>e", vim.diagnostic.open_float, "Open floating diagnostic message")
  nmap("<leader>q", vim.diagnostic.setloclist, "Open diagnostics list")

  -- Lesser used LSP functionality
  nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
  nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
  nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
  nmap("<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, "[W]orkspace [L]ist Folders")

  -- Inlay hints toggle
  if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
    nmap("<leader>th", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, "[T]oggle Inlay [H]ints")
  end
end

local function diagnostic_format(diagnostic)
  local diagnostic_message = {
    [vim.diagnostic.severity.ERROR] = diagnostic.message,
    [vim.diagnostic.severity.WARN] = diagnostic.message,
    [vim.diagnostic.severity.INFO] = diagnostic.message,
    [vim.diagnostic.severity.HINT] = diagnostic.message,
  }
  return diagnostic_message[diagnostic.severity]
end

vim.diagnostic.config({
  severity_sort = true,
  float = { border = "rounded", source = "if_many" },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
  } or {},
  virtual_text = {
    current_line = false,
    source = "if_many",
    spacing = 2,
    format = diagnostic_format,
  },
})

local servers = {
  pyright = {
    pyright = {
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { "*" },
      },
    },
  },
  html = {
    filetypes = { "html", "html.erb" },
  },
  cssls = {},
  ts_ls = {},
  clangd = {
    init_options = {
      clangdFileStatus = true,
      usePlaceholders = true,
      completeUnimported = true,
      semanticHighlighting = true,
      fallbackFlags = {
        "--std=c++20",
        "--background-index",
        "--pch-storage=memory",
        "--clang-tidy",
        "--suggest-missing-includes",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
        "--function-arg-placeholders",
        "--fallback-style=llvm",
        "--enable-config",
      },
    },
  },
  sqlls = {},
  gopls = {
    filetypes = {
      "go",
      "gomod",
      "gowork",
      "gotmpl",
    },
    rootMarkers = { ".git", "go.mod", "go.work" },
    completeUnimported = true,
    usePlaceholders = true,
    staticcheck = true,
    analysis = {
      unusedparams = true,
      shadow = true,
    },
  },
  templ = {},
  lua_ls = {},
  marksman = {},
  emmet_ls = {
    filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
    init_options = {
      html = {
        options = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          ["bem.enabled"] = true,
        },
      },
    },
  },
}

return {
  { -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { "mason-org/mason.nvim", version = "^1.*", config = true },
      { "mason-org/mason-lspconfig.nvim", version = "^1.*" },
      { "WhoIsSethDaniel/mason-tool-installer.nvim" },
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    event = { "BufReadPre", "BufNewFile" },

    config = function()
      require("mason").setup()

      local capabilities = require("blink.cmp").get_lsp_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(servers),
      })

      mason_lspconfig.setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
          })
        end,
      })

      local mason_tool_installer = require("mason-tool-installer")

      mason_tool_installer.setup({
        ensure_installed = {
          "stylua",
          "clang-format",
          "golangci-lint",
        },
      })

      -- additional filetypes
      vim.filetype.add({
        extension = {
          templ = "templ",
        },
      })

      require("lspconfig").rust_analyzer.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        imports = {
          granularity = {
            group = "module",
          },
          prefix = "self",
        },
        cargo = {
          buildScripts = {
            enable = true,
          },
          allFeatures = true,
        },
        procMacro = {
          enable = true,
        },
        checkOnSave = {
          command = "clippy",
        },
        diagnostics = {
          enable = true,
          enableExperimental = true,
        },
        completion = {
          postfix = {
            enable = true,
          },
        },
      })

      require("lspconfig").ruby_lsp.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        mason = false,
        init_options = {
          formatter = "standard",
          linters = { "standard" },
          addonSettings = {
            ["Ruby LSP Rails"] = {
              enablePendingMigrationsPrompt = false,
            },
          },
        },
      })

      require("lspconfig").ocamllsp.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = {
          "opam",
          "exec",
          "--switch=ocaml4.14.2", -- explicitly use the correct switch
          "--",
          "ocamllsp",
        },
      })

      require("lspconfig").ruff.setup({
        init_options = {
          settings = {
            logLevel = "debug",
          },
        },
      })

      require("lspconfig").tailwindcss.setup({
        on_attach = on_attach,
        filetypes = {
          "templ",
          "html",
          "typescriptreact",
          "javascriptreact",
          "css",
          "sass",
          "scss",
          "less",
        },
        init_options = {
          userLanguages = {
            templ = "html",
          },
        },
      })
    end,
  },
}
