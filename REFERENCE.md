# dotfiles ref

personal cheatsheet — configs symlinked from `~/Documents/Code/dotfiles/`

---

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

---

## fish vi mode

cursor tells you the mode — block = normal, line = insert

| | |
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

| | |
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

| | |
|---|---|
| `z saiba` | jump to best match |
| `z code weak` | match multiple path segments |
| `zi` | interactive pick with fzf |
| `z -` | previous directory |

---

## lazygit

run `lazygit` in any repo. panels 1–5 across the top.

| | |
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

prefix is `Ctrl+A` — press, release, then key.
run multiple sessions

**sessions**

| | |
|---|---|
| `tmux` | new session |
| `tmux new -s name` | named session |
| `Ctrl+A d` | detach (keeps running) |
| `tmux ls` | list sessions |
| `tmux a -t name` | reattach |

**windows**

| | |
|---|---|
| `Ctrl+A c` | new window |
| `Ctrl+A 1-9` | switch window |
| `Ctrl+A n` / `p` | next / prev |
| `Ctrl+A ,` | rename |

**panes**

| | |
|---|---|
| `Ctrl+A |` | split side by side |
| `Ctrl+A -` | split top/bottom |
| `Ctrl+A h/j/k/l` | move between panes |
| `Ctrl+A Alt+h/j/k/l` | resize |
| `Ctrl+A z` | fullscreen toggle |
| `Ctrl+A x` | kill pane |
| `Ctrl+A r` | reload config |

**copy mode** — enter with `Ctrl+A [`, exit with `q`

| | |
|---|---|
| `v` | start selection |
| `y` | copy to clipboard |

---

## neovim

leader is `Space`.

**file**

| | |
|---|---|
| `Space w` | save |
| `Space q` | quit |
| `Space x` | save & quit |
| `Space e` | file explorer |
| `Space bd` | close buffer |
| `Shift+L` / `H` | next / prev buffer |

**movement**

| | |
|---|---|
| `Ctrl+d` / `u` | half page, cursor stays centred |
| `n` / `N` | next/prev search result, stays centred |
| `*` | search word under cursor |
| `Ctrl+h/j/k/l` | move between splits |
| `Escape` | clear search highlight |

**editing**

| | |
|---|---|
| `V` → `J`/`K` | move selected lines up/down |
| `<` / `>` in visual | indent, stays in visual mode |
| `p` in visual | paste without clobbering clipboard |

---

## custom fish functions

| | |
|---|---|
| `serve` | `python -m http.server 8000` in cwd |
| `serve 3000` | same, custom port |
| `killport 8080` | kills whatever owns that port |
| `tunnel 5432 host` | SSH tunnel that port from remote |
| `dps` | docker ps readable format |
| `gitstatus` | branch + dirty count for every repo in cwd |
| `ff` | fzf file picker → open in nvim |
| `fg text` | rg → fzf → open match in nvim |

---

## layout

```
dotfiles/
├── fish/config.fish        → ~/.config/fish/config.fish
├── starship/starship.toml  → ~/.config/starship.toml
├── nvim/init.lua           → ~/.config/nvim/init.lua
└── tmux/tmux.conf          → ~/.tmux.conf
```
symlinked
```
ln -sfv ~/Documents/Code/dotfiles/thing/file ~/.config/thing/file
```
reload fish: `source ~/.config/fish/config.fish`
reload tmux: `Ctrl+A r`