require('nvim-autopairs').setup{}
require('neoclip').setup()

require('telescope').setup {
  extensions = {
    bookmarks = {
      -- Available: 'brave', 'buku', 'chrome', 'chrome_beta', 'edge', 'safari', 'firefox'
      selected_browser = 'firefox',

      -- Either provide a shell command to open the URL
      url_open_command = 'open',

      -- Or provide the plugin name which is already installed
      -- Available: 'vim_external', 'open_browser'
      url_open_plugin = nil,

      -- Show the full path to the bookmark instead of just the bookmark name
      full_path = true,

      -- Provide a custom profile name for Firefox
      firefox_profile_name = nil,
    },
  }
}


require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "lua","vim", "rust","toml","java","yaml","javascript","typescript","html","css","dart","json","python","svelte" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,  },
}



require "cmp_aman"
require "telescope_aman"
require('telescope').load_extension('neoclip')
require('telescope').load_extension('bookmarks')
require "illuminate_aman"
require "lsp_aman"
require "dap_aman"

-- require'lspconfig'.sumneko_lua.setup {
--   settings = {
--     Lua = {
--       workspace = {
--         preloadFileSize = 500
--       }
--     }
--   }
-- }


require'nvim-tree'.setup {
  sort_by = "case_sensitive",
  -- disables netrw completely
  disable_netrw       = true,
  -- hijack netrw window on startup
  hijack_netrw        = true,
  -- open the tree when running this setup function
  open_on_setup       = true,
  -- will not open on setup if the filetype is in this list
  ignore_ft_on_setup  = {},
  auto_reload_on_write = true,
  -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
  open_on_tab         = true,
 -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor       = false,
  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
  update_cwd          = false,
  hijack_unnamed_buffer_when_opening = true,
  -- show lsp diagnostics in the signcolumn
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    -- enables the feature
    enable      = false,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true
    update_cwd  = false,
    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    ignore_list = {}
  },
  -- configuration options for the system open command (`s` in the tree by default)
  system_open = {
    -- the command to run this, leaving nil should work in most cases
    cmd  = nil,
    -- the command arguments as a list
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    adaptive_size = true,
    -- width of the window, can be either a number (columns) or a string in `%`, for left or right side placement
    width = 30,
    -- height of the window, can be either a number (columns) or a string in `%`, for top or bottom side placement
    height = 30,
    hide_root_folder = false,
    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    side = 'left',
    mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = false,
      -- list of mappings to set on the tree manually
      list = {
        { key = "u", action = "dir_up" },
      }
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  },
  actions = {
    change_dir = {
      global = false,
    },
    open_file = {
      quit_on_open = true,
    }
  }
}



-- local saga = require 'lspsaga'
-- saga.init_lsp_saga()

local opt = vim.opt -- set options
opt.expandtab = true                -- Use spaces instead of tabs
opt.tabstop = 4                     -- Number of spaces tabs count for
opt.shiftround = true               -- Round indent
opt.shiftwidth = 4                  -- Size of an indent
opt.softtabstop = 4
opt.number = true                   -- Show line numbers
opt.relativenumber = true           -- Relative line numbers
opt.scrolloff = 4                   -- Lines of context


-- This is your opts table
require("telescope").setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")

-- vim.ui.select = require("popui.ui-overrider")
-- vim.ui.input = require("popui.input-overrider")

