# vim-tinyplug

## Installation

### Vim

#### Unix

```
curl -fLo ~/.vim/autoload/tinyplug.vim --create-dirs \
    https://raw.githubusercontent.com/roryrjb/vim-tinyplug/master/tinyplug.vim
```

## Usage

### Example

```viml
call tinyplug#define([
    \ 'https://github.com/github/copilot.vim',
    \ 'https://github.com/tpope/vim-eunuch',
    \ 'https://github.com/itchyny/vim-cursorword',
    \ 'https://github.com/thirtythreeforty/lessspace.vim',
    \ 'https://github.com/tpope/vim-abolish',
    \ 'https://github.com/tpope/vim-commentary',
    \ 'https://github.com/tpope/vim-surround',
    \ 'https://github.com/tpope/vim-repeat',
    \ 'https://github.com/tpope/vim-endwise',
    \ 'https://github.com/tpope/vim-sleuth',
    \ 'https://github.com/tpope/vim-fugitive',
    \ 'https://github.com/dense-analysis/ale',
    \ ])
```

Reload `$MYVIMRC` and `:PluginSync` to install plugins.
