local null_ls = require("null-ls")
local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.luacheck.with({
      condition = function(utils)
        return utils.root_has_file({ ".luacheckrc" })
      end,
    }),
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.diagnostics.eslint.with({
      command = "eslint_d",
      filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
    }),
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.formatting.black,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          --lsp_formatting(bufnr)
          vim.lsp.buf.format({ async = false })
        end,
      })
    end
  end
})
