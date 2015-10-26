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
function smarty_core_write_file($params, &$smarty)
{
    // Smarty in Redis
    if ( function_exists('lock_acquire') && lock_acquire('smarty_core_write_file' . $params['filename'])) {

        $cache = CRM_Utils_Cache::singleton();
        $cache->set($params['filename'], $params['contents']);

        lock_release('smarty_core_write_file' . $params['filename']);
        return true;
    }
}

/* vim: set expandtab: */

?>
