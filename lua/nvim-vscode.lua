-- VSCode-specific Neovim configuration

-- ============================================================================
-- VSCODE-SPECIFIC FUNCTIONS
-- ============================================================================

local vscode = require('vscode-neovim')

-- Helper function to call VSCode commands
local function vscode_call(command)
  return function()
    vscode.call(command)
  end
end

-- ============================================================================
-- KEY MAPPINGS
-- ============================================================================

-- Insert mode escape (jk is handled by VSCode settings)
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Alternative escape" })

-- ============================================================================
-- FILE OPERATIONS
-- ============================================================================

-- Save file
vim.keymap.set("n", "<leader>w", vscode_call("workbench.action.files.save"), { desc = "Save file" })

-- Close file and group if empty
vim.keymap.set("n", "<leader>q", function()
  vscode.call("workbench.action.closeActiveEditor")
end, { desc = "Close file and empty groups" })

-- ============================================================================
-- NAVIGATION
-- ============================================================================

-- File explorer toggle
vim.keymap.set("n", "<leader>e", vscode_call("workbench.view.explorer"), { desc = "Toggle explorer" })

-- Command palette
vim.keymap.set("n", "<leader>p", vscode_call("workbench.action.showCommands"), { desc = "Command palette" })

-- Find files
vim.keymap.set("n", "<leader>ff", vscode_call("workbench.action.quickOpen"), { desc = "Find files" })

-- Global search word
vim.keymap.set("n", "<leader>fw", vscode_call("workbench.action.findInFiles"), { desc = "Global search" })

-- Source control
vim.keymap.set("n", "<leader>gg", function()
  -- Always create a new terminal for lazygit
  vscode.call("workbench.action.terminal.new")
  vim.defer_fn(function()
    vscode.call("workbench.action.terminal.sendSequence", {
      args = { text = "lazygit\r" }
    })
  end, 100)
end, { desc = "Open lazygit" })
vim.keymap.set("n", "<leader>gs", vscode_call("workbench.view.scm"), { desc = "Git source control" })

-- Debug tab
vim.keymap.set("n", "<leader>db", vscode_call("workbench.view.debug"), { desc = "Debug panel" })

-- ============================================================================
-- WINDOW MANAGEMENT
-- ============================================================================

-- Split windows
vim.keymap.set("n", "<leader>v", vscode_call("workbench.action.splitEditorRight"), { desc = "Split vertical" })
vim.keymap.set("n", "<leader>s", vscode_call("workbench.action.splitEditorDown"), { desc = "Split horizontal" })

-- Navigate between splits
vim.keymap.set("n", "<C-h>", vscode_call("workbench.action.navigateLeft"), { desc = "Navigate left" })
vim.keymap.set("n", "<C-j>", vscode_call("workbench.action.navigateDown"), { desc = "Navigate down" })
vim.keymap.set("n", "<C-k>", vscode_call("workbench.action.navigateUp"), { desc = "Navigate up" })
vim.keymap.set("n", "<C-l>", vscode_call("workbench.action.navigateRight"), { desc = "Navigate right" })

-- Tab navigation
vim.keymap.set("n", "<leader>1", vscode_call("workbench.action.openEditorAtIndex1"), { desc = "Go to tab 1" })
vim.keymap.set("n", "<leader>2", vscode_call("workbench.action.openEditorAtIndex2"), { desc = "Go to tab 2" })
vim.keymap.set("n", "<leader>3", vscode_call("workbench.action.openEditorAtIndex3"), { desc = "Go to tab 3" })
vim.keymap.set("n", "<leader>4", vscode_call("workbench.action.openEditorAtIndex4"), { desc = "Go to tab 4" })
vim.keymap.set("n", "<leader>5", vscode_call("workbench.action.openEditorAtIndex5"), { desc = "Go to tab 5" })

-- ============================================================================
-- TERMINAL
-- ============================================================================

-- Toggle terminal
vim.keymap.set("n", "<leader>t", vscode_call("workbench.action.terminal.toggleTerminal"), { desc = "Toggle terminal" })

-- ============================================================================
-- CODE ACTIONS
-- ============================================================================

-- Format document
vim.keymap.set("n", "<leader>=", vscode_call("editor.action.formatDocument"), { desc = "Format document" })
vim.keymap.set("x", "<leader>=", vscode_call("editor.action.formatSelection"), { desc = "Format selection" })

