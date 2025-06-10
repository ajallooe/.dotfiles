# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> /Users/ajallooe/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/ajallooe/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
brew update
brew upgrade
# Install Python https://medium.com/marvelous-mlops/the-rightway-to-install-python-on-a-mac-
f3146d9d9a32
brew install pyenv pyenv-virtualenv
pyenv install -l
# pyenv install 3.13
# pyenv virtualenv 3.13 vent-ml
eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
# Create or Symlink Workspace mkdir workspace
cd workspace
mkdir ml_experiments
pyenv local vent-ml
pip install notebook ipython jupyterlab
pip install numpy pandas scipy scikit-learn
# https://pytorch.org/get-started/locally/
# https://developer.apple.com/metal/pytorch/
pip3 install --pre torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/nightly/cpu
pip install matplotlib seaborn plotly
pip install dtreeviz
pip install graphviz
pip install shap lime
pip install ipdb debugpy
pip install sympy
pip install rpy2
python -m pip install --upgrade pip

# Install Xcode, Classroom, Swift Playground, Shazam, KyPass, Notability, Magnet, Telegram, WhatsApp, Microsoft Office, OneDrive, Prime Video, X, Grammarly, Roozegar, Unarchiver
# Install Micorsoft Teams https://www.microsoft.com/en-us/microsoft-teams/download-app
# Install Zoom https://zoom.us/download
# Install Chrome https://openai.com/chatgpt/download/
# Install Google Drive Desktop https://support.google.com/a/users/answer/13022292?hl=en
# Install Microsoft Edge https://www.microsoft.com/en-us/edge/download?form=MA13FJ
# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Install Powerline10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
# Open ~/.zshrc, find the line that sets ZSH_THEME, and change its value to "powerlevel10k/powerlevel10k".
# Install iTerm2
brew install --cask iterm2
# Install Visual Studio Code
brew install --cask visual-studio-code
# Update iTerm2 Profile
# Base16 iTerm 2 Colors
# git clone https://github.com/chriskempson/base16-iterm2 ~/.config/themes/base16-iterm2
# Atom iTerm Theme
git clone https://github.com/nathanbuchar/atom-one-dark-terminal.git
# Install ChatGPT https://openai.com/chatgpt/download/
# Enable ChatGPT on Apple Intelligence
# Input Font
# https://input.djr.com/download/
# Nerd Fonts
brew install font-hack-nerd-font
# Nerd Font Patcher
brew install fontforge
# https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FontPatcher.zip
git clone https://github.com/ryanoasis/nerd-fonts
# Visual Studio Code Base16 themes
# Visual Studio Code Atom One Light/Dark Themes
# Vusial Studio Code set Window: Auto Detect Color Scheme, set themes, foint, Install GitHub Copilot

# Install Slack
brew install --cask slack
# Install Discord
brew install --cask discord
# Install Zotero
brew install --cask zotero
# Install Obsidian
brew install --cask obsidian
# Install Calibre
brew install --cask calibre
# Install Docker Desktop
brew install --cask docker
# Install GitHub CLI
brew install gh
# Install GitHub Desktop
brew install --cask github
# Install jq
brew install jq
# Install tree
brew install tree

# Install TeXLive
brew install texlive
# Install R
brew install R
R
# install.packages("IRkernel")
# IRkernel::installspec()  # Registers R with Jupyter
# Install Node.js
brew install node
# Install Pandoc
brew install pandoc
# Install direnv
brew install direnv
# Edit .envrc in the project directory and execute `direnv allow`

# Install Hammerspoon
brew install --cask hammerspoon
# Install AltTab
brew install --cask alt-tab


# Install GIMP
brew install --cask gimp
# Install Inkscape
brew install --cask inkscape
# Install Blender
brew install --cask blender
# Install IPE
brew install --cask ipe
# Install ImageMagick
brew install imagemagick

# Install EXIFTool
brew install exiftool
# Install VLC
brew install --cask vlc
# Install YAC Reader
brew install --cask yacreader
# Install qBittorrent
brew install --cask qbittorrent

# Install Bricklink Stud.io
brew install --cask bricklink-studio
# Install Brickstore
brew install --cask brickstore


# VSCode to iTerm2 theme converter
#npx @campvanilla/ditto-cli

# Install Calibre Web
# https://ipv6.rs/tutorial/macOS/Calibre_Web/
# https://github.com/janeczku/calibre-web
cd ~/programs
git clone https://github.com/janeczku/calibre-web.git
cd calibre-web
pyenv virtualenv 3.13 venv-calibre-web
penv local venv-calibre-web
pip install -r requirements.txt

# Install Logseq
brew install logseq

# Install Google Earth Pro https://www.google.com/earth/about/versions/#earth-pro
# Install CISCO AnyConnect
# Install KeePassXC
brew install --cask keepassxc

# Install bentoBox
brew install bentobox
# Install TeXShop
brew install --cask texshop

# Install Rosetta 2
softwareupdate --install-rosetta --agree-to-license

# Install VirtualBox
brew install --cask virtualbox
# Install CloudCompare
brew install --cask cloudcompare
# Obsidian Web Clipper https://obsidian.md/clipper
# Install Pocket V2Box

# Install ComfyUI
# https://medium.com/@tchpnk/comfyui-on-apple-silicon-from-scratch-2024-58def01a3319
git clone https://github.com/comfyanonymous/ComfyUI.git
cd ComfyUI
pyenv install 3.12
pyenv virtualenv 3.12 venv-comfyui
pyenv local venv-comfyui
python -m pip install --upgrade pip
pip3 install --pre torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/nightly/cpu
pip3 install -r requirements.txt
cd custom_nodes
git clone https://github.com/ltdrdata/ComfyUI-Manager.git
pip3 install onnxruntime
pip3 install --upgrade certifi
# Install Oh My Zsh Plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# Add the plugin to the list of plugins for Oh My Zsh to load (inside ~/.zshrc):
# plugins=( 
#     git
#     zsh-autosuggestions
#     zsh-syntax-highlighting
# )

# Add previous Oh My Zsh config
# # Old configuration 
# if [ -f "$HOME/.zshrc.pre-oh-my-zsh" ]; then
#      source "$HOME/.zshrc.pre-oh-my-zsh" 
# fi
