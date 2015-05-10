# soft links pointing to git rep settings

```
ln -s .my-settings/.bash_prompt .bash_prompt
ln -s .my-settings/.bash_profile .bash_profile
ln -s .my-settings/.emacs.d/ .emacs.d
ln -s .my-settings/.latexmkrc .latexmkrc
ln -s .my-settings/.vimrc.local .vimrc.local
```

# apps to be installed via terminal

```
brew install --with-cocoa --srgb emacs
brew install python
install xcode
brew install Caskroom/cask/mactex
brew install homebrew/tex/auctex
brew install macvim --with-cscope --with-lua --HEAD
install spf13 vimrc
brew cask install macdown
brew cask install appcleaner
```

> Don't install skim via brew cask as the emacs sync will not work. 