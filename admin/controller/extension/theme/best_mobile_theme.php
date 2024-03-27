<?php
class ControllerExtensionThemeBestMobileTheme extends Controller {
	private $moduleName;
    private $modulePath;
    private $moduleModel;
	private $moduleVersion;
    private $extensionsLink;
    private $callModel;
    private $vendorFolder;
    private $error  = array(); 
    private $data   = array();
	
	    public function __construct($registry) {
        parent::__construct($registry);
		
		if(!isset($this->clickrays_platform)){
			$clickrays_platform = new clickraysLib($this->registry);
			$this->registry->set('clickrays_platform', $clickrays_platform);
		}	
        
        // Config Loader
        $this->config->load('clickrays/bmt');

        // Token
        $this->data['token_string'] = $this->config->get('best_mobile_theme_token_string');
        $this->data['token']        = $this->session->data[$this->data['token_string']];
        $this->data['token_addon']  = $this->data['token_string'] . '=' . $this->data['token'];
        
        /* Fill Main Variables - Begin */
        $this->moduleName           = $this->config->get('best_mobile_theme_name');
        $this->callModel            = $this->config->get('best_mobile_theme_model');
        $this->modulePath           = $this->config->get('best_mobile_theme_path');
		$this->modulePaths           = $this->config->get('best_mobile_theme_paths');
		$this->val 					= $this->config->get('clickrays_support');
		$this->pid 					= $this->config->get('clickrays_module');
		$this->pid2 				= base64_encode($this->pid);
		$this->moduleC				= $this->config->get('best_mobile_theme_clickrays');
		
		
        $this->moduleVersion        = $this->config->get('best_mobile_theme_version'); 
		$this->VerifyModule        = $this->config->get('best_mobile_theme');
		$this->moduleT           = 	empty($this->config->get('best_mobile_theme')) ? $this->modulePaths : $this->modulePath;
        $this->extensionsLink       = $this->url->link($this->config->get('best_mobile_theme_link'), $this->data['token_addon'] . $this->config->get('best_mobile_theme_link_params'), 'SSL');
        $this->vendorFolder         = $this->config->get('best_mobile_theme_vendor_folder');
        /* Fill Main Variables - End */
                
        // Load Model
        $this->load->model($this->modulePath);
        
		
		
        // Model Instance
        $this->moduleModel          = $this->{$this->callModel};
        
        // Multi-Store
        $this->load->model('setting/store');
        // Settings
        $this->load->model('setting/setting');
        // Multi-Lingual
        $this->load->model('localisation/language');
        
        // Languages
        $this->language->load($this->modulePath);
		$language_strings = $this->language->load($this->modulePath);
        foreach ($language_strings as $code => $languageVariable) {
			$this->data[$code] = $languageVariable;
		}
        
        // Variables
        $this->data['moduleName']   = $this->moduleName;
        $this->data['modulePath']   = $this->modulePath;
		$this->data['val'] = $this->val;
		$this->data['pid'] = $this->pid2;
    }

	// Install module
	public function install() {
		
				if ((float) VERSION >= 3.0) {
		// add event handlers
		$this->load->model('setting/event');
		$code = 'module_template_switcher';
		$check_event = $this->model_setting_event->getEventByCode($code);
		if (!$check_event) {
		$app = 'catalog/';
		$trigger = 'view/*/before';
		$route = 'extension/module/template_switcher/override';
		$this->model_setting_event->addEvent( $code, $app.$trigger, $route, 1, 499 );
		$route = 'extension/module/template_switcher/render';
		$this->model_setting_event->addEvent( $code, $app.$trigger, $route, 1, 999 );
		$trigger = 'controller/*/before';
		$route = 'extension/module/template_switcher/before';
		$this->model_setting_event->addEvent( $code, $app.$trigger, $route, 1, 0 );
		$app = 'admin/';
		$trigger = 'view/*/before';
		$route = 'extension/module/template_switcher/override';
		$this->model_setting_event->addEvent( $code, $app.$trigger, $route, 1, 0 );
		$trigger = 'view/design/layout_form/before';
		$route = 'extension/module/template_switcher/eventViewDesignLayoutFormBefore';
		$this->model_setting_event->addEvent( $code, $app.$trigger, $route, 1, 0 );
		
		}
		
		}
		
		$this->clickrays_platform->installModule($this->moduleC);
		$this->load->model('extension/theme/best_mobile_theme');
		$this->model_extension_theme_best_mobile_theme->install();

		if (isset($this->request->get['quick_install']) && (int)$this->request->get['quick_install'] == 1) {
			$this->session->data['success'] = $this->language->get('text_success');
			$this->response->redirect($this->url->link('extension/theme/best_mobile_theme&store_id=0', $this->data['token_addon'] . '&type=theme', true));
		}
	}
	
