; Drush make file for running CiviCRM on Pantheon.
; Steps:
; Go to the webroot: cd {webroot}
; Delete old civicrm folder: rm -r sites/all/modules/civicrm
; Run drush make: drush make --no-core sites/all/civicrm-drupal-pantheon/civicrm_drupal_pantheon.make

api = 2
core = 7.50

; Drupal Core
projects[drupal][version] = "7.51"

; ====== CIVICRM RELATED =========

libraries[civicrm][download][type] = get
libraries[civicrm][download][url] = "https://download.civicrm.org/civicrm-5.0.2-drupal.tar.gz"
libraries[civicrm][destination] = modules
libraries[civicrm][directory_name] = civicrm

;PANTHEON RELATED PATCHES
; Settings for Pantheon (d.o/node/2082713 originally)
; Private folders: https://civicrm.org/advisory/civi-sa-2014-001-risk-information-disclosure
; Define [civicrm.files] and [civicrm.private] paths since there is no htaccess file
; to set public/private folders.
libraries[civicrm][patch][pantheonsettings] = ./patches/pantheon-settings-50.patch
libraries[civicrm][patch][publicfiledir] = ./patches/public_files_config.patch

; Set session for cron.
; Matches settings in CiviCRM core for extern/*.
libraries[civicrm][patch][cron] = ./patches/cron.patch

; IPN: bootstrap Drupal
libraries[civicrm][patch][externbootstrap] = ./patches/extern-cms-bootstrap.patch

; IPN: Separate Paypal Pro and Standard into separate calls [deprecated]
libraries[civicrm][patch][ipn] = ./patches/ipn.patch
libraries[civicrm][patch][ipnstd] = ./patches/ipnStd.patch

; May be necessary where extension, etc paths are cached but Pantheon changes binding
; https://www.drupal.org/node/2347897
libraries[civicrm][patch][2347897] = ./patches/binding-extension-47-2347897.patch

; === Installer ===

; Ensure the baseURL is correct in the installer in Pantheon.
libraries[civicrm][patch][installerbaseurl] = ./patches/installer-baseurl.patch

; Related to https://issues.civicrm.org/jira/browse/CRM-9683
libraries[civicrm][patch][2130213] = ./patches/ignore-timezone-on-install-47-2130213.patch

; provide modulepath to populate settings
; https://www.drupal.org/node/2063371
libraries[civicrm][patch][2063371] = ./patches/2063371-add-modulePath-var-4-4.patch

; Populate with Pantheon environment settings on install
; https://www.drupal.org/node/1978838
libraries[civicrm][patch][pre-populate-installer] = ./patches/pre-populate-installer.patch
; https://www.drupal.org/node/1849424
libraries[civicrm][patch][1849424-pass] = ./patches/pass-vars-in-install-link.patch

; Cached Symfony container
; This is a potential issue but not clear at the moment--like it will just rebuild the php file.
; If concerned can set it to skip caching the container. In civicrm.settings.php set:
; define('CIVICRM_CONTAINER_CACHE', 'never');

; [OPTIONAL] SMTP patch for PHP 5.6+
; https://civicrm.stackexchange.com/questions/16628/outgoing-mail-settings-civismtp-php-5-6-x-problem
libraries[civicrm][patch][smtpverify] = ./patches/smtp-disable-peer-verification.patch
