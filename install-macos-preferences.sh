#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Set computer name (as done via System Preferences → Sharing)
sudo scutil --set ComputerName "Benoit's MacBook Pro"
sudo scutil --set HostName "mbpro-benoitboucart"
sudo scutil --set LocalHostName "mbpro-benoitboucart"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "mbpro-benoitboucart"

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Allow apps from anywhere
sudo spctl --master-disable

# Disable guest user
# sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool false
#
# # Fast user switching
# sudo defaults write /Library/Preferences/.GlobalPreferences MultipleSessionEnabled -bool YES
# defaults write -g userMenuExtraStyle -int 1
#
# # Enable snap-to-grid for icons on the desktop and in other icon views
# /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
#
# # Dock tilesize
# defaults write com.apple.dock tilesize -int 50
#
# # Icon size of magnified Dock items
# defaults write com.apple.dock largesize -int 64
#
# # Minimization effect: 'genie', 'scale', 'suck'
# defaults write com.apple.dock mineffect -string 'scale'
#
# # Use normal function keys
# defaults write -g com.apple.keyboard.fnState -bool true
#
# # Menu bar: show remaining battery time as percentage
defaults write com.apple.menuextra.battery ShowPercent -bool true

# # Expand save panel by default
# defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
# defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
#
# # Expand print panel by default
# defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
# defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
#
# # Automatically quit printer app once the print jobs complete
# defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
#
# # Disable the “Are you sure you want to open this application?” dialog
# defaults write com.apple.LaunchServices LSQuarantine -bool false
#
# # Check for software updates daily, not just once per week
# defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
#
# # Save to disk (not to iCloud) by default
# defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
#
# # Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons
# defaults write com.apple.finder QuitMenuItem -bool true
#
# # Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# # Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# # Automatically hide and show the Dock
# defaults write com.apple.dock autohide -bool true
#
# # Remove dock delay when hiding
# defaults write com.apple.Dock autohide-delay -float 0
#
# # Bottom right screen corner → Start screen saver
# defaults write com.apple.dock wvous-br-corner -int 5
# defaults write com.apple.dock wvous-br-modifier -int 0
#
# # Disable local Time Machine snapshots
# sudo tmutil disablelocal
#
# # Use scroll gesture with the Ctrl (^) modifier key to zoom
# defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
# defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
#
# # Follow the keyboard focus while zoomed in
# defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true
#
# # Increase sound quality for Bluetooth headphones/headsets
# defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40
#
# # Trackpad: map bottom right corner to right-click
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
# defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
# defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true
#
# # Trackpad: enable tap to click for this user and for the login screen
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
# defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
# defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
#
# # Stop iTunes from responding to the keyboard media keys
# launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null
#
# # Disable press-and-hold for keys in favor of key repeat
# defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
#
# # Set a blazingly fast keyboard repeat rate
# defaults write NSGlobalDomain KeyRepeat -int 1
# defaults write NSGlobalDomain InitialKeyRepeat -int 15
#
# # Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 5

# # Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Pictures/Screenshots"

# # Disable shadow in screenshots
# defaults write com.apple.screencapture disable-shadow -bool true
#
# # Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
# defaults write com.apple.screencapture type -string "jpg"
#
# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# # Enable Dashboard
# defaults write com.apple.dashboard mcx-disabled -bool false
#
# # Show Dashboard as a Space
# defaults write com.apple.dock dashboard-in-overlay -bool false

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# # Show icons for hard drives, servers, and removable media on the desktop
# defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
# defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
# defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
# defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
#
# # Automatically open a new Finder window when a volume is mounted
# defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
# defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
# defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true
#
# # Set language and text formats
# # Note: if you’re in the US, replace `EUR` with `USD`, `Centimeters` with
# # `Inches`, `en_GB` with `en_US`, and `true` with `false`.
# defaults write NSGlobalDomain AppleLanguages -array "en" "nl"
# defaults write NSGlobalDomain AppleLocale -string "en_GB@currency=EUR"
# defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
# defaults write NSGlobalDomain AppleMetricUnits -bool true
#
# # Set the timezone; see `sudo systemsetup -listtimezones` for other values
# sudo systemsetup -settimezone "Europe/Brussels" > /dev/null
#
# # Disable auto-correct
# defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
#
# # Disable hibernation (speeds up entering sleep mode)
# sudo pmset -a hibernatemode 0
#
# # Remove the sleep image file to save disk space
# sudo rm /private/var/vm/sleepimage
#
# # Create a zero-byte file instead…
# sudo touch /private/var/vm/sleepimage
#
# # …and make sure it can’t be rewritten
# sudo chflags uchg /private/var/vm/sleepimage
#
# # Disable smart quotes as they’re annoying when typing code
# defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
#
# # Disable smart dashes as they’re annoying when typing code
# defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
#
# # Show the main window when launching Activity Monitor
# defaults write com.apple.ActivityMonitor OpenMainWindow -bool true
#
# # Visualize CPU usage in the Activity Monitor Dock icon
# defaults write com.apple.ActivityMonitor IconType -int 5
#
# # Show all processes in Activity Monitor
# defaults write com.apple.ActivityMonitor ShowCategory -int 0
#
# # Sort Activity Monitor results by CPU usage
# defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
# defaults write com.apple.ActivityMonitor SortDirection -int 0
