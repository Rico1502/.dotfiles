return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "clangd",
          "cmake",
          "taplo",
          "jsonls",
          "pylsp",
          "ruff_lsp",
          "marksman",
          "nil_ls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",

    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
        cmd = { "clangd" },
        single_file_support = true,
        root_dir = lspconfig.util.root_pattern(
          ".clangd",
          ".clang-tidy",
          ".clang-format",
          "compile_commands.json",
          "compile_flags.txt",
          "configure.ac",
          ".git"
        ),
      })
      lspconfig.cmake.setup({
        capabilities = capabilities,
      })
      lspconfig.taplo.setup({
        capabilities = capabilities,
      })
      lspconfig.jsonls.setup({
        capabilities = capabilities,
      })
      lspconfig.pylsp.setup({
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = {
                ignore = { "W391" },
                maxLineLength = 100,
              },
              jedi = {
                environment = "/usr/bin/python",
              },
            },
          },
        },
        capabilities = capabilities,
      })
      lspconfig.ruff_lsp.setup({
        init_options = {
          settings = {
            args = {},
          },
        },
        capabilities = capabilities,
      })
      lspconfig.marksman.setup({
        capabilities = capabilities,
      })
      lspconfig.nil_ls.setup({
        capabilities = capabilities,
      })

      -- Global mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
      vim.keymap.set("n", "<leader>bd", vim.diagnostic.goto_prev)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
      vim.keymap.set("n", "<leader>nd", vim.diagnostic.goto_next)
      vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

      -- Start inlay hints from the Start
      vim.lsp.inlay_hint.enable(true)

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts_kb = { buffer = ev.buf }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts_kb)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts_kb)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts_kb)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts_kb)
          vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts_kb)
          vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts_kb)
          vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts_kb)
          vim.keymap.set("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts_kb)
          vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts_kb)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts_kb)
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts_kb)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts_kb)
          if vim.lsp.inlay_hint then
            vim.keymap.set("n", "<leader>th", function()
              if vim.lsp.inlay_hint.is_enabled() then
                vim.lsp.inlay_hint.enable(false)
              else
                vim.lsp.inlay_hint.enable(true)
              end
            end)
          end
        end,
      })
    end,
  },
}
