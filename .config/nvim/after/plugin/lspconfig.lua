require("mason").setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

capabilities.textDocument.completion.completionItem.snippetSupport = true

local lsp_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})

vim.api.nvim_create_autocmd("BufWritePost", {
	group = lsp_group,
	callback = function()
		local efm = vim.lsp.get_clients({ name = "efm" })

		if vim.tbl_isempty(efm) then
			return
		end

		vim.lsp.buf.format({ name = "efm" })
	end,
})

local on_attach = function(client, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	nmap("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
	nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
	nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
	nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

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

-- Maintained with Mason
local prettier = require("efmls-configs.formatters.prettier")
local biome = require("efmls-configs.formatters.biome")
local clang_format = require("efmls-configs.formatters.clang_format")
local black = require("efmls-configs.formatters.black")
local stylua = require("efmls-configs.formatters.stylua")
-- local golangci_lint = require("efmls-configs.linters.golangci_lint")
local eslint = require("efmls-configs.linters.eslint_d")
local rustfmt = require("efmls-configs.formatters.rustfmt")
local gofmt = require("efmls-configs.formatters.gofmt")

local languages = {
	typescript = { eslint, biome },
	typescriptreact = { eslint, biome },
	javascript = { eslint, biome },
	javascriptreact = { eslint, biome },
	json = { biome },
	html = { prettier },
	css = { prettier },
	cpp = { clang_format },
	c = { clang_format },
	python = { black },
	lua = { stylua },
	go = { gofmt },
	rust = { rustfmt },
}

local servers = {
	pyright = {
		python = {
			analysis = {
				autoImportCompletion = true,
				autoSearchPaths = true,
				diagnosticMode = "openFilesOnly",
				useLibraryCodeForTypes = true,
				typeCheckingMode = "off",
			},
		},
	},
	html = {},
	cssls = {},
	tsserver = {},
	clangd = {},
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

local mason_lspconfig = require("mason-lspconfig")

local server_keys = vim.tbl_keys(servers)

-- Append the new value
table.insert(server_keys, "rust_analyzer")

mason_lspconfig.setup({
	ensure_installed = server_keys,
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

-- additional filetypes
vim.filetype.add({
	extension = {
		templ = "templ",
	},
})

require("lspconfig").tailwindcss.setup({
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

require("lspconfig").efm.setup({
	init_options = {
		documentFormatting = true,
		documentRangeFormatting = true,
	},
	filetypes = vim.tbl_keys(languages),
	settings = {
		rootMarkers = { ".git/", "package.json", "go.mod" },
		languages = languages,
	},
	capabilities = capabilities,
	on_attach = on_attach,
})
