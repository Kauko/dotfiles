#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

SOURCE="$(realpath .)"
DESTINATION="$(realpath ~/.config/fish)"

info "Setting up fish shell..."

substep_info "Creating fish config folders..."
mkdir -p "$DESTINATION/functions"
mkdir -p "$DESTINATION/completions"
mkdir -p "$DESTINATION/conf.d"

find * -name "*.fish" | while read fn; do
    symlink "$SOURCE/$fn" "$DESTINATION/$fn"
done

function set_fish_shell() {
    if grep --quiet fish <<< "$SHELL"; then
        success "Fish shell is already set up."
    else
        substep_info "Adding fish executable to /etc/shells"
        if grep --fixed-strings --line-regexp --quiet "/usr/local/bin/fish" /etc/shells; then
            substep_success "Fish executable already exists in /etc/shells."
        else
            if sudo bash -c "echo /usr/local/bin/fish >> /etc/shells"; then
                substep_success "Fish executable added to /etc/shells."
            else
                substep_error "Failed adding Fish executable to /etc/shells."
                return 1
            fi
        fi
        substep_info "Changing shell to fish"
        if sudo chsh -s /usr/local/bin/fish; then
            substep_success "Changed shell to fish"
        else
            substep_error "Failed changing shell to fish"
            return 2
        fi
        substep_info "Running fish initial setup"
        fish -c "setup"
    fi
}

function install_tacklebox() {
    substep_info "Installing Tacklebox and Tackle using Tacklebox's install script"
    if curl -L https://raw.githubusercontent.com/justinmayer/tacklebox/master/tools/install.fish | fish; then
        substep_success "Tacklebox installed"
    else
        substep_error "Failed to install Tacklebox"
        return 1
    fi
}



function install_omf() {
    substep_info "Installing Oh-My-Fish!"
    if curl -L https://get.oh-my.fish | fish; then
        substep_success "Oh-my-Fish installed"
    else
        substep_error "Failed to install Oh-my-fish!"
        return 1
    fi
}

if set_fish_shell; then
    success "Successfully set up fish shell."
else
    error "Failed setting up fish shell."
fi

if install_tacklebox; then
    success "Successfully installed Tacklebox."
else
    error "Tacklebox installation failed."
fi

if install_omf; then
    success "Successfully installed OMF."
else
    error "OMF installation failed."
fi
