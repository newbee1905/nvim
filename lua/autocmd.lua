vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost lua/plugins/init.lua source <afile> | PackerCompile
  augroup end

  augroup packer_user_config
    autocmd!
    autocmd BufWritePost lua/plugins/configs.lua source <afile> | PackerCompile
  augroup end
]])
