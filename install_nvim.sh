#!/bin/bash
#
# This script unattendedly installs neovim and configures it.
#

function install_nvim() {
  if ! command -v "nvim" >/dev/null 2>&1; then
    echo >&2 "Installing nvim."
        sudo mkdir -p /opt/nvim/ && cd /opt/nvim/ || exit 1


        sudo wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
        sudo wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz.sha256sum

        sudo sha256sum -c nvim-linux64.tar.gz.sha256sum || exit 1

        sudo tar xzvf nvim-linux64.tar.gz
        sudo chmod +x nvim-linux64/bin/nvim
        sudo ln -s /opt/nvim/nvim-linux64/bin/nvim /usr/local/bin/nvim
  else
    return
  fi
}

function install_git() {
  if ! command -v "git" >/dev/null 2>&1; then
    echo >&2 "Installing git."
    sudo apt-get install git git-lfs -y
  else
    return
  fi
}

function check_and_install() {
    if ! command -v "$1" >/dev/null 2>&1; then
        echo >&2 "Installing packages for $1."
        if [ $# -gt 1 ]; then
            sudo apt-get install "${@:2}" -y
        else
            sudo apt-get install "$1" -y
        fi
    else
        return
    fi
}

function check_and_install_nvm() {
    if echo $NVM_DIR | grep -q "nvm"; then
        . $NVM_DIR/nvm.sh
        . $HOME/.profile
        . $HOME/.bashrc
    fi
    if ! command -v "nvm" >/dev/null 2>&1; then
        echo >&2 "Installing nvm."
        curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 
        source $HOME/.bashrc
        echo $NVM_DIR
        . $NVM_DIR/nvm.sh
        . $HOME/.profile
        . $HOME/.bashrc
        nvm install node
    else
        nvm install node
        return
    fi
}

function clone_or_update_nvim_config() {
  local repo_url="https://github.com/gergol/nvim-config.git"
  local folder_name="$(basename "$repo_url" .git)"
  local parent_dir="$HOME/.config"

  if [ ! -d "$parent_dir/$folder_name" ]; then
    git clone "$repo_url" "$parent_dir/$folder_name"
    ln -s "$parent_dir/$folder_name/nvim" "$HOME/.config/nvim"
  else
    cd "$parent_dir/$folder_name" && git pull
  fi
}

function install_lazygit() {
    if ! command -v "lazygit" >/dev/null 2>&1; then
        echo >&2 "Installing lazygit"
            LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
            curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
            tar xf lazygit.tar.gz lazygit
            sudo install lazygit /usr/local/bin   
    else
        return
    fi
}

function install_virtualenv() {
    check_and_install pip3 python3-pip
    if ! which virtualenvwrapper.sh >/dev/null 2>&1; then
        echo >&2 "Installing virtualenvwrapper"
        echo "export PATH=$PATH:$HOME/.local/bin" >> ~/.bashrc
        echo "export WORKON_HOME=$HOME/.virtualenvs" >> ~/.bashrc
        echo "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3" >> ~/.bashrc
        source $HOME/.bashrc
        pip3 install virtualenv virtualenvwrapper 
        source $HOME/.bashrc

        if [ -f "/usr/local/bin/virtualenvwrapper.sh" ]; then
            echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc
            source /usr/local/bin/virtualenvwrapper.sh
        else
            echo "source `which virtualenvwrapper.sh`" >> ~/.bashrc
            source `which virtualenvwrapper.sh`
        fi
      else
        source $HOME/.bashrc
        source `which virtualenvwrapper.sh`
        return
      fi
}

function check_and_install_python_package() {
    package_name=$1
    if ! pip3 show "$package_name" > /dev/null 2>&1; then
        echo "Installing $package_name..."
        pip3 install "$package_name"
    else
        echo "$package_name is already installed."
    fi
}

function check_and_activate_or_create_venv() {
    if lsvirtualenv | grep -q "$1"; then
        workon "$1"
    else
        mkvirtualenv "$1"
    fi
}

sudo apt update

source $HOME/.bashrc

check_and_install unzip
check_and_install curl
check_and_install wget
check_and_install cmake
check_and_install fzf
check_and_install ripgrep
check_and_install_nvm
check_and_install pip3 python3-pip

install_nvim
install_git
install_lazygit
install_virtualenv
check_and_activate_or_create_venv neovim
check_and_install_python_package neovim
clone_or_update_nvim_config




# install nvim for all users


