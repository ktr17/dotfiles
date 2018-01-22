#!/bin/bash

ostype=$(uname -a)

if [[ $ostype =~ "Darwin" ]]
then
    # Macの場合
    ln -s ~/dotfiles/tex/texplugin/xcolor/ /usr/local/texlive/texmf-local/tex/latex/local/
    ln -s ~/dotfiles/tex/texplugin/otf/ /usr/local/texlive/texmf-local/tex/latex/local/
    ln -s ~/dotfiles/tex/texplugin/etoolbox/ /usr/local/texlive/texmf-local/tex/latex/local/
    ln -s ~/dotfiles/tex/texplugin/fancyhdr/ /usr/local/texlive/texmf-local/tex/latex/local/
    ln -s ~/dotfiles/tex/texplugin/plistings/ /usr/local/texlive/texmf-local/tex/latex/local/
    ln -s ~/dotfiles/tex/texplugin/titlesec/ /usr/local/texlive/texmf-local/tex/latex/local/
    ln -s ~/dotfiles/tex/texplugin/tools/ /usr/local/texlive/texmf-local/tex/latex/local/
    ln -s ~/dotfiles/tex/texplugin/listings/ /usr/local/texlive/texmf-local/tex/latex/local/
elif [[ $ostype =~ "Linux" ]]
then
    # Linuxの場合
    ln -s ~/dotfiles/tex/texplugin/xcolor/ /usr/share/texlive/texmf-dist/tex/latex/
    ln -s ~/dotfiles/tex/texplugin/otf/ /usr/share/texlive/texmf-dist/tex/latex/
    ln -s ~/dotfiles/tex/texplugin/etoolbox/ /usr/share/texlive/texmf-dist/tex/latex/
    ln -s ~/dotfiles/tex/texplugin/fancyhdr/ /usr/share/texlive/texmf-dist/tex/latex/
    ln -s ~/dotfiles/tex/texplugin/plistings/ /usr/share/texlive/texmf-dist/tex/latex/
    ln -s ~/dotfiles/tex/texplugin/titlesec/ /usr/share/texlive/texmf-dist/tex/latex/
    ln -s ~/dotfiles/tex/texplugin/tools/ /usr/share/texlive/texmf-dist/tex/latex/
    ln -s ~/dotfiles/tex/texplugin/listings/ /usr/share/texlive/texmf-dist/tex/latex/
else
    echo "osが不明です"
fi

mktexlsr
