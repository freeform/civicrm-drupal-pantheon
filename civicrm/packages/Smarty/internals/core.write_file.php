<?php
/**
 * Smarty plugin
 * @package Smarty
 * @subpackage plugins
 */

/**
 * write out a file to disk
 *
 * @param string $filename
 * @param string $contents
 * @param boolean $create_dirs
 * @return boolean
 */
function smarty_core_write_file($params, &$smarty) {
  // Modified for running from Redis
    if ( function_exists('lock_acquire') && lock_acquire('smarty_core_write_file' . $params['filename'])) {

        cache_set($params['filename'], $params['contents'], 'smarty');

        lock_release('smarty_core_write_file' . $params['filename']);
        return true;
    }
}

/* vim: set expandtab: */

?>