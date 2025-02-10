--------------------------------------------------------------------------------
-- init.lua - Main Neovim configuration using lazy.nvim
--
-- 1) Prepend Homebrew's bin directory to PATH.
-- 2) Auto-insert a LaTeX template into new .tex files.
-- 3) Bootstrap lazy.nvim.
-- 4) Load plugin specifications from the "plugins" module.
-- 5) Set basic options.
--
-- IMPORTANT: Do not re-source this file. Restart Neovim to apply changes.
--------------------------------------------------------------------------------

-- 1. Prepend Homebrew's bin directory (adjust if needed)
vim.env.PATH = "/opt/homebrew/bin:" .. vim.env.PATH

-- 2. Auto-insert LaTeX template into new .tex files.
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*.tex",
  callback = function()
    local template_path = vim.fn.stdpath("config") .. "/templates/latex_template.tex"
    vim.cmd("0r " .. template_path)
  end,
})

-- 3. Bootstrap lazy.nvim if not installed.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 4. Load plugin specifications from the "plugins" module.
require("lazy").setup("plugins", {
  ui = {
    border = "rounded",
    config_picker = function(plugin)
      vim.notify("No configuration file is set for " .. (plugin.name or "this plugin"), vim.log.levels.WARN)
      return nil
    end,
  },
})

-- 5. Global settings.
vim.o.termguicolors = true  -- Enable 24-bit colors

-- DO NOT re-source this file; RESTART Neovim to apply changes.
