<?php
class ClickRaysLib extends Controller {

	public function uninstallModule($lg_path){
		
		$this->config->load($lg_path);
		$arrContextOptions=array(
						    "ssl"=>array(
						        "verify_peer"=>false,
						        "verify_peer_name"=>false,
						    ),
		); 
		$request  = array(
						'config_admin_language' => $this->config->get('config_admin_language'),
						'config_language' => $this->config->get('config_language'),
						'store_email' => $this->config->get('config_email'),
						'store_telephone' => $this->config->get('config_telephone'),
						'store_logo' => HTTP_CATALOG . 'image/' . $this->config->get('config_logo'),
						'store_owner' => $this->config->get('config_owner'),
						'store_name' => $this->config->get('config_name'),
						'store_address' => $this->config->get('config_address'),
						'store_zone_id' => $this->config->get('config_zone_id'),
						'store_country_id' => $this->config->get('config_country_id'),
						'store_url' => HTTP_CATALOG,
						'pid' => $this->config->get('clickrays_module'),
						'pid_version' => $this->config->get('clickrays_module_version'),
						'status' => '0',
						'oc_version' => VERSION
				);
				
		@file_get_contents($this->config->get('clickrays_support') . 'module/crwh/update?'.http_build_query($request),false,stream_context_create($arrContextOptions));

	}
	
	public function installModule($lg_path){
		$this->config->load($lg_path);
		$arrContextOptions=array(
						    "ssl"=>array(
						        "verify_peer"=>false,
						        "verify_peer_name"=>false,
						    ),
		); 
		$request  = array(
						'config_admin_language' => $this->config->get('config_admin_language'),
						'config_language' => $this->config->get('config_language'),
						'store_email' => $this->config->get('config_email'),
						'store_telephone' => $this->config->get('config_telephone'),
						'store_logo' => HTTP_CATALOG . 'image/' . $this->config->get('config_logo'),
						'store_owner' => $this->config->get('config_owner'),
						'store_name' => $this->config->get('config_name'),
						'store_address' => $this->config->get('config_address'),
						'store_zone_id' => $this->config->get('config_zone_id'),
						'store_country_id' => $this->config->get('config_country_id'),
						'store_url' => HTTP_CATALOG,
						'pid' => $this->config->get('clickrays_module'),
						'pid_version' => $this->config->get('clickrays_module_version'),
						'status' => '1',
						'oc_version' => VERSION
				);
				
		@file_get_contents($this->config->get('clickrays_support') . 'module/crwh/update?'.http_build_query($request),false,stream_context_create($arrContextOptions));
		
	}

	public function ModuleUpdates($lg_path){
		$this->config->load($lg_path);
		$arrContextOptions=array(
						    "ssl"=>array(
						        "verify_peer"=>false,
						        "verify_peer_name"=>false,
						    ),
		); 
		$request  = array(
						'config_admin_language' => $this->config->get('config_admin_language'),
						'config_language' => $this->config->get('config_language'),
						'store_email' => $this->config->get('config_email'),
						'store_telephone' => $this->config->get('config_telephone'),
						'store_logo' => HTTP_CATALOG . 'image/' . $this->config->get('config_logo'),
						'store_owner' => $this->config->get('config_owner'),
						'store_name' => $this->config->get('config_name'),
						'store_address' => $this->config->get('config_address'),
						'store_zone_id' => $this->config->get('config_zone_id'),
						'store_country_id' => $this->config->get('config_country_id'),
						'store_url' => HTTP_CATALOG,
						'pid' => $this->config->get('clickrays_module'),
						'id' => $this->config->get('clickrays_module_id'),
						'pid_version' => $this->config->get('clickrays_module_version'),
						'status' => '1',
						'oc_version' => VERSION
				);
				
		$updates = @file_get_contents($this->config->get('clickrays_support') . 'modules/updates?'.http_build_query($request),false,stream_context_create($arrContextOptions));
		$output = json_decode($updates, true);
		 return $output;
		
	}
	
