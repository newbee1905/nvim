<h1 align="center">Neovim's Config</h1>

<div align="center">

[![Lua](https://img.shields.io/badge/Made%20with%20Lua-blueviolet.svg?style=for-the-badge&logo=lua)](https://lua.org)

</div>

<div align="center">

[![Neovim Minimum Version](https://img.shields.io/badge/Neovim-0.6.1-blueviolet.svg?style=flat-square&logo=Neovim&logoColor=white)](https://github.com/neovim/neovim)

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

000.029  000.029: --- NVIM STARTING ---
000.800  000.771: locale set
000.979  000.179: inits 1
000.987  000.008: window checked
003.196  002.209: parsing arguments
003.266  000.070: expanding arguments
003.280  000.015: inits 2
003.574  000.294: init highlight
003.575  000.001: waiting for UI
004.075  000.500: done waiting for UI
004.082  000.007: init screen for UI
004.092  000.011: init default mappings
004.155  000.063: init default autocommands
004.195  000.009  000.009: sourcing /usr/share/nvim/archlinux.vim
004.198  000.028  000.019: sourcing /etc/xdg/nvim/sysinit.vim
006.558  000.057  000.057: sourcing /usr/share/nvim/runtime/syntax/synload.vim
006.616  000.172  000.116: sourcing /usr/share/nvim/runtime/syntax/syntax.vim
012.935  008.723  008.551: sourcing /home/newbee/.config/nvim/init.lua
012.941  000.035: sourcing vimrc file(s)
012.982  000.016  000.016: sourcing /home/newbee/.local/share/nvim/site/pack/packer/start/filetype.nvim/filetype.vim
013.018  000.009  000.009: sourcing /usr/share/nvim/runtime/filetype.vim
013.079  000.023  000.023: sourcing /usr/share/nvim/runtime/ftplugin.vim
013.135  000.019  000.019: sourcing /usr/share/nvim/runtime/indent.vim
013.487  000.010  000.010: sourcing /usr/share/nvim/runtime/plugin/gzip.vim
013.505  000.007  000.007: sourcing /usr/share/nvim/runtime/plugin/health.vim
013.539  000.024  000.024: sourcing /usr/share/nvim/runtime/plugin/man.vim
013.557  000.009  000.009: sourcing /usr/share/nvim/runtime/plugin/matchit.vim
013.576  000.009  000.009: sourcing /usr/share/nvim/runtime/plugin/matchparen.vim
013.596  000.012  000.012: sourcing /usr/share/nvim/runtime/plugin/netrwPlugin.vim
013.696  000.007  000.007: sourcing /home/newbee/.local/share/nvim/rplugin.vim
013.701  000.096  000.089: sourcing /usr/share/nvim/runtime/plugin/rplugin.vim
013.747  000.037  000.037: sourcing /usr/share/nvim/runtime/plugin/shada.vim
013.776  000.017  000.017: sourcing /usr/share/nvim/runtime/plugin/spellfile.vim
013.797  000.010  000.010: sourcing /usr/share/nvim/runtime/plugin/tarPlugin.vim
013.813  000.007  000.007: sourcing /usr/share/nvim/runtime/plugin/tohtml.vim
013.836  000.013  000.013: sourcing /usr/share/nvim/runtime/plugin/tutor.vim
013.857  000.011  000.011: sourcing /usr/share/nvim/runtime/plugin/zipPlugin.vim
014.260  000.343  000.343: sourcing /usr/share/vim/vimfiles/plugin/fzf.vim
014.326  000.039  000.039: sourcing /usr/share/vim/vimfiles/plugin/redact_pass.vim
014.479  000.828: loading rtp plugins
014.677  000.048  000.048: sourcing /home/newbee/.local/share/nvim/site/pack/packer/start/galaxyline.nvim/plugin/galaxyline.lua
014.770  000.024  000.024: sourcing /home/newbee/.local/share/nvim/site/pack/packer/start/nvim-web-devicons/plugin/nvim-web-devicons.vim
014.861  000.022  000.022: sourcing /home/newbee/.local/share/nvim/site/pack/packer/start/plenary.nvim/plugin/plenary.vim
014.945  000.018  000.018: sourcing /home/newbee/.local/share/nvim/site/pack/packer/start/vim-crystal/plugin/crystal.vim
015.024  000.433: loading packages
015.303  000.279: loading after plugins
015.313  000.011: inits 3
016.004  000.691: reading ShaDa
017.450  001.446: opening buffers
017.678  000.228: BufEnter autocommands
017.680  000.002: editing files in windows
019.230  001.550: VimEnter autocommands
019.251  000.021: UIEnter autocommands
019.460  000.147  000.147: sourcing /usr/share/nvim/runtime/autoload/provider/clipboard.vim
019.465  000.068: before starting main loop
021.430  001.965: first screen update
021.432  000.002: --- NVIM STARTED ---
```
</details>

## Plugins

## Credits

- [NvChad](https://github.com/NvChad/NvChad). Get highlight.lua file and themes from nvchad
