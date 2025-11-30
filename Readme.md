```
chmod +x setup_mac.sh && ./setup_mac.sh
```



I download following things to prep my mac:

1. use https://github.com/philc/vimium to download firefox 
2. /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
3. brew install --cask flycut
4. Install python, nodejs and vscode using homebrew
5. sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && brew install zsh-autosuggestions. To activate the autosuggestions, add the following at the end of your .zshrc:

    source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

You will also need to restart your terminal for this change to take effect.

Enjoy! 
(This repo is open to contributions)
