; This make file is based on civicrm_starterkit but can be used for
; CiviCRM in sites/all/modules
; drush make --no-core civicrm_drupal_pantheon.make

api = 2
core = 7.37

; ====== CIVICRM RELATED =========

libraries[civicrm][download][type] = get
libraries[civicrm][download][url] = "https://download.civicrm.org/civicrm-4.7.7-drupal.tar.gz"
libraries[civicrm][destination] = modules
libraries[civicrm][directory_name] = civicrm

;PANTHEON RELATED PATCHES
; Settings for Pantheon
libraries[civicrm][patch][pantheonsettings] = ./patches/pantheon-settings.patch

; Add default Pantheon environment settings (d.o/node/2082713 originally)
; Move civicrm files to sites/default/files/private/civicrm
; https://civicrm.org/advisory/civi-sa-2014-001-risk-information-disclosure
;ERROR libraries[civicrm][patch][1978796] = http://drupal.org/files/1978796-session.save-as_file.patch

; provide modulepath to populate settings
libraries[civicrm][patch][2063371] = http://drupal.org/files/2063371-add-modulePath-var-4-4.patch

; Required for extern urls to work (e.g. ipn.php, soap.php)
;ERROR libraries[civicrm][patch][2177647] = https://drupal.org/files/issues/2177647-sessions-fix.patch
libraries[civicrm][patch][externbootstrap] = ./patches/extern-cms-bootstrap.patch
libraries[civicrm][patch][ipn] = ./patches/ipn.patch
libraries[civicrm][patch][ipnstd] = ./patches/ipnStd.patch

; May be necessary where extension, etc paths are cached but Pantheon changes binding
;ERROR libraries[civicrm][patch][2347897] = ./patches/binding-fix-for-extension-v2.patch

; Skip config cache on Pantheon
;DELETE? IT'S ALL DIFFERENT NOW: libraries[civicrm][patch][config] = ./patches/skip-config-cache.patch

; Use CiviCRM cache functions to use Redis for storing compiled Smarty templates
; Based on github.com/ojkelly commit 85e04b6
;ERROR libraries[civicrm][patch][smartyredis] = ./patches/smarty-redis-civi-cache.patch

; Required for install
;ERROR Populate with Pantheon environment settings on install
libraries[civicrm][patch][1978838] = http://drupal.org/files/issues/1978838-pre-populate-db-settings-2.patch
; Related to https://issues.civicrm.org/jira/browse/CRM-9683
;ERROR libraries[civicrm][patch][2130213] = http://drupal.org/files/issues/2130213-ignore-timezone-on-install-2.patch

; Necessary if in profiles/*/modules/civicrm
;ERROR libraries[civicrm][patch][1844558] = https://drupal.org/files/issues/1844558-run-civicrm-from-profile-dir-config-3.patch
libraries[civicrm][patch][1967972] = http://drupal.org/files/1967972-bootsrap-fixes.patch

; Freeform specific
; Case start_date kludge
libraries[civicrm][patch][case] = ./patches/Case-start_date-kludge.patch
