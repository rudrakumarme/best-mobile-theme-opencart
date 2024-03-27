<?php
/**
░░░░░░░░╔╗░░░░░░░░░░░░░░░░░░░
░░░░░░░░║║░░░░░░░░░░░░░░░░░░░
╔══╦══╦═╝╠╦═╗╔══╦═╦══╦╗░╔╦══╗
║╔═╣╔╗║╔╗╠╣╔╗╣╔╗║╔╣╔╗║║░║║══╣
║╚═╣╚╝║╚╝║║║║║╚╝║║║╔╗║╚═╝╠══╠
╚══╩══╩══╩╩╝╚╩═╗╠╝╚╝╚╩═╗╔╩══╩
░░░░░░░░░░░░░╔═╝║░░░░╔═╝║░░░░
░░░░░░░░░░░░░╚══╝░░░░╚══╝░░░░

 *
 * @copyright  2020 codingrays - All Rights Reserved
 * @link       https://www.codingrays.in
 * @author     Codingrays
 * @version    2.0
 */


class ModelExtensionThemeBestMobileTheme extends Model {
  private $code = 'best_mobile_theme';

  public function install() {
    $file = DIR_APPLICATION . 'model/extension/theme/' . $this->code . '.sql';

    if (!file_exists($file)) {
      return;
    }

    $lines = file($file);

    if (!$lines) {
      return;
    }

    $sql = '';
    foreach ($lines as $line) {
      if ($line && (substr($line, 0, 2) != '--') && (substr($line, 0, 1) != '#')) {
        $sql .= $line;

        if (preg_match('/;\s*$/', $line)) {
		  $sql = str_replace("DELETE FROM `", "DELETE FROM `" . DB_PREFIX, $sql);
          $sql = str_replace("DROP TABLE IF EXISTS `", "DROP TABLE IF EXISTS `" . DB_PREFIX, $sql);
          $sql = str_replace("CREATE TABLE `", "CREATE TABLE `" . DB_PREFIX, $sql);
		  $sql = str_replace("CREATE TABLE IF NOT EXISTS `", "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX, $sql);
          $sql = str_replace("INSERT INTO `", "INSERT INTO `" . DB_PREFIX, $sql);

          $this->db->query($sql);

          $sql = '';
        }
      }
    }
	
			// ##################################
		// Add best_mobile_theme Modification
		// ##################################
        
		if ((float)VERSION >= 3.0) {
		$this->load->model('setting/modification');
		$modification_prefix = 'model_setting_modification';
		$xml = file_get_contents(DIR_APPLICATION . '/view/javascript/best_mobile_theme/main_ocmod/best_mobile_theme_3X.ocmod.xml');
		} else {
		$this->load->model('extension/modification');
		$modification_prefix = 'model_extension_modification';
		$xml = file_get_contents(DIR_APPLICATION . '/view/javascript/best_mobile_theme/main_ocmod/best_mobile_theme_23.ocmod.xml');
		}
        
		$data = array(
            'name' => 'Best Mobile Theme Lite',
            'code' => 'best_mobie_theme_pro',
			'id' => 'best_mobile_theme_pro',
			'extension_install_id' => 'best_mobile_theme',
            'author' => 'Codingrays.in',
            'version' => 'v2.0',
            'xml' => $xml,
            'link' => 'https://www.codingrays.in',
            'status' => '1',
        );
		
		//$mod = $this->$modification_prefix->getModificationByCode('best_mobile_theme_theme');
        //if (!$mod) {
        //$this->$modification_prefix->addModification($data);
		//}
	


	
  }
  
   public function uninstall() {
    $file = DIR_APPLICATION . 'model/extension/theme/' . $this->code . '.sql';

    if (!file_exists($file)) {
      return;
    }

    $lines = file($file);

    if (!$lines) {
      return;
    }

    $sql = '';
    foreach ($lines as $line) {
      if ($line && (substr($line, 0, 2) != '--') && (substr($line, 0, 1) != '#')) {
        $sql .= $line;

        if (preg_match('/;\s*$/', $line)) {
		  $sql = str_replace("DELETE FROM `", "DELETE FROM `" . DB_PREFIX, $sql);


          $this->db->query($sql);

          $sql = '';
        }
      }
    }
	
  }
  
}
