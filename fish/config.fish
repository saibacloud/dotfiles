# for Linux only
if test (uname) = Linux; and test -f /usr/share/cachyos-fish-config/cachyos-config.fish
    source /usr/share/cachyos-fish-config/cachyos-config.fish
end

# overwrite greeting
# potentially disabling fastfetch
function fish_greeting
    # ayo
end

# --- PATH ---
if not contains -- ~/.local/bin $PATH
    set -p PATH ~/.local/bin
end

# --- Vi Mode ---
fish_vi_key_bindings

# Cursor shape: block in normal, line in insert
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore

# Quick escape with jk (so you don't have to reach for Escape)
bind -M insert jk "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char repaint-mode; end"

# --- Starship Prompt ---
if type -q starship
    starship init fish | source
end

# --- Zoxide (smart cd) ---
if type -q zoxide
    zoxide init fish | source
end

# --- FZF keybindings (Ctrl+R history, Ctrl+T files) ---
if type -q fzf
    fzf --fish | source
end

# --- Quick server helpers ---

# Serve current directory on a port (default 8000)
function serve -a port -d "Serve current dir over HTTP"
    set -q port[1]; or set port 8000
    echo "Serving on http://localhost:$port"
    python -m http.server $port
end

# Kill whatever is running on a port
function killport -a port -d "Kill process on a given port"
    set pid (lsof -ti :$port)
    if test -n "$pid"
        kill -9 $pid
        echo "Killed PID $pid on port $port"
    else
        echo "Nothing running on port $port"
    end
end

# Quick SSH tunnel
function tunnel -a port host -d "SSH tunnel localhost:port to host:port"
    echo "Tunneling localhost:$port → $host:$port"
    ssh -N -L $port:localhost:$port $host
end

# Docker quick status
function dps -d "Docker container status"
    docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}" 2>/dev/null; or echo "Docker not running"
end

# Git quick status across all repos in current dir
function gitstatus -d "Git status of all repos in cwd"
    for dir in */
        if test -d "$dir/.git"
            set branch (git -C $dir branch --show-current 2>/dev/null)
            set dirty (git -C $dir status --porcelain 2>/dev/null | wc -l | string trim)
            if test "$dirty" -gt 0
                echo "  $dir ($branch) — $dirty changes"
            else
                echo "✓ $dir ($branch)"
            end
        end
    end
end

# Quick file find
function ff -d "Fuzzy find files with fzf + fd"
    fd --type f --hidden --exclude .git | fzf --preview 'bat --color=always --style=numbers --line-range=:200 {}' | read -l result
    and $EDITOR $result
end

# Quick grep into fzf
function fg -d "Fuzzy grep with rg + fzf"
    rg --color=always --line-number --no-heading --smart-case $argv | fzf --ansi | string split ':' | read -l file line _rest
    and $EDITOR $file +$line
end

# --- Editor default ---
set -gx EDITOR nvim
set -gx VISUAL nvim

# --- Config shortcuts ---
alias conffish="nvim ~/.config/fish/config.fish"
alias confnvim="nvim ~/.config/nvim/init.lua"
alias conftmux="nvim ~/.tmux.conf"
alias confstarship="nvim ~/.config/starship.toml"
alias confghost="nvim ~/.config/ghostty/config"