-- LSP actions
vim.keymap.set("n", "gd", vscode_call("editor.action.revealDefinition"), { desc = "Go to definition" })
vim.keymap.set("n", "gr", vscode_call("editor.action.goToReferences"), { desc = "Go to references" })
vim.keymap.set("n", "K", vscode_call("editor.action.showHover"), { desc = "Show hover docs" })
vim.keymap.set("n", "<leader>r", vscode_call("editor.action.rename"), { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>a", vscode_call("editor.action.quickFix"), { desc = "Code actions" })

-- Error navigation
vim.keymap.set("n", "]d", vscode_call("editor.action.marker.next"), { desc = "Next diagnostic" })
vim.keymap.set("n", "[d", vscode_call("editor.action.marker.prev"), { desc = "Previous diagnostic" })
vim.keymap.set("n", "<leader>dp", vscode_call("workbench.actions.view.problems"), { desc = "Show problems" })

-- ============================================================================
-- EDITING
-- ============================================================================

-- Comments
vim.keymap.set("n", "<leader>c", vscode_call("editor.action.commentLine"), { desc = "Toggle comment" })
vim.keymap.set("x", "<leader>c", vscode_call("editor.action.commentLine"), { desc = "Toggle comment" })

-- Move lines up/down in visual mode
vim.keymap.set("x", "J", vscode_call("editor.action.moveLinesDownAction"), { desc = "Move lines down" })
vim.keymap.set("x", "K", vscode_call("editor.action.moveLinesUpAction"), { desc = "Move lines up" })

-- Clear search highlight
vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })

-- ============================================================================
-- HARPOON INTEGRATION (VSCode Extension)
-- ============================================================================

-- These will work if you have the VSCode Harpoon extension installed
vim.keymap.set("n", "<leader>m", vscode_call("vscode-harpoon.addEditor"), { desc = "Harpoon add file" })
vim.keymap.set("n", "<leader>M", vscode_call("vscode-harpoon.editorQuickPick"), { desc = "Harpoon menu" })

-- Quick access to harpoon files
vim.keymap.set("n", "<leader>j", vscode_call("vscode-harpoon.gotoEditor1"), { desc = "Harpoon file 1" })
vim.keymap.set("n", "<leader>k", vscode_call("vscode-harpoon.gotoEditor2"), { desc = "Harpoon file 2" })
vim.keymap.set("n", "<leader>l", vscode_call("vscode-harpoon.gotoEditor3"), { desc = "Harpoon file 3" })
vim.keymap.set("n", "<leader>;", vscode_call("vscode-harpoon.gotoEditor4"), { desc = "Harpoon file 4" })

-- Navigate through harpoon list
vim.keymap.set("n", "<C-n>", vscode_call("vscode-harpoon.gotoPreviousHarpoonEditor"), { desc = "Previous harpoon" })
vim.keymap.set("n", "<C-p>", vscode_call("vscode-harpoon.gotoNextHarpoonEditor"), { desc = "Next harpoon" })

-- Remove from harpoon
vim.keymap.set("n", "<leader>x", vscode_call("vscode-harpoon.removeEditor"), { desc = "Remove from harpoon" })
vim.keymap.set("n", "<leader>X", vscode_call("vscode-harpoon.clearEditors"), { desc = "Clear all harpoon" })

-- ============================================================================
-- VISUAL MODE ENHANCEMENTS
-- ============================================================================

-- Keep visual selection when indenting
vim.keymap.set("x", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("x", ">", ">gv", { desc = "Indent right and reselect" })

-- Paste without overwriting register
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without overwriting register" })

-- ============================================================================
-- UTILITY MAPPINGS
-- ============================================================================

-- Better line navigation
vim.keymap.set("n", "j", "gj", { desc = "Move down by visual line" })
vim.keymap.set("n", "k", "gk", { desc = "Move up by visual line" })

-- Center screen on navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up and center" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result and center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center" })

-- ============================================================================
-- VSCODE-SPECIFIC SETTINGS
-- ============================================================================

-- Disable some Neovim features that conflict with VSCode
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = false

print("VSCode-Neovim configuration loaded successfully!")