	// Uninstall module
	public function uninstall() {
		$this->clickrays_platform->uninstallModule($this->moduleC);
		$this->load->model('extension/theme/best_mobile_theme');
		$this->model_extension_theme_best_mobile_theme->uninstall();
    }

	public function index() {

			$updates = $this->clickrays_platform->ModuleUpdates($this->moduleC);
		$notification = $this->clickrays_platform->Notification($this->moduleC);
		$addon_results = $this->clickrays_platform->Related($this->moduleC);
		
			if ($updates) {
			$data['updates'] = array();

			foreach ($updates as $update) {
				$data['updates'][] = array(
                'compatibility' => $update['compatibility'],
				'version' => $update['version'],
				'release' => $update['release'],
				'date_added' => $update['date_added']
            );
        }
		
		$current = $this->moduleVersion;
		$latest = $updates[0]['version'];

		} else {
	
			$data['updates'] = false;
			$current = $this->moduleVersion;
			$latest = '';
		}		
		$data['promotion'] = $notification;
		

		//$this->log->write($updates[0]['version'] . $this->moduleVersion);
		
				if (version_compare($current, $latest, '=')) {
					$version = sprintf($this->language->get('heading_latest'), $latest);
					$class = "latest";
					$icon = "check-circle";
				} elseif (version_compare($current, $latest, '>')) {
					$version = sprintf($this->language->get('heading_future'), $current);
					$class = "future";
					$icon = "rocket";
				} else {
					$version = sprintf($this->language->get('heading_update'), $latest);
					$class = "update";
					$icon = "exclamation-circle";
				}

		$data['update'] = "<span class='version ".$class."'><i class='fa fa-".$icon."'> </i> ".$version."</span>";

		
		$this->load->language('extension/theme/best_mobile_theme');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['heading_title'] = $this->language->get('heading_title') . ' ' . $this->moduleVersion;

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('theme_best_mobile_theme', $this->request->post, $this->request->get['store_id']);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('marketplace/extension', $this->data['token_addon'] . '&type=theme', true));
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['product_limit'])) {
			$data['error_product_limit'] = $this->error['product_limit'];
		} else {
			$data['error_product_limit'] = '';
		}

		if (isset($this->error['product_description_length'])) {
			$data['error_product_description_length'] = $this->error['product_description_length'];
		} else {
			$data['error_product_description_length'] = '';
		}

		if (isset($this->error['image_category'])) {
			$data['error_image_category'] = $this->error['image_category'];
		} else {
			$data['error_image_category'] = '';
		}

		if (isset($this->error['image_thumb'])) {
			$data['error_image_thumb'] = $this->error['image_thumb'];
		} else {
			$data['error_image_thumb'] = '';
		}

		if (isset($this->error['image_popup'])) {
			$data['error_image_popup'] = $this->error['image_popup'];
		} else {
			$data['error_image_popup'] = '';
		}

		if (isset($this->error['image_product'])) {
			$data['error_image_product'] = $this->error['image_product'];
		} else {
			$data['error_image_product'] = '';
		}

		if (isset($this->error['image_additional'])) {
			$data['error_image_additional'] = $this->error['image_additional'];
		} else {
			$data['error_image_additional'] = '';
		}

		if (isset($this->error['image_related'])) {
			$data['error_image_related'] = $this->error['image_related'];
		} else {
			$data['error_image_related'] = '';
		}

		if (isset($this->error['image_compare'])) {
			$data['error_image_compare'] = $this->error['image_compare'];
		} else {
			$data['error_image_compare'] = '';
		}

		if (isset($this->error['image_wishlist'])) {
			$data['error_image_wishlist'] = $this->error['image_wishlist'];
		} else {
			$data['error_image_wishlist'] = '';
		}

		if (isset($this->error['image_cart'])) {
			$data['error_image_cart'] = $this->error['image_cart'];
		} else {
			$data['error_image_cart'] = '';
		}

		if (isset($this->error['image_location'])) {
			$data['error_image_location'] = $this->error['image_location'];
		} else {
			$data['error_image_location'] = '';
		}
		
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', $this->data['token_addon'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('marketplace/extension', $this->data['token_addon'] . '&type=theme', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/theme/best_mobile_theme', $this->data['token_addon'] . '&store_id=' . $this->request->get['store_id'], true)
		);

		$data['action'] = $this->url->link('extension/theme/best_mobile_theme', $this->data['token_addon'] . '&store_id=' . $this->request->get['store_id'], true);

		$data['cancel'] = $this->url->link('marketplace/extension', $this->data['token_addon'] . '&type=theme', true);

		if (isset($this->request->get['store_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$setting_info = $this->model_setting_setting->getSetting('theme_best_mobile_theme', $this->request->get['store_id']);
		}
		
		if (isset($this->request->post['theme_best_mobile_theme_directory'])) {
			$data['theme_best_mobile_theme_directory'] = $this->request->post['theme_best_mobile_theme_directory'];
		} elseif (isset($setting_info['theme_best_mobile_theme_directory'])) {
			$data['theme_best_mobile_theme_directory'] = $setting_info['theme_best_mobile_theme_directory'];
		} else {
			$data['theme_best_mobile_theme_directory'] = 'best_mobile_theme';
		}		

		$data['directories'] = array();

		$directories = glob(DIR_CATALOG . 'view/theme/*', GLOB_ONLYDIR);

		foreach ($directories as $directory) {
			$data['directories'][] = basename($directory);
		}

		if (isset($this->request->post['theme_best_mobile_theme_product_limit'])) {
			$data['theme_best_mobile_theme_product_limit'] = $this->request->post['theme_best_mobile_theme_product_limit'];
		} elseif (isset($setting_info['theme_best_mobile_theme_product_limit'])) {
			$data['theme_best_mobile_theme_product_limit'] = $setting_info['theme_best_mobile_theme_product_limit'];
		} else {
			$data['theme_best_mobile_theme_product_limit'] = 15;
		}		
		
		if (isset($this->request->post['theme_best_mobile_theme_status'])) {
			$data['theme_best_mobile_theme_status'] = $this->request->post['theme_best_mobile_theme_status'];
		} elseif (isset($setting_info['theme_best_mobile_theme_status'])) {
			$data['theme_best_mobile_theme_status'] = $setting_info['theme_best_mobile_theme_status'];
		} else {
			$data['theme_best_mobile_theme_status'] = '';
		}
		
		if (isset($this->request->post['theme_best_mobile_theme_product_description_length'])) {
			$data['theme_best_mobile_theme_product_description_length'] = $this->request->post['theme_best_mobile_theme_product_description_length'];
		} elseif (isset($setting_info['theme_best_mobile_theme_product_description_length'])) {
			$data['theme_best_mobile_theme_product_description_length'] = $setting_info['theme_best_mobile_theme_product_description_length'];
		} else {
			$data['theme_best_mobile_theme_product_description_length'] = 100;
		}
		
		if (isset($this->request->post['theme_best_mobile_theme_image_category_width'])) {
			$data['theme_best_mobile_theme_image_category_width'] = $this->request->post['theme_best_mobile_theme_image_category_width'];
		} elseif (isset($setting_info['theme_best_mobile_theme_image_category_width'])) {
			$data['theme_best_mobile_theme_image_category_width'] = $setting_info['theme_best_mobile_theme_image_category_width'];
		} else {
			$data['theme_best_mobile_theme_image_category_width'] = 80;		
		}
		
		if (isset($this->request->post['theme_best_mobile_theme_image_category_height'])) {
			$data['theme_best_mobile_theme_image_category_height'] = $this->request->post['theme_best_mobile_theme_image_category_height'];
		} elseif (isset($setting_info['theme_best_mobile_theme_image_category_height'])) {
			$data['theme_best_mobile_theme_image_category_height'] = $setting_info['theme_best_mobile_theme_image_category_height'];
		} else {
			$data['theme_best_mobile_theme_image_category_height'] = 80;
		}
		
		if (isset($this->request->post['theme_best_mobile_theme_image_thumb_width'])) {
			$data['theme_best_mobile_theme_image_thumb_width'] = $this->request->post['theme_best_mobile_theme_image_thumb_width'];
		} elseif (isset($setting_info['theme_best_mobile_theme_image_thumb_width'])) {
			$data['theme_best_mobile_theme_image_thumb_width'] = $setting_info['theme_best_mobile_theme_image_thumb_width'];
		} else {
			$data['theme_best_mobile_theme_image_thumb_width'] = 228;
		}
		
		if (isset($this->request->post['theme_best_mobile_theme_image_thumb_height'])) {
			$data['theme_best_mobile_theme_image_thumb_height'] = $this->request->post['theme_best_mobile_theme_image_thumb_height'];
		} elseif (isset($setting_info['theme_best_mobile_theme_image_thumb_height'])) {
			$data['theme_best_mobile_theme_image_thumb_height'] = $setting_info['theme_best_mobile_theme_image_thumb_height'];
		} else {
			$data['theme_best_mobile_theme_image_thumb_height'] = 228;		
		}
		
		if (isset($this->request->post['theme_best_mobile_theme_image_popup_width'])) {
			$data['theme_best_mobile_theme_image_popup_width'] = $this->request->post['theme_best_mobile_theme_image_popup_width'];
		} elseif (isset($setting_info['theme_best_mobile_theme_image_popup_width'])) {
			$data['theme_best_mobile_theme_image_popup_width'] = $setting_info['theme_best_mobile_theme_image_popup_width'];
		} else {
			$data['theme_best_mobile_theme_image_popup_width'] = 500;
		}
		
		if (isset($this->request->post['theme_best_mobile_theme_image_popup_height'])) {
			$data['theme_best_mobile_theme_image_popup_height'] = $this->request->post['theme_best_mobile_theme_image_popup_height'];
		} elseif (isset($setting_info['theme_best_mobile_theme_image_popup_height'])) {
			$data['theme_best_mobile_theme_image_popup_height'] = $setting_info['theme_best_mobile_theme_image_popup_height'];
		} else {
			$data['theme_best_mobile_theme_image_popup_height'] = 500;
		}
		
		if (isset($this->request->post['theme_best_mobile_theme_image_product_width'])) {
			$data['theme_best_mobile_theme_image_product_width'] = $this->request->post['theme_best_mobile_theme_image_product_width'];
		} elseif (isset($setting_info['theme_best_mobile_theme_image_product_width'])) {
			$data['theme_best_mobile_theme_image_product_width'] = $setting_info['theme_best_mobile_theme_image_product_width'];
		} else {
			$data['theme_best_mobile_theme_image_product_width'] = 228;
		}
		
		if (isset($this->request->post['theme_best_mobile_theme_image_product_height'])) {
			$data['theme_best_mobile_theme_image_product_height'] = $this->request->post['theme_best_mobile_theme_image_product_height'];
		} elseif (isset($setting_info['theme_best_mobile_theme_image_product_height'])) {
			$data['theme_best_mobile_theme_image_product_height'] = $setting_info['theme_best_mobile_theme_image_product_height'];
		} else {
			$data['theme_best_mobile_theme_image_product_height'] = 228;
		}
		
		if (isset($this->request->post['theme_best_mobile_theme_image_additional_width'])) {
			$data['theme_best_mobile_theme_image_additional_width'] = $this->request->post['theme_best_mobile_theme_image_additional_width'];
		} elseif (isset($setting_info['theme_best_mobile_theme_image_additional_width'])) {
			$data['theme_best_mobile_theme_image_additional_width'] = $setting_info['theme_best_mobile_theme_image_additional_width'];
		} else {
			$data['theme_best_mobile_theme_image_additional_width'] = 74;
		}
		
		if (isset($this->request->post['theme_best_mobile_theme_image_additional_height'])) {
			$data['theme_best_mobile_theme_image_additional_height'] = $this->request->post['theme_best_mobile_theme_image_additional_height'];
		} elseif (isset($setting_info['theme_best_mobile_theme_image_additional_height'])) {
			$data['theme_best_mobile_theme_image_additional_height'] = $setting_info['theme_best_mobile_theme_image_additional_height'];
		} else {
			$data['theme_best_mobile_theme_image_additional_height'] = 74;
		}
		
		if (isset($this->request->post['theme_best_mobile_theme_image_related_width'])) {
			$data['theme_best_mobile_theme_image_related_width'] = $this->request->post['theme_best_mobile_theme_image_related_width'];
		} elseif (isset($setting_info['theme_best_mobile_theme_image_related_width'])) {
			$data['theme_best_mobile_theme_image_related_width'] = $setting_info['theme_best_mobile_theme_image_related_width'];
		} else {
			$data['theme_best_mobile_theme_image_related_width'] = 80;
		}
		
		if (isset($this->request->post['theme_best_mobile_theme_image_related_height'])) {
			$data['theme_best_mobile_theme_image_related_height'] = $this->request->post['theme_best_mobile_theme_image_related_height'];
		} elseif (isset($setting_info['theme_best_mobile_theme_image_related_height'])) {
			$data['theme_best_mobile_theme_image_related_height'] = $setting_info['theme_best_mobile_theme_image_related_height'];
		} else {
			$data['theme_best_mobile_theme_image_related_height'] = 80;
		}
		
		if (isset($this->request->post['theme_best_mobile_theme_image_compare_width'])) {
			$data['theme_best_mobile_theme_image_compare_width'] = $this->request->post['theme_best_mobile_theme_image_compare_width'];
		} elseif (isset($setting_info['theme_best_mobile_theme_image_compare_width'])) {
			$data['theme_best_mobile_theme_image_compare_width'] = $setting_info['theme_best_mobile_theme_image_compare_width'];
		} else {
			$data['theme_best_mobile_theme_image_compare_width'] = 90;
		}
		
		if (isset($this->request->post['theme_best_mobile_theme_image_compare_height'])) {
			$data['theme_best_mobile_theme_image_compare_height'] = $this->request->post['theme_best_mobile_theme_image_compare_height'];
		} elseif (isset($setting_info['theme_best_mobile_theme_image_compare_height'])) {
			$data['theme_best_mobile_theme_image_compare_height'] = $setting_info['theme_best_mobile_theme_image_compare_height'];
		} else {
			$data['theme_best_mobile_theme_image_compare_height'] = 90;
		}
		
		if (isset($this->request->post['theme_best_mobile_theme_image_wishlist_width'])) {
			$data['theme_best_mobile_theme_image_wishlist_width'] = $this->request->post['theme_best_mobile_theme_image_wishlist_width'];
		} elseif (isset($setting_info['theme_best_mobile_theme_image_wishlist_width'])) {
			$data['theme_best_mobile_theme_image_wishlist_width'] = $setting_info['theme_best_mobile_theme_image_wishlist_width'];
		} else {
			$data['theme_best_mobile_theme_image_wishlist_width'] = 47;
		}
		
		if (isset($this->request->post['theme_best_mobile_theme_image_wishlist_height'])) {
			$data['theme_best_mobile_theme_image_wishlist_height'] = $this->request->post['theme_best_mobile_theme_image_wishlist_height'];
		} elseif (isset($setting_info['theme_best_mobile_theme_image_wishlist_height'])) {
			$data['theme_best_mobile_theme_image_wishlist_height'] = $setting_info['theme_best_mobile_theme_image_wishlist_height'];
		} else {
			$data['theme_best_mobile_theme_image_wishlist_height'] = 47;
		}
		
		if (isset($this->request->post['theme_best_mobile_theme_image_cart_width'])) {
			$data['theme_best_mobile_theme_image_cart_width'] = $this->request->post['theme_best_mobile_theme_image_cart_width'];
		} elseif (isset($setting_info['theme_best_mobile_theme_image_cart_width'])) {
			$data['theme_best_mobile_theme_image_cart_width'] = $setting_info['theme_best_mobile_theme_image_cart_width'];
		} else {
			$data['theme_best_mobile_theme_image_cart_width'] = 47;
		}
		
		if (isset($this->request->post['theme_best_mobile_theme_image_cart_height'])) {
			$data['theme_best_mobile_theme_image_cart_height'] = $this->request->post['theme_best_mobile_theme_image_cart_height'];
		} elseif (isset($setting_info['theme_best_mobile_theme_image_cart_height'])) {
			$data['theme_best_mobile_theme_image_cart_height'] = $setting_info['theme_best_mobile_theme_image_cart_height'];
		} else {
			$data['theme_best_mobile_theme_image_cart_height'] = 47;
		}
		
		if (isset($this->request->post['theme_best_mobile_theme_image_location_width'])) {
			$data['theme_best_mobile_theme_image_location_width'] = $this->request->post['theme_best_mobile_theme_image_location_width'];
		} elseif (isset($setting_info['theme_best_mobile_theme_image_location_width'])) {
			$data['theme_best_mobile_theme_image_location_width'] = $setting_info['theme_best_mobile_theme_image_location_width'];
		} else {
			$data['theme_best_mobile_theme_image_location_width'] = 268;
		}
		
		if (isset($this->request->post['theme_best_mobile_theme_image_location_height'])) {
			$data['theme_best_mobile_theme_image_location_height'] = $this->request->post['theme_best_mobile_theme_image_location_height'];
		} elseif (isset($setting_info['theme_best_mobile_theme_image_location_height'])) {
			$data['theme_best_mobile_theme_image_location_height'] = $setting_info['theme_best_mobile_theme_image_location_height'];
		} else {
			$data['theme_best_mobile_theme_image_location_height'] = 50;
		}
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/theme/best_mobile_theme', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/theme/best_mobile_theme')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->request->post['theme_best_mobile_theme_product_limit']) {
			$this->error['product_limit'] = $this->language->get('error_limit');
		}

		if (!$this->request->post['theme_best_mobile_theme_product_description_length']) {
			$this->error['product_description_length'] = $this->language->get('error_limit');
		}

		if (!$this->request->post['theme_best_mobile_theme_image_category_width'] || !$this->request->post['theme_best_mobile_theme_image_category_height']) {
			$this->error['image_category'] = $this->language->get('error_image_category');
		}

		if (!$this->request->post['theme_best_mobile_theme_image_thumb_width'] || !$this->request->post['theme_best_mobile_theme_image_thumb_height']) {
			$this->error['image_thumb'] = $this->language->get('error_image_thumb');
		}

		if (!$this->request->post['theme_best_mobile_theme_image_popup_width'] || !$this->request->post['theme_best_mobile_theme_image_popup_height']) {
			$this->error['image_popup'] = $this->language->get('error_image_popup');
		}

		if (!$this->request->post['theme_best_mobile_theme_image_product_width'] || !$this->request->post['theme_best_mobile_theme_image_product_height']) {
			$this->error['image_product'] = $this->language->get('error_image_product');
		}

		if (!$this->request->post['theme_best_mobile_theme_image_additional_width'] || !$this->request->post['theme_best_mobile_theme_image_additional_height']) {
			$this->error['image_additional'] = $this->language->get('error_image_additional');
		}

		if (!$this->request->post['theme_best_mobile_theme_image_related_width'] || !$this->request->post['theme_best_mobile_theme_image_related_height']) {
			$this->error['image_related'] = $this->language->get('error_image_related');
		}

		if (!$this->request->post['theme_best_mobile_theme_image_compare_width'] || !$this->request->post['theme_best_mobile_theme_image_compare_height']) {
			$this->error['image_compare'] = $this->language->get('error_image_compare');
		}

		if (!$this->request->post['theme_best_mobile_theme_image_wishlist_width'] || !$this->request->post['theme_best_mobile_theme_image_wishlist_height']) {
			$this->error['image_wishlist'] = $this->language->get('error_image_wishlist');
		}

		if (!$this->request->post['theme_best_mobile_theme_image_cart_width'] || !$this->request->post['theme_best_mobile_theme_image_cart_height']) {
			$this->error['image_cart'] = $this->language->get('error_image_cart');
		}

		if (!$this->request->post['theme_best_mobile_theme_image_location_width'] || !$this->request->post['theme_best_mobile_theme_image_location_height']) {
			$this->error['image_location'] = $this->language->get('error_image_location');
		}

		return !$this->error;
	}
}
