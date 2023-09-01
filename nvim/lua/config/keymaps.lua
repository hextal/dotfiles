-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end
vim.api.nvim_set_keymap("n", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "

-- Leader Keybindings

-- inset semicolon to end of the line
vim.api.nvim_set_keymap("i", "<leader>;", "<c-o>A;", { noremap = true })
vim.api.nvim_set_keymap("i", "<leader>,", "<c-o>A,", { noremap = true })
vim.api.nvim_set_keymap("i", "<leader>.", "<c-o>A.", { noremap = true })
vim.api.nvim_set_keymap("i", "<leader>]", "<c-o>A]", { noremap = true })
vim.api.nvim_set_keymap("i", "<leader>}", "<c-o>A}", { noremap = true })
vim.api.nvim_set_keymap("i", "<leader>)", "<c-o>A)", { noremap = true })
vim.api.nvim_set_keymap("i", "<leader><space>", "<c-o>A ", { noremap = true })

vim.api.nvim_set_keymap("n", "<C-h>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<Nop>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<C-h>", "<Cmd>TmuxNavigateLeft<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<Cmd>TmuxNavigateDown<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<Cmd>TmuxNavigateUp<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<Cmd>TmuxNavigateRight<CR>", { noremap = true, silent = true })

--[[
-- markdown to html
vim.api.nvim_set_keymap("n", "<leader>md", ":%!markdown --html4tags <cr>", { noremap = true })
-- Tab navigation
for i = 1, 9 do
  vim.api.nvim_set_keymap("n", "<leader>" .. i, i .. "gt", { noremap = true })
end
vim.api.nvim_set_keymap("n", "<leader>h", ":tabprevious<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>l", ":tabnext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>t", ":tabnew<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>w", ":tabclose<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>o", "o<ESC>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>O", "O<ESC>", { noremap = true })

]]

-- Define a function that emulates the behavior of your Vim command
function console_log_current_word()
  local word = vim.fn.expand("<cword>")
  local command = string.format("console.log('%s:', %s);", word, word)
  vim.fn.setreg("+", command) -- Copy the command to the system clipboard register
  vim.fn.feedkeys('"+P') -- Paste the command from the clipboard register
end

-- Map the key sequence to the Lua function
vim.api.nvim_set_keymap("n", "<Leader>cl", ":lua console_log_current_word()<CR>", { silent = true, noremap = true })

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

vim.api.nvim_set_keymap("n", "<leader>d", ":r!date<esc>", { noremap = true })
--vim.api.nvim_set_keymap("n", "<leader>n", ":E<esc>", { noremap = true })
--vim.api.nvim_set_keymap("n", "<leader>s", ":w !sudo tee %<esc>", { noremap = true })
--vim.api.nvim_set_keymap("n", "<leader>q", [[ :s/"\(.*\)"/'\1'<esc> ]], { noremap = true })

-- search for word under the cursor
vim.api.nvim_set_keymap("n", "<leader>/", '"fyiw :/<c-r>f<cr>', { noremap = true })

-- set wrapping characters around word
for _, c in pairs({ '"', "'", "`", "(", "{", "[", "<" }) do
  vim.api.nvim_set_keymap("v", "<leader>" .. c, "S" .. c .. "lvi" .. c, { noremap = true })
end

vim.api.nvim_set_keymap("n", "<F1>", ":Neotree<CR>", { noremap = true, silent = true })
