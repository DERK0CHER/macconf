--------------------------------------------------------------------------------
-- plugins.lua
--
-- Plugin specifications for lazy.nvim.
-- This config:
--  - Uses ts_ls (instead of tsserver) in LSP to avoid deprecation.
--  - Loads LuaSnip (v2+) with cmp_luasnip for snippet support.
--  - Sets up custom key mappings (<A-l> and <A-h>) for snippet expansion/jump.
--  - Includes plugins for colorscheme, file explorer, ALE, nvim-cmp, LSP, treesitter,
--    Mason, and vimtex (using Skim for PDF viewing).
--------------------------------------------------------------------------------

return {
  ------------------------------------------------------------------------------
  -- Colorscheme & LazyVim base
  ------------------------------------------------------------------------------
  { "ellisonleao/gruvbox.nvim" },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "gruvbox" },
  },

  ------------------------------------------------------------------------------
  -- LuaSnip (v2+) + cmp_luasnip for snippet support
  ------------------------------------------------------------------------------
  {
    "L3MON4D3/LuaSnip",
    version = "2.*", -- Ensure LuaSnip v2+ is used
    build = "make install_jsregexp",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local ls = require("luasnip")
      -- Load custom Lua snippets from ~/.config/nvim/lua/snippets (if available)
      pcall(function()
        require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets" })
      end)
      -- Set up key mappings for snippet expansion/jump.
      local function expand_or_jump()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end
      local function jump_back()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end
      vim.keymap.set({ "i", "s" }, "<A-l>", expand_or_jump, { silent = true })
      vim.keymap.set({ "i", "s" }, "<A-h>", jump_back, { silent = true })
    end,
  },

  ------------------------------------------------------------------------------
  -- File Explorer (nvim-tree)
  ------------------------------------------------------------------------------
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = { width = 35, side = "left" },
        renderer = {
          icons = {
            git_placement = "after",
            show = { file = true, folder = true, folder_arrow = true },
          },
        },
        git = { enable = true },
        actions = { open_file = { quit_on_open = false } },
      })
      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
    end,
  },

  ------------------------------------------------------------------------------
  -- Diagnostics & Linting (ALE)
  ------------------------------------------------------------------------------
  {
    "w0rp/ale",
    ft = { "sh", "zsh", "bash", "c", "cpp", "cmake", "html", "markdown", "racket", "vim", "tex" },
    cmd = "ALEEnable",
    config = function()
      vim.cmd("ALEEnable")
    end,
  },

  ------------------------------------------------------------------------------
  -- Autocompletion (nvim-cmp)
  ------------------------------------------------------------------------------
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, { name = "luasnip" }) -- for snippet completions
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  ------------------------------------------------------------------------------
  -- LSP Configuration (using ts_ls instead of tsserver)
  ------------------------------------------------------------------------------
  {
    "neovim/nvim-lspconfig",
    dependencies = { "jose-elias-alvarez/typescript.nvim" },
    opts = {
      servers = {
        pyright = {},
        ts_ls = {}, -- use ts_ls for TypeScript
      },
      setup = {
        ts_ls = function(_, server_opts)
          require("typescript").setup({ server = server_opts })
          return true
        end,
      },
    },
    config = function(_, opts)
      local lspconfig = require("lspconfig")
      for server, server_opts in pairs(opts.servers or {}) do
        if opts.setup and opts.setup[server] then
          if opts.setup[server](server, server_opts) then
            goto continue
          end
        end
        lspconfig[server].setup(server_opts)
        ::continue::
      end
    end,
  },

  ------------------------------------------------------------------------------
  -- Treesitter for Syntax Highlighting
  ------------------------------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    opts = {
      ensure_installed = {
        "bash", "html", "javascript", "json", "lua", "markdown",
        "markdown_inline", "python", "query", "regex", "tsx", "typescript",
        "vim", "yaml", "latex",
      },
      highlight = { enable = true },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "tsx", "typescript" })
    end,
  },

  ------------------------------------------------------------------------------
  -- LazyVim Extras
  ------------------------------------------------------------------------------
  { import = "lazyvim.plugins.extras.ui.mini-starter" },
  { import = "lazyvim.plugins.extras.lang.json" },

  ------------------------------------------------------------------------------
  -- Mason for Managing External Tools
  ------------------------------------------------------------------------------
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = { "stylua", "shellcheck", "shfmt", "flake8" },
    },
  },

  ------------------------------------------------------------------------------
  -- LaTeX Support via vimtex (using Skim as PDF viewer)
  ------------------------------------------------------------------------------
  {
    "lervag/vimtex",
    config = function()
      vim.g.vimtex_view_method = "skim"
      vim.g.vimtex_view_general_viewer = "skim"
      vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_latexmk = {
        build_dir = "",
        callback = 1,
        continuous = 1,
        executable = "latexmk",
        options = { "-pdf", "-interaction=nonstopmode", "-synctex=1" },
      }
    end,
  },
}
