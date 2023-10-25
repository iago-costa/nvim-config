-- Setup lsp-zero
local lsp_zero = require('lsp-zero')

-- Setup lsp-zero keymaps
lsp_zero.on_attach(function(client, bufnr)
    local opts = { noremap = true, buffer = bufnr }
    local map = vim.keymap.set
    map('n', 'bd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    map('n', 'bD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    map('n', 'br', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    map('i', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    map('n', 'bi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        map('n', 'bh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    map('n', 'bf', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
    map('n', 'ba', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    -- rename symbol
    map('n', 'br', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- Format
    map('n', '<Leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
end)


require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
    },
    handlers = {
        lsp_zero.default_setup,
    },
})


-- init doc key
-- {'n'} bd = Go to definition
-- {'n'} bD = Go to declaration
-- {'n'} br = Go to references
-- {'i'} <C-s> = Show signature help
-- {'n'} bi = Go to implementation
-- {'n'} bh = Show hover
-- {'n'} bf = Format
-- {'n'} ba = Code action
-- {'n'} br = Rename symbol
-- {'n'} <Leader>f = Format
-- end doc key
