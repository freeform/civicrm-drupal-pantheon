; This make file is based on civicrm_starterkit but can be used for
; CiviCRM in sites/all/modules
; drush make --no-core civicrm_drupal_pantheon.make

api = 2
core = 7.37

; ====== CIVICRM RELATED =========

libraries[civicrm][download][type] = get
libraries[civicrm][download][url] = "https://download.civicrm.org/civicrm-4.6.22-drupal.tar.gz"
libraries[civicrm][destination] = modules
libraries[civicrm][directory_name] = civicrm

;PANTHEON RELATED PATCHES
; Add default Pantheon environment settings (d.o/node/2082713 originally)
; Move civicrm files to sites/default/files/private/civicrm
; https://civicrm.org/advisory/civi-sa-2014-001-risk-information-disclosure
libraries[civicrm][patch][1978796] = http://drupal.org/files/1978796-session.save-as_file.patch

; provide modulepath to populate settings
libraries[civicrm][patch][2063371] = http://drupal.org/files/2063371-add-modulePath-var-4-4.patch

; Required for extern urls to work (e.g. ipn.php, soap.php)
libraries[civicrm][patch][2177647] = https://drupal.org/files/issues/2177647-sessions-fix.patch
libraries[civicrm][patch][cron] = https://www.drupal.org/files/issues/2819697-cron-civi46.patch
libraries[civicrm][patch][externbootstrap] = ./patches/extern-cms-bootstrap.patch
libraries[civicrm][patch][ipn] = ./patches/ipn.patch
libraries[civicrm][patch][ipnstd] = ./patches/ipnStd.patch

; May be necessary where extension, etc paths are cached but Pantheon changes binding
libraries[civicrm][patch][2347897] = https://www.drupal.org/files/issues/2347897-binding-fix-for-extension-civi46.patch

; Add Pantheon settings to civicrm.settings.php (http://forum.civicrm.org/index.php?topic=31570.0)
; Redis caching settings for Pantheon
libraries[civicrm][patch][pantheonsettings] = https://www.drupal.org/files/issues/2082713-pantheon-settings-civicrm-46-2.patch

; Add Redis caching
libraries[civicrm][patch][redis] = https://www.drupal.org/files/issues/2468687-redis-caching-civi46.patch

; Skip config cache on Pantheon
libraries[civicrm][patch][config] = https://www.drupal.org/files/issues/2096467-skip-config-cache-civi46.patch

; [OPTIONAL IF USING REDIS] Use CiviCRM cache functions to use Redis for storing compiled Smarty templates
; Based on github.com/ojkelly commit 85e04b6
;libraries[civicrm][patch][smartyredis] = https://www.drupal.org/files/issues/2570335-smarty-redis-civi-cache-civi46.patch

; Required for install
; Populate with Pantheon environment settings on install
libraries[civicrm][patch][1978838] = http://drupal.org/files/issues/1978838-pre-populate-db-settings-2.patch
; Related to https://issues.civicrm.org/jira/browse/CRM-9683
libraries[civicrm][patch][2130213] = http://drupal.org/files/issues/2130213-ignore-timezone-on-install-2.patch

; Necessary if in profiles/*/modules/civicrm
libraries[civicrm][patch][1844558] = https://drupal.org/files/issues/1844558-run-civicrm-from-profile-dir-config-3.patch
libraries[civicrm][patch][1967972] = http://drupal.org/files/1967972-bootsrap-fixes.patch

; == Not including these for now because might not be necessary ==
; Not necessary? OpenFlashChart is working
;libraries[civicrm][patch][1940074] = http://drupal.org/files/1940074-openFlashChart_tpl_javascript-4.patch

; Related to https://issues.civicrm.org/jira/browse/CRM-13737 -- reverts that change
; I don't know if it's necessary but needs to be tested by installing on Pantheon
;libraries[civicrm][patch][2153441] = https://drupal.org/files/issues/2153441_formatresourceurl-4.patch
;libraries[civicrm][patch][] = https://drupal.org/files/issues/2153441_formatresourceurl-5.patch