	public function Notification($lg_path){
		$this->config->load($lg_path);
		$arrContextOptions=array(
						    "ssl"=>array(
						        "verify_peer"=>false,
						        "verify_peer_name"=>false,
						    ),
		); 
		$request  = array(
						'config_admin_language' => $this->config->get('config_admin_language'),
						'config_language' => $this->config->get('config_language'),
						'store_email' => $this->config->get('config_email'),
						'store_telephone' => $this->config->get('config_telephone'),
						'store_logo' => HTTP_CATALOG . 'image/' . $this->config->get('config_logo'),
						'store_owner' => $this->config->get('config_owner'),
						'store_name' => $this->config->get('config_name'),
						'store_address' => $this->config->get('config_address'),
						'store_zone_id' => $this->config->get('config_zone_id'),
						'store_country_id' => $this->config->get('config_country_id'),
						'store_url' => HTTP_CATALOG,
						'pid' => $this->config->get('clickrays_module'),
						'id' => $this->config->get('clickrays_module_id'),
						'pid_version' => $this->config->get('clickrays_module_version'),
						'status' => '1',
						'oc_version' => VERSION
				);
				
		$notification = @file_get_contents($this->config->get('clickrays_support') . 'modules/notification?'.http_build_query($request),false,stream_context_create($arrContextOptions));
		$output = $notification;
		 return $output;
		
	}
	
	
	public function Related($lg_path){
		$this->config->load($lg_path);
		$arrContextOptions=array(
						    "ssl"=>array(
						        "verify_peer"=>false,
						        "verify_peer_name"=>false,
						    ),
		); 
		$request  = array(
						'config_admin_language' => $this->config->get('config_admin_language'),
						'config_language' => $this->config->get('config_language'),
						'store_email' => $this->config->get('config_email'),
						'store_telephone' => $this->config->get('config_telephone'),
						'store_logo' => HTTP_CATALOG . 'image/' . $this->config->get('config_logo'),
						'store_owner' => $this->config->get('config_owner'),
						'store_name' => $this->config->get('config_name'),
						'store_address' => $this->config->get('config_address'),
						'store_zone_id' => $this->config->get('config_zone_id'),
						'store_country_id' => $this->config->get('config_country_id'),
						'store_url' => HTTP_CATALOG,
						'pid' => $this->config->get('clickrays_module'),
						'id' => $this->config->get('clickrays_module_id'),
						'pid_version' => $this->config->get('clickrays_module_version'),
						'status' => '1',
						'oc_version' => VERSION
				);
				
		$related = @file_get_contents($this->config->get('clickrays_support') . 'modules/related?'.http_build_query($request),false,stream_context_create($arrContextOptions));
		$output = json_decode($related, true);
		 return $output;
		
	}
	
	public function Check($lg_path, $l){
		$this->config->load($lg_path);
		$arrContextOptions=array(
						    "ssl"=>array(
						        "verify_peer"=>false,
						        "verify_peer_name"=>false,
						    ),
		); 
		$request  = array(
						'config_admin_language' => $this->config->get('config_admin_language'),
						'config_language' => $this->config->get('config_language'),
						'store_email' => $this->config->get('config_email'),
						'store_telephone' => $this->config->get('config_telephone'),
						'store_logo' => HTTP_CATALOG . 'image/' . $this->config->get('config_logo'),
						'store_owner' => $this->config->get('config_owner'),
						'store_name' => $this->config->get('config_name'),
						'store_address' => $this->config->get('config_address'),
						'store_zone_id' => $this->config->get('config_zone_id'),
						'store_country_id' => $this->config->get('config_country_id'),
						'store_url' => HTTP_CATALOG,
						'pid' => $this->config->get('clickrays_module'),
						'id' => $this->config->get('clickrays_module_id'),
						'pid_version' => $this->config->get('clickrays_module_version'),
						'status' => '1',
						'l' => $l,
						'oc_version' => VERSION
				);
				

		$check = @file_get_contents($this->config->get('clickrays_support') . 'licenses/check?'.http_build_query($request),false,stream_context_create($arrContextOptions));
		$output = json_decode($check, true);
		if ($output['error']) {
		return true;	
		}
	}
	
}
