# CiviCRM/Drupal on Pantheon
A minimally-patched CiviCRM for Drupal on Pantheon platform.

## Installation

1. Spin up a fresh Pantheon Drupal 7 site at http://getpantheon.com.
2. Clone a copy of the install locally.
3. Download this repository and place the civicrm folder into sites/all/modules.
4. Push changes to Pantheon.
5. Switch to SFTP so Pantheon can create civicrm.settings.php in sites/default.
6. Login to your Drupal site with Administrator level permissions.
7. Point your browser to the install script such as:

```
http://<your_drupal_home>/sites/all/modules/civicrm/install/index.php
```

Follow the rest of the installation guidelines here http://wiki.civicrm.org/confluence/display/CRMDOC/Drupal+Installation+Guide+for+CiviCRM+4.5+-+Drupal+7

Check civicrm-version.php to see what version has been patched. We'll start applying tags to help with this soon.

