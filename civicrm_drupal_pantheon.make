; This make file is based on civicrm_starterkit but can be used for
; CiviCRM in sites/all/modules
; drush make --no-core civicrm_drupal_pantheon.make

api = 2
core = 7.50

; ====== CIVICRM RELATED =========

libraries[civicrm][download][type] = get
libraries[civicrm][download][url] = "https://download.civicrm.org/civicrm-4.7.19-drupal.tar.gz"
libraries[civicrm][destination] = modules
libraries[civicrm][directory_name] = civicrm

;PANTHEON RELATED PATCHES
; Settings for Pantheon (d.o/node/2082713 originally)
libraries[civicrm][patch][pantheonsettings] = ./patches/pantheon-settings-47.patch

; provide modulepath to populate settings
; https://www.drupal.org/node/2063371
libraries[civicrm][patch][2063371] = ./patches/2063371-add-modulePath-var-4-4.patch

; Set session for cron.
; Matches settings in CiviCRM core for extern/*.
libraries[civicrm][patch][cron] = ./patches/cron.patch

; Patch IPN
; libraries[civicrm][patch][externbootstrap] = ./patches/extern-cms-bootstrap.patch
; libraries[civicrm][patch][ipn] = ./patches/ipn.patch
; libraries[civicrm][patch][ipnstd] = ./patches/ipnStd.patch

; May be necessary where extension, etc paths are cached but Pantheon changes binding
; https://www.drupal.org/node/2347897
libraries[civicrm][patch][2347897] = ./patches/binding-extension-47-2347897.patch

; Required for install
; Populate with Pantheon environment settings on install
; https://www.drupal.org/node/1978838
libraries[civicrm][patch][1978838] = ./patches/pre-populate-db-settings-47-1978838.patch

; Related to https://issues.civicrm.org/jira/browse/CRM-9683
libraries[civicrm][patch][2130213] = ./patches/ignore-timezone-on-install-47-2130213.patch

; Necessary if CiviCRM in profiles/*/modules/civicrm
; https://www.drupal.org/node/1844558
; libraries[civicrm][patch][profiles] = ./patches/settings_location-for-profiles.patch

; Fix Fatal error: Call to undefined function module_exists() in CRM/Utils/System/Drupal.php
; https://www.drupal.org/node/1967972
; libraries[civicrm][patch][1967972] = ./patches/bootstrap-fix-47-1967972.patch

; [OPTIONAL IF USING REDIS] Use CiviCRM cache functions to use Redis for storing compiled Smarty templates (Based on github.com/ojkelly commit 85e04b6)
; Unconventional but CiviCRM works faster and fewer errors in trying to load templates
; libraries[civicrm][patch][smartyredis] = ./patches/smarty-redis-civi-cache-47.patch
