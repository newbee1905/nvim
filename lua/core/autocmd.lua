vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost lua/core/plugins.lua source <afile> | PackerCompile
  augroup end
]])
