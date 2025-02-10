

--- Ensure lazy.nvim is loaded
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/lazy.nvim'
if not vim.loop.fs_stat(install_path) then
  vim.fn.system({
    'git', 'clone', '--depth', '1', 'https://github.com/folke/lazy.nvim.git', install_path
  })
end

-- Add lazy.nvim to runtime path
vim.opt.rtp:prepend(install_path)

-- Now setup your plugins using lazy.nvim
require('lazy').setup({
    {
        'nvim-telescope/telescope.nvim',
        config = function()
            require('telescope').setup{}
        end
    }
})

require("lazy").setup("plugins") 
