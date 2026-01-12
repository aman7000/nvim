-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- Colemak movement: use n/e/i/o instead of h/j/k/l

vim.opt.langmap = table.concat({
    "jkne",
    ";",
    "nejk", -- Colemak → QWERTY (lowercase)
})
