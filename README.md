# My neovim files

My personal `.config/nvim` files. This repository includes my
`~/.config/nvim/init.vim`, `~/.config/nvim`
dir, and the plugins I load with vim-plug. This repo
includes my entire neovim setup so that I can easily load it onto other systems
and have history of it. Still uses some aliases from @cyphactor's dotvim
project <https://github.com/cyphactor>. 

Feel free to steal what you'd like, though.

## Installation:

1. `git clone git://github.com/bikeonastick/nvimconfig.git`
1. `cd nvimconfig`
1. `git submodule init`
1. `git submodule update`
1. `ln -s `pwd` ~/.config/nvim`
1. `ln -s `pwd`/vim-plug/plug.vim `pwd`/autoload/plug.vim`
1. open nvim and run the plugin install command 
   `:PlugInstall`


## Color Scheme

My `.vimrc` is setup to use the Solarized Color Scheme which can be found at
[http://ethanschoonover.com/solarized](http://ethanschoonover.com/solarized).
My `.vim/plugged` directory includes this color scheme just like all
the plugins. The reason I mention this is because I have it configured to use
the non 256 degraded Vim color version. This requires that you are using the
Solarized Color Scheme for your terminal application as well. I for example am
using [iTerm 2](http://www.iterm2.com/) with the Solarized iTerm 2 color scheme
presets.

## Quick Guide

### Functionality Provided by my vimrc

The `<leader>` key in my `.vimrc` is set to the `,` key.

#### Tab Completion

In insert mode when you start typing and hit tab it will bring up the tab completion interface.

* `<leader>n` - rename the current file
* `<leader>.` - switch between test & implementation code (assumes RSpec, Cucumber, and Ruby)

#### Search Commands

* Ackw does an ack search on the project for the word under the cursor
* Srchv - search project by file extension and grep for selected text
* Ackv - search all project files via ack for selected text
* Ackx - calls ack with whatever is passed as an argument (be sure to quote strings with spaces"
* SrchR - recursive find by file type (ruby) for specific word
* SrchG - recursive find by file type (groovy) for specific word
* SrchJava - recursive find by file type (java) for specific word
* SrchJs - recursive find by file type (javascript) for specific word
* SrchGsp - recursive find by file type (gsp) for specific word

#### Execute commands

* Rb - current file in ruby

### Plugin Provided Functionality

The following are plugins that vim-plug installs for easy upgrading. 

#### vim-surround

Provides functionality to easily manage surroundings parens, quotes, etc.
[http://github.com/tpope/vim-surround](http://github.com/tpope/vim-surround)

* `cst'` - change surrounding html tag to single quotes 
* `cs'<p>` - change surrounding single quotes to `<p>` html tag
* `cs'"` - change surronuding single quotes to double quotes
* `ds"` - delete surrounding double quotes
* `ysiw'` - add surrounding of single quote inside word (iw) where iw is a text object

#### tcomment_vim

Provides easy to use file-type sensible comments.
[http://github.com/tomtom/tcomment_vim](http://github.com/tomtom/tcomment_vim)

* `gc{motion}` - toggle comments
* `gC{motion}` - comment region
* `gcc` - toggle comment current line
* `gCc` - comment current line
* `gc` (visual mode) - toggle comments
* `gC` (visual mode) - comment selected text

#### gist-vim

Provides easy creation of GitHub Gists.
[http://github.com/mattn/gist-vim](http://github.com/mattn/gist-vim)

* `:Gist` - post current buffer to gist
* `:'<,'>Gist` - post current selection to gist
* `:Gist -p` - create private gist
* `:Gist -P` - create public gist
* `:Gist -l` - list your public gists

#### ack.vim

Provides interface to Ack from within vim.
[http://github.com/mileszs/ack.vim](http://github.com/mileszs/ack.vim)

* `:Ack [options] {pattern}` - search for specified pattern showing results in vim quick fix window.

#### vim-rails

Provides bunch of Ruby on Rails specific functionality.
[http://github.com/tpope/vim-rails](http://github.com/tpope/vim-rails)

* `gf` - gives the standard `gf` command knowledge about partials, fixtures, and much more.

#### vim-markdown

Provides syntax highlighting for Markdown files.
[http://github.com/tpope/vim-markdown](http://github.com/tpope/vim-markdown)

#### vim-fugitive

Provides full blown Git interface inside of Vim. This is very valuble in my
opinion and is worth spending some time learning as it will make your life much
easier.
[http://github.com/tpope/vim-fugitive](http://github.com/tpope/vim-fugitive)

#### vim-ctrlp

[https://github.com/kien/ctrlp.vim](https://github.com/kien/ctrlp.vim)

#### vim-matchit

[http://www.vim.org/scripts/script.php?script_id=39](http://www.vim.org/scripts/script.php?script_id=39)

#### ruby-matchit

[https://github.com/vim-scripts/ruby-matchit](https://github.com/vim-scripts/ruby-matchit)

#### vim-elixir

[https://github.com/elixir-lang/vim-elixir.git](https://github.com/elixir-lang/vim-elixir.git)
