# nvim_optimisations

Optimized for Debian / Ubuntu (based on work of Chris Power : https://www.youtube.com/playlist?list=PLsz00TDipIffxsNXSkskknolKShdbcALR)

Client terminal requirement : 
  - use of nerdfonts (optional but prettier)
  
  Host requirement : 
  - Packages : 
    - Nvim >= 0.8
    - NodeJS >= 18.x.x
    - Npm
    - PHP8.x
    - in case of using TMUX run the following command on the host : export TERM=screen-256color (optional)
  
Installation : 
  - 1) Copy nvim folder in ~/.config/
  - 2) run nvim and let packages install (You'll get some errors, it's normal, some plugins are called but not yet installed)
  - 3) close and re-open nvim, everything should be ok

you should get something like this : 


![Screenshot from 2023-01-06 09-33-32](https://user-images.githubusercontent.com/45790724/210962811-554c3f1f-a23d-4dff-b72b-4969ec5a6511.png)

At the end you should get the following packages installed : 

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
