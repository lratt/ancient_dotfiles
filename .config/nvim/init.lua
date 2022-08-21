require "settings"
require "mappings"
require "utils"
require "completion"
require "lsp"
require "treesitter"
require "tree"

require('mason').setup{}
require('nvim-autopairs').setup{}
require('kommentary.config').configure_language("default", {
    prefer_single_line_comments = true,
})
