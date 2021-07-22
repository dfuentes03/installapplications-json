#!/bin/bash

# ----------------------------------------------------------------------------------------------------------------------------
#          Title:           installapplications-preflight
#          Description:     Preflight script for InstallApplications to check if Munki is installed.
#          Credits:         jacobfgrant (https://github.com/jacobfgrant)
#          Created:         2021-07-22
# ----------------------------------------------------------------------------------------------------------------------------

# List installed packages
PKGS=$(pkgutil --pkgs)


# Check if munki is installed
if  [[ ! `echo "$PKGS" | grep 'com.googlecode.munki.admin'` ]] ||
    [[ ! `echo "$PKGS" | grep 'com.googlecode.munki.app'` ]] ||
    [[ ! `echo "$PKGS" | grep 'com.googlecode.munki.app_usage'` ]] ||
    [[ ! `echo "$PKGS" | grep 'com.googlecode.munki.core'` ]] ||
    [[ ! `echo "$PKGS" | grep 'com.googlecode.munki.launchd'` ]]
then
    # Munki not installed
    # Run InstallApplications
    exit 1
fi


# All tests passed
# Exit/remove InstallApplications
exit 0