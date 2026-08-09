if status is-interactive
    # fzf (https://github.com/junegunn/fzf#setting-up-shell-integration)
    fzf --fish | source

    function fish_greeting
        set_color normal
        echo "Welcome to a friendly interactive shell~~"
        # set_color yellow
        # echo -n "Note: "
        # set_color normal
        # echo "use 'nvm use lts' to use npm"
    end

    alias bonsai "cbonsai -li"
    alias weather "curl -s https://weather.gc.ca/rss/city/ab-50_e.xml | grep \"Current Conditions\""
    alias lg lazygit

    # Set nvim as the default editor
    set -gx VISUAL nvim
    set -gx EDITOR nvim

end

# uv
fish_add_path "/home/cielarchazure/.local/bin"

# zoxide
zoxide init fish --cmd cd | source

# fastfetch
if set -q HERDR_ENV
    fastfetch -c ~/.config/fastfetch/minimal.jsonc --logo-type none
else
    fastfetch -c ~/.config/fastfetch/minimal.jsonc
end

# eza
alias ls="eza --color=always --icons=always"
alias ll="eza -lg --color=always --icons=always"
alias lt="eza --tree --color=always --icons=always"

# pnpm
set -gx PNPM_HOME "/home/cielarchazure/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
