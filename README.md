# nvim optimizations

Optimized for Debian / Ubuntu (based on work of Chris Power : https://www.youtube.com/playlist?list=PLsz00TDipIffxsNXSkskknolKShdbcALR)

Description : 
These optimizations, will add features like autocompletion for BASH, PHP, JS and LUA files (more can be added), tree exploration, filesearch, occurence search over mutiple files (live grep) etc. 
In the original configuration phpactor is used for PHP completion. I disabled it and enable intelephense instead which I feels more efficient. (May be because I don't know enough the product)

I also used some of the key bindings from  nvim-lua/kickstart.nvim (https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua) 

## Client terminal requirement : 
  - Use of nerdfonts (optional but prettier : https://www.nerdfonts.com/font-downloads)
  
## Host requirement : 
  - Packages :
    - ripgrep
    - Nvim >= 0.8 (https://launchpad.net/~neovim-ppa/+archive/ubuntu/unstable)
    - NodeJS >= 18.x.x (https://joshtronic.com/2022/04/24/how-to-install-nodejs-18-on-ubuntu-2004-lts/)
    - Npm (https://joshtronic.com/2022/04/24/how-to-install-nodejs-18-on-ubuntu-2004-lts/)
    - PHP8.x (https://linuxize.com/post/how-to-install-php-8-on-ubuntu-20-04/)
    - Composer ( installation : https://getcomposer.org/download/)
  
## Installation : 

 #### - Semi-Auto :
   - Download install.sh into your home directory and run the following command : 'chmod +x install.sh && ./install.sh'
   - It's really not perfect but it save a little bit of time. Nvim will launch by itself, first time it'll installed required nvim plugins. Once finished, close nvim and then you'll see treesitter and Mason LSPs setup.
  
 #### - Manual installation :

  1) Check that you meet all requirements
  2) Copy nvim folder in ~/.config/
  3) Run nvim and let packages install.
  4) Close and re-open nvim. You should see treesitter and Mason LSPs setup.
  6) Close nvim.
  
You should then get something like this when opening a file with neovim : 

![Screenshot from 2023-01-06 10-19-21](https://user-images.githubusercontent.com/45790724/210970680-3e50afde-2a43-4bf4-ad54-22355fb543b4.png)

Done !!

## Things you have to know (tips): 
  - PHP LSPs need to find .git (file or folder) in the file's folder your are editing or in one of its parents directory. For now I don't know how to avoid this behaviour. So I put a .git file in /var/tmp/ and I use 'sudoedit' or 'sudo -e' to edit my files.
  - If you want to set nvim as default system editor run this command : 'sudo update-alternatives --config editor', and choose nvim.
  - in case of using TMUX run the following command on the host : 'export TERM=screen-256color' to avoid a wrong colorscheme (optional)

## Below find the list of installed packages: 

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
- nvim-ripgrep (https://github.com/rinx/nvim-ripgrep)

I advise you to check the 3 videos of Chris Power that'll show you how these modifications enhance your nvim. (Start of readme)

Bye !
