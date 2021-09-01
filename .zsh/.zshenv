#! /usr/bin/env zsh
# -*- mode: sh; coding: utf-8; indent-tabs-mode: nil -*-
#
export LANG=ja_JP.UTF-8

path=(
  {/usr/local,/usr,}{/bin,/sbin}(N-/)
)
typeset -gxU path
manpath=(
    {/usr,/usr/local}/share/man(N-/)
)
typeset -gxU manpath

[ -z "$ld_library_path" ] && typeset -xT LD_LIBRARY_PATH ld_library_path
[ -z "$include" ] && typeset -xT INCLUDE include
typeset -xU ld_library_path include

## function: auto-zcompile & source
function _auto_zcompile_source  () {
    local A; A=$1
    [[ -e "${A:r}.zwc" ]] && [[ "$A" -ot "${A:r}.zwc" ]] ||
    zcompile $A >/dev/null 2>&1 ; source $A
}

[ -f $ZDOTDIR/proxy ] && \
    _auto_zcompile_source $ZDOTDIR/proxy

[ -d $HOME/bin ] && path=( $HOME/bin $path )

### duplicate cleaning
typeset -gxU path cdpath fpath manpath ld_library_path include

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

#PATH
export PATH=/usr/local/bin:/usr/local/share/python:$PATH
export PATH=$PATH:/usr/texbin
export PATH="$PATH:/opt/homebrew/bin"
export GNUTERM=x11
export CFLAGS="-I$(xcrun --show-sdk-path)/usr/include"

# Go
export GOPATH="$HOME/go"

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

