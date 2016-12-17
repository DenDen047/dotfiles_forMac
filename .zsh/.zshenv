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
export PATH=$PATH:/usr/local/bin
# export PYTHONPATH=/usr/local/lib/python2.7/site-packages:~/.virtualenvs/my_venv/lib/python2.7/site-packages:$PYTHONPATH
export PATH=$PATH:/usr/texbin
export GNUTERM=x11
export PYENV_ROOT=/usr/local/var/pyenv
export CFLAGS="-I$(xcrun --show-sdk-path)/usr/include"
export PATH=${PYENV_ROOT}/bin:$PATH
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
eval "$(pyenv virtualenv-init -)"

export PYENV_VIRTUALENV_DISABLE_PROMPT=1
# Cuda
export CUDA_ROOT=/Developer/NVIDIA/CUDA-7.5/
export PATH=$PATH:/Developer/NVIDIA/CUDA-7.5/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/Developer/NVIDIA/CUDA-7.5/lib
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/Developer/NVIDIA/CUDA-7.5/lib
export CPATH=$CPATH:/Developer/NVIDIA/CUDA-7.5/include
export CUDA_INC_DIR=$CUDA_INC_DIR:/Developer/NVIDIA/CUDA-7.5/bin
# Brewfile
export HOMEBREW_BREWFILE=/usr/local/Library/DenDen047_Brewfile/Brewfile

# docker
# docker-machine start default2
# eval "$(docker-machine env default2)"

# alias
alias brew="env PATH=${PATH/\/Users\/muramatsunaoya\/\.pyenv\/shims:/} brew"

