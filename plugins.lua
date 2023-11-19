local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "stevearc/conform.nvim",
        build = { "pip install fprettify --break-system-packages" },
        config = function()
          require("conform").setup(require("custom.configs.format").cfg)
        end,
      },
      {
        "mfussenegger/nvim-lint",
        build = { "npm install -g markdownlint-cli", "npm install -g stylelint" },
        config = function()
          require "custom.configs.linter"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
      },
    },
    config = function()
      local telescope = require "telescope"
      telescope.load_extension "live_grep_args"
    end,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "simrat39/rust-tools.nvim",
    after = "nvim-lspconfig",
    ft = "rust",
    config = function()
      require("rust-tools").setup(_G.cfg.rust_tools)
    end,
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  { "tpope/vim-abolish", lazy = false },

  -- -- for keeping only the most recent used buffers active.
  -- {
  --   "axkirillov/hbac.nvim",
  --   config = function()
  --     require("hbac").setup {
  --       autoclose = true, -- set autoclose to false if you want to close manually
  --       threshold = 7, -- hbac will start closing unedited buffers once that number is reached
  --     }
  --   end,
  --   lazy = false,
  -- },
  --
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
