require("nvim-treesitter.configs").setup {
  -- ensure_installed = {
  --   "go",
  --   "html",
  --   "javascript",
  --   "markdown",
  --   "python",
  --   "query",
  --   "rust",
  --   "toml",
  --   "tsx",
  --   "typescript",
  --   "bash",
  --   "html",
  --   "c",
  --   "cpp",
  --   "ocaml",
  --   "vue",
  --   "c_sharp",
  --   "json",
  --   "make",
  --   "lua",
  --   "java"
  -- },

  ensure_installed = "maintained",
  highlight = {
      enable = true,
      -- disable = { "c", "javascript"}
  }
}
