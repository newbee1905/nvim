<h1 align="center">Neovim's Config</h1>

<div align="center">

[![Lua](https://img.shields.io/badge/Made%20with%20Lua-blueviolet.svg?style=for-the-badge&logo=lua)](https://lua.org)

</div>

<div align="center">

[![Neovim Minimum Version](https://img.shields.io/badge/Neovim-0.8.0--dev-blueviolet.svg?style=flat-square&logo=Neovim&logoColor=white)](https://github.com/neovim/neovim)

</div>

## Speed

Super fast. Lazy loading most plugins.

Test with I7-9750H. 21ms

The speed can be changed

<details>

<summary>Click to see the startuptime log</summary>

```text
times in msec
 clock   self+sourced   self:  sourced script
 clock   elapsed:              other lines

000.027  000.027: --- NVIM STARTING ---
000.262  000.235: locale set
000.449  000.187: inits 1
000.460  000.011: window checked
000.461  000.002: parsing arguments
002.083  001.621: expanding arguments
002.101  000.018: inits 2
002.412  000.311: init highlight
002.413  000.001: waiting for UI
003.110  000.697: done waiting for UI
003.122  000.011: init screen for UI
003.140  000.018: init default mappings
003.163  000.023: init default autocommands
003.527  000.039  000.039: sourcing /home/newbee/.local/share/nvim/runtime/ftplugin.vim
003.585  000.022  000.022: sourcing /home/newbee/.local/share/nvim/runtime/indent.vim
010.476  006.857  006.857: sourcing /home/newbee/.config/nvim/init.lua
010.483  000.403: sourcing vimrc file(s)
010.639  000.020  000.020: sourcing /home/newbee/.local/share/nvim/site/pack/packer/start/moonplus-vim/ftdetect/mp.vim
010.695  000.012  000.012: sourcing /home/newbee/.local/share/nvim/site/pack/packer/start/vim-crystal/ftdetect/crystal.vim
010.714  000.007  000.007: sourcing /home/newbee/.local/share/nvim/site/pack/packer/start/vim-crystal/ftdetect/ecrystal.vim
010.793  000.253  000.212: sourcing /home/newbee/.local/share/nvim/runtime/filetype.lua
010.819  000.011  000.011: sourcing /home/newbee/.local/share/nvim/runtime/filetype.vim
010.950  000.059  000.059: sourcing /home/newbee/.local/share/nvim/runtime/syntax/synload.vim
011.069  000.228  000.168: sourcing /home/newbee/.local/share/nvim/runtime/syntax/syntax.vim
011.476  000.012  000.012: sourcing /home/newbee/.local/share/nvim/runtime/plugin/gzip.vim
011.495  000.008  000.008: sourcing /home/newbee/.local/share/nvim/runtime/plugin/health.vim
011.532  000.027  000.027: sourcing /home/newbee/.local/share/nvim/runtime/plugin/man.vim
011.552  000.009  000.009: sourcing /home/newbee/.local/share/nvim/runtime/plugin/matchit.vim
011.570  000.008  000.008: sourcing /home/newbee/.local/share/nvim/runtime/plugin/matchparen.vim
011.591  000.011  000.011: sourcing /home/newbee/.local/share/nvim/runtime/plugin/netrwPlugin.vim
011.690  000.007  000.007: sourcing /home/newbee/.local/share/nvim/rplugin.vim
011.694  000.093  000.086: sourcing /home/newbee/.local/share/nvim/runtime/plugin/rplugin.vim
011.745  000.041  000.041: sourcing /home/newbee/.local/share/nvim/runtime/plugin/shada.vim
011.774  000.016  000.016: sourcing /home/newbee/.local/share/nvim/runtime/plugin/spellfile.vim
011.796  000.011  000.011: sourcing /home/newbee/.local/share/nvim/runtime/plugin/tarPlugin.vim
011.814  000.007  000.007: sourcing /home/newbee/.local/share/nvim/runtime/plugin/tohtml.vim
011.837  000.013  000.013: sourcing /home/newbee/.local/share/nvim/runtime/plugin/tutor.vim
011.860  000.012  000.012: sourcing /home/newbee/.local/share/nvim/runtime/plugin/zipPlugin.vim
012.007  000.765: loading rtp plugins
012.181  000.027  000.027: sourcing /home/newbee/.local/share/nvim/site/pack/packer/start/nvim-web-devicons/plugin/nvim-web-devicons.vim
012.277  000.024  000.024: sourcing /home/newbee/.local/share/nvim/site/pack/packer/start/plenary.nvim/plugin/plenary.vim
012.370  000.018  000.018: sourcing /home/newbee/.local/share/nvim/site/pack/packer/start/vim-crystal/plugin/crystal.vim
012.460  000.384: loading packages
012.753  000.293: loading after plugins
012.764  000.011: inits 3
015.924  003.160: reading ShaDa
015.994  000.070: opening buffers
015.996  000.002: BufEnter autocommands
015.998  000.002: editing files in windows
017.318  001.320: VimEnter autocommands
017.321  000.003: UIEnter autocommands
017.527  000.159  000.159: sourcing /home/newbee/.local/share/nvim/runtime/autoload/provider/clipboard.vim
017.533  000.054: before starting main loop
017.905  000.371: first screen update
017.906  000.002: --- NVIM STARTED ---
```
</details>

## Plugins

## Credits

- [NvChad](https://github.com/NvChad/NvChad). Get highlight.lua file and themes from nvchad
