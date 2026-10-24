#!/usr/bin/env bash

set -e

COMMON_PACKAGES="nvim ghostty zsh"
MAC_PACKAGES=""
LINUX_PACKAGES="sway"

echo "Which computer are you on?"
select computer in "Work Mac" "Living Room PC" "Framework" "Quit"; do
    case $computer in
        "Work Mac")
            PACKAGES="$COMMON_PACKAGES $MAC_PACKAGES"
            break
            ;;
        "Living Room PC"|"Framework")
            PACKAGES="$COMMON_PACKAGES $LINUX_PACKAGES"
            break
            ;;
        Quit)
            echo "Aborting."
            exit 0
            ;;
        *)
            echo "Invalid choice, please try again."
            ;;
    esac
done

echo "Installing packages: $PACKAGES"
stow --verbose --target="$HOME" --restow $PACKAGES
