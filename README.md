# nvim optimizations

Optimized for Debian / Ubuntu (based on work of Chris Power : https://www.youtube.com/playlist?list=PLsz00TDipIffxsNXSkskknolKShdbcALR)

Description : 
These optimizations, will ad features like autocompletion for BASH, PHP, JS and LUA files (more can be added), tree explorations, filesearch, occurence search over mutiple files etc. 

Client terminal requirement : 
  - use of nerdfonts (optional but prettier : https://www.nerdfonts.com/font-downloads)
  
  Host requirement : 
  - Packages : 
    - Nvim >= 0.8
    - NodeJS >= 18.x.x
    - Npm
    - PHP8.x
    - in case of using TMUX run the following command on the host : export TERM=screen-256color to avoid a wrong colorscheme (optional)
  
Installation : 
  1) Copy nvim folder in ~/.config/
  2) Run nvim and let packages install (You'll get some errors, it's normal, some plugins are called but not yet installed)
  3) Close and re-open nvim, everything should be ok
  4) In vim type ":MasonInstall bash-language-server intelephense php-cs-fixer phpactor phpcs typescript-language-server"
  5) Close and re-open nvim
you should get something like this : 

![Screenshot from 2023-01-06 10-19-21](https://user-images.githubusercontent.com/45790724/210970680-3e50afde-2a43-4bf4-ad54-22355fb543b4.png)

Done !!

Things you have to know (tips): 
  - LSP phpactor need to find .git (file or folder) in the filet's folder your are editing or in one of its parents directory.
  - If you want to use this configuration with sudo, ensure that default editor for sudo is nvim and then use "sudo -e" or "sudoedit" command to edit your files.

Below find the list of installed packages: 

- wbthomason/packer (https://github.com/wbthomason/packer.nvim)
- ellisonleao/gruvbox (https://github.com/morhetz/gruvbox)
- nvim-tree/nvim-tree (https://github.com/nvim-tree/nvim-tree.lua)
- nvim-tree/nvim-web-devicons (https://github.com/nvim-tree/nvim-web-devicons)
- nvim-lualine/lualine (https://github.com/nvim-lualine/lualine.nvim)
- nvim-treesitter/nvim-treesitter (https://github.com/nvim-treesitter/nvim-treesitter)
- hrsh7th/nvim-cmp (https://github.com/hrsh7th/nvim-cmp)
- hrsh7th/cmp-nvim-lsp (https://github.com/hrsh7th/cmp-nvim-lsp)
- L3MON4D3/LuaSnip (https://github.com/L3MON4D3/LuaSnip)
- williamboman/mason (https://github.com/williamboman/mason.nvim)
- williamboman/mason-lspconfig (https://github.com/williamboman/mason-lspconfig.nvim)
- neovim/nvim-lspconfig (https://github.com/neovim/nvim-lspconfig)
- nvim-telescope/telescope (https://github.com/nvim-telescope/telescope.nvim)
- nvim-lua/plenary (https://github.com/nvim-lua/plenary.nvim)

I advise you to check the 3 videos of Chris Power that'll show you how these modifications enhance your nvim. (Start of readme)

Bye !
