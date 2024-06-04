# Dotfiles

### Setup

1. Install brew
2. Install the brew packages listed below
3. Enter a tmux session and execute <C-a>I to install tmux plugins
4. Your setup should be complete

### Brew packages

- bat 
- fzf
- fd
- ripgrep
- gh 
- go
- jq
- nvim
- zoxide

```bash
brew install bat fzf fd ripgrep gh go jq nvim zoxide
```

### Github CLI completions

```bash
gh completion -s zsh > .local/share/zinit/completions/_gh
```
