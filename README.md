# CiviCRM/Drupal on Pantheon
A minimally-patched CiviCRM for Drupal on Pantheon platform.

## Quick installation

1. Spin up a fresh Pantheon Drupal 7 site at http://getpantheon.com.
2. Clone a copy of the Pantheon install locally (following Pantheon's steps).
3. Choose which branch you want: 4.6.x tracks CiviCRM 4.6 Long-term support; 4.7.x tracks CiviCRM 4.7 the latest release.
3. Download this repository and place just the civicrm folder into sites/all/modules.
4. Either use SFTP mode to upload the civicrm folder, or commit it with git and push the changes up.
5. Make sure you are in SFTP mode while installing the database so Pantheon can create civicrm.settings.php in sites/default.
6. Login to your Drupal site with Administrator level permissions.
7. Point your browser to the install script such as:

```
http://<your_drupal_home>/sites/all/modules/civicrm/install/index.php
```

Follow the rest of the installation guidelines here http://wiki.civicrm.org/confluence/display/CRMDOC/Drupal+Installation+Guide+for+CiviCRM+4.5+-+Drupal+7

## Advanced option

If you are going to use Redis there's an option to also use a patch which will store the Smarty templates in Redis instead of the file system, providing a performance and stability boost. In order to use this patch:

1. Go to civicrm_drupal_pantheon.make and uncomment the libraries[civicrm]... line where it says [OPTIONAL IF USING REDIS]
2. On your own computer you will need drush installed
3. Run the command from the civicrm-drupal-pantheon folder: `drush make --no-core civicrm_drupal_pantheon.make`
4. Copy the civicrm folder from sites/all/modules to your Pantheon install, replacing any civicrm folder already there.
5. Upload with SFTP or push with git.
6. Clear cache from Pantheon dashboard.
