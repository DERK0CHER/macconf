-- ~/.config/nvim/lua/plugins.lua
return {
    -- Plugin Manager dependencies
    { "nvim-lua/plenary.nvim" },

    -- Example plugin: LuaSnip for snippets
    {
        "L3MON4D3/LuaSnip",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },

    -- Example plugin: Friendly snippets
    { "rafamadriz/friendly-snippets" },

    -- Example plugin: VimTeX for LaTeX editing
    {
        "lervag/vimtex",
        config = function()
            vim.g.vimtex_view_method = "zathura"
            vim.g.vimtex_compiler_method = "latexmk"
        end,
    },

    -- Add more plugins here...
}

