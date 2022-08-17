require "settings"
require "lsp"
require "mappings"
require "utils"
require "completion"
require "treesitter"
require "tree"

require('mason').setup{}
require('mason-lspconfig').setup{}
require('nvim-autopairs').setup{}
require('kommentary.config').configure_language("default", {
    prefer_single_line_comments = true,
})
