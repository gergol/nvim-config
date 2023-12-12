#!/bin/bash
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

function check_and_activate_or_create_venv() {
    if lsvirtualenv | grep -q "$1"; then
        workon "$1"
    else
        mkvirtualenv "$1"
    fi
}

check_and_install unzip
check_and_install curl
check_and_install wget
check_and_install cmake
check_and_install npm nodejs npm
check_and_install fzf

install_nvim
install_git
install_virtualenv
check_and_activate_or_create_venv neovim
pip3 install neovim
clone_or_update_nvim_config




# install nvim for all users


