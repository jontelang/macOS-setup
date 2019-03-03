#!/bin/bash

echo " Ask for the administrator password for the duration of this script"
sudo -v

echo " Keep-alive: update existing sudo time stamp until .osx has finished"
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo " Expand save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

echo " Expand print panel by default"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

echo " Automatically illuminate built-in MacBook keyboard in low light"
defaults write com.apple.BezelServices kDim -bool true

echo " Turn off keyboard illumination when computer is not used for 5 minutes"
defaults write com.apple.BezelServices kDimTime -int 300

echo " Show IP address, hostname, OS version when clicking the clock in the login window"
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

echo " Allow copying text from quick look"
sudo defaults write com.apple.finder QLEnableTextSelection -bool TRUE

echo " Trackpad: enable tap to click for this user and for the login screen"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

echo " Trackpad: map bottom right corner to right-click"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

echo " Increase sound quality for Bluetooth headphones/headsets"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

echo " Enable full keyboard access for all controls"
echo " (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo " Require password immediately after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

echo " Finder: show hidden files by default"
defaults write com.apple.finder AppleShowAllFiles -bool true

echo " Finder: show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo " Finder: show status bar"
defaults write com.apple.finder ShowStatusBar -bool true

echo " Avoid creating .DS_Store files on network volumes and USB volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

echo " Use list view in all Finder windows by default"
# Four-letter codes for the other view modes: icnv, clmv, Flwv", "Nlsv"
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

echo " Disable the warning before emptying the Trash"
defaults write com.apple.finder WarnOnEmptyTrash -bool false

echo " Empty Trash securely by default"
defaults write com.apple.finder EmptyTrashSecurely -bool true

echo " Shows extensions in Finder"
defaults write -g AppleShowAllExtensions -bool true

echo " Shows hidden files in Finder"
defaults write com.apple.finder AppleShowAllFiles true

echo " Show full path in Finder"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

echo " Allow quit finder"
defaults write com.apple.finder QuitMenuItem -bool true

echo " Automatically hide and show the Dock"
defaults write com.apple.dock autohide -bool true

echo " Remove delay when hiding the dock"
defaults write com.apple.dock autohide-delay -float 0

echo " Hot corners"
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad

echo " Top left screen corner → Application windows"
defaults write com.apple.dock wvous-tl-corner -int 3
defaults write com.apple.dock wvous-tl-modifier -int 0

echo " Top right screen corner → Mission Control"
defaults write com.apple.dock wvous-tr-corner -int 2
defaults write com.apple.dock wvous-tr-modifier -int 0

echo " Bottom left screen corner → Sleep"
defaults write com.apple.dock wvous-bl-corner -int 10
defaults write com.apple.dock wvous-bl-modifier -int 0

echo " Bottom right screen corner → Desktop"
defaults write com.apple.dock wvous-br-corner -int 4
defaults write com.apple.dock wvous-br-modifier -int 0

###########################################

# Bash PS1

###########################################

echo "Done.  Restart computer to see all changes"
