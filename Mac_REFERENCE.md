# dotfiles

## tools

| tool | what it is |
|---|---|
| `nvim` | vim but good |
| `starship` | stuff above where you type |
| `zoxide` | `cd` that learns. type `z <wheretfyougoin>` |
| `lazygit` | git without git |
| `tmux` | split terminal, persist across SSH drops |
| `fzf` | fuzzy search everything. `Ctrl+R` history, `Ctrl+T` files |
| `eza` | `ls` aliased & colourful |
| `bat` | `cat` with syntax highlighting |
| `fd` | `find` but usable. `fd "*.py"` |
| `rg` | `grep` but fast. `rg "TODO"` |
| `btop` | system monitor but excellent |
| `raycast` | spotlight but good. clipboard history, window tiling |

---

## install things

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
then
```
brew install fish starship neovim zoxide lazygit tmux fzf eza bat fd ripgrep btop
brew install --cask raycast
```
set fish as start in ghosty
```
cmd + ,
command = "/opt/homebrew/bin/fish"
shell-integration-features = title, sudo, ssh-env, ssh-terminfo
```

---

## raycast

replaces `Cmd+Space`. set it as default in raycast settings on first launch

| raycast | actual useful stuff |
|---|---|
| `Cmd+Space` | open raycast |
| `Cmd+Space` → type anything | launch apps, find files, calc, convert |
| `Cmd+Shift+C` | clipboard history |
| snippets | raycast → create snippet → type shortcut to expand |

---

## mac terminal bits

| mac | only |
|---|---|
| `pbcopy` | pipe anything to clipboard. `cat file \| pbcopy` |
| `pbpaste` | paste clipboard to stdout. `pbpaste > file.txt` |
| `open .` | open cwd in finder |
| `open -a "Visual Studio Code" .` | open cwd in vscode |
| `caffeinate -i` | stop mac sleeping during long tasks |
| `networkQuality` | built-in speed test |

---

## fish vi mode

cursor tells you the mode — block = normal, line = insert

| FISH | what it do |
|---|---|
| `jk` | exit to normal (fast af) |
| `i` `a` `A` | insert at cursor / after / end of line |
| `w` `b` | move by word |
| `dw` `D` | delete word / to end of line |
| `u` | undo |
| `!!` | repeat last command |
| `!$` | last argument of previous command |
| `Ctrl+R` | fzf history search |
| `Ctrl+T` | fzf file search |

---

## starship symbols

| starship | what it doin |
|---|---|
| `❯` green | ok |
| `❯` red | last command failed |
| `❮` purple | vi normal mode |
| ` main` | git branch |
| `!3` `?1` `+2` | modified / untracked / staged |
| `⇡1` `⇣2` | ahead / behind remote |
| `took 5s` | command took over 2 seconds |

---

## zoxide

learns from wherever you `cd`. ranks by frequency.

| Z | make cd go brr |
|---|---|
| `z saiba` | jump to best match |
| `z code weak` | match multiple path segments |
| `zi` | interactive pick with fzf |
| `z -` | previous directory |

---

## lazygit

run `lazygit` in any repo. panels 1–5 across the top

| l a z y | a true hero |
|---|---|
| `Space` | stage / unstage |
| `a` | stage all |
| `c` | commit |
| `P` | push |
| `p` | pull |
| `Enter` | expand / view diff |
| `/` | filter |
| `?` | help |
| `q` | quit |

---

## tmux

prefix is `Ctrl+A` — press, release, then key

**sessions**

| zoomin | but in fish |
|---|---|
| `tmux` | new session |
| `tmux new -s name` | named session |
| `Ctrl+A d` | detach (keeps running) |
| `tmux ls` | list sessions |
| `tmux a -t name` | reattach |

**windows**

| snappin | windows |
|---|---|
| `Ctrl+A c` | new window |
| `Ctrl+A 1-9` | switch window |
| `Ctrl+A n` / `p` | next / prev |
| `Ctrl+A ,` | rename |

**panes**

| i am | in pane |
|---|---|
| `Ctrl+A |` | split side by side |
| `Ctrl+A -` | split top/bottom |
| `Ctrl+A h/j/k/l` | move between panes |
| `Ctrl+A Alt+h/j/k/l` | resize |
| `Ctrl+A z` | fullscreen toggle |
| `Ctrl+A x` | kill pane |
| `Ctrl+A r` | reload config |

**copy mode** — enter with `Ctrl+A [`, exit with `q`

| ctrl c | ctrl v |
|---|---|
| `v` | start selection |
| `y` | copy to clipboard (uses pbcopy on mac) |

---

## neovim

leader is `Space`

**file**

| leader | space? |
|---|---|
| `Space w` | save |
| `Space q` | quit |
| `Space x` | save & quit |
| `Space e` | file explorer |
| `Space bd` | close buffer |
| `Shift+L` / `H` | next / prev buffer |

**movement**

| jumpin | jumnin |
|---|---|
| `Ctrl+d` / `u` | half page, cursor stays centred |
| `n` / `N` | next/prev search result, stays centred |
| `*` | search word under cursor |
| `Ctrl+h/j/k/l` | move between splits |
| `Escape` | clear search highlight |

**editing**

| ker | chow |
|---|---|
| `V` → `J`/`K` | move selected lines up/down |
| `<` / `>` in visual | indent, stays in visual mode |
| `p` in visual | paste without clobbering clipboard |

---

## custom fish functions

| custom | fish |
|---|---|
| `serve` | `python -m http.server 8000` in cwd |
| `serve 3000` | same, custom port |
| `killport 8080` | kills whatever owns that port |
| `tunnel 5432 host` | SSH tunnel that port from remote |
| `gitstatus` | branch + dirty count for every repo in cwd |
| `ff` | fzf file picker → open in nvim |
| `fg text` | rg → fzf → open match in nvim |

---

## layout

```
dotfiles/
├── cachyos/                        ← you are not here
└── macos/
    ├── fish/config.fish        → ~/.config/fish/config.fish
    ├── starship/starship.toml  → ~/.config/starship.toml
    ├── nvim/init.lua           → ~/.config/nvim/init.lua
    └── tmux/tmux.conf          → ~/.tmux.conf
```
symlinked
```
ln -sfv ~/Documents/Code/dotfiles/macos/thing/file ~/.config/thing/file
```
reload fish: `source ~/.config/fish/config.fish`
reload tmux: `Ctrl+A r`

---

## one diff from cachyos

tmux clipboard — change this one line in `tmux/tmux.conf`:

```
# cachyos
bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "xclip -in -selection clipboard"

# mac
bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "pbcopy"
```
