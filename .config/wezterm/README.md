# Wezterm Config Files

```
wezterm
├── README.md
├── stone-colours.lua
├── stone-helpers.lua
├── stone-key-bindings.lua
├── stone-key-tables.lua
└── wezterm.lua
```
---

## wezterm.lua
Entry point for wezterm config

Modules Imported:

- wezterm
  - wezterm API
- stone-key-bindings
  - user defined key bindings
- stone-key-tables
  - user defined key tables
- stone-helpers
  - user defined helper functions

---

## stone-colours.lua
User defined colour schemes (light/dark)

Modules Imported:

- None

---

## stone-helpers.lua
Provide additional functionality via lua script functions that either cannot be achieved through wezterm API alone or would be messy to do so.

Modules Imported:
- wezterm
- stone-colours

---

## stone-key-bindings.lua
User defined keybindings. Wezterm defaults is extensive and will likely clash with interactive terminal programs like helix & vim.

Modules Imported:
- wezterm

---

## stone-key-table.lua
User defined key tables. Key tables are an extenstion of the key bindings table.
Again, wezterm defaults are exhaustive so this cuts down on redundancy and unused actions

Contains tables for:
- copy_mode
- search_mode
- split
- resize
- activate_pane

Modules Imported:
- wezterm
