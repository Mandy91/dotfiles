#!/usr/bin/env bash

trap "exit" INT
set -e

function install() {
    code --install-extension "$@" >/dev/null
}

# @see https://itnext.io/why-i-wrote-33-vscode-extensions-and-how-i-manage-them-cb61df05e154

# Project management
install fabiospampinato.vscode-projects-plus
install fabiospampinato.vscode-terminals

#Vim
install fallenwood.viml

# Themes and keybindings
install k--kato.intellij-idea-keybindings
install pkief.material-icon-theme
install equinusocio.vsc-material-theme
install dracula-theme.theme-dracula
install robbowen.synthwave-vscode
install lkytal.flatui
install mbetacchini.massimo-theme



# Languages
install naumovs.color-highlight
install redhat.vscode-yaml
install malmaud.tmux
install ms-python.python
install jetmartin.bats

install streetsidesoftware.code-spell-checker
install mcright.auto-save


# Markdown
install chintans98.markdown-jira
install davidanson.vscode-markdownlint

# Intellisense
install christian-kohler.path-intellisense
install visualstudioexptteam.vscodeintellicode
install esbenp.prettier-vscode


install bmewburn.vscode-intelephense-client

install xyz.local-history
install mrmlnc.vscode-duplicate

install sourcegraph.sourcegraph


install mads-hartmann.bash-ide-vscode
install gruntfuggly.todo-tree

# Docker
install exiasr.hadolint
install ms-azuretools.vscode-docker
install ms-vscode-remote.remote-containers
install ms-vscode-remote.remote-ssh

# CI
install jvandyke.vscode-circleci

# PHP
install mandy91.vscode-phpstan
install felixfbecker.php-pack



# Typescript
install ms-vscode.vscode-typescript-tslint-plugin


# Git
install atlassian.atlascode
install eamodio.gitlens
install donjayamanne.githistory


install jomeinaster.bracket-peek