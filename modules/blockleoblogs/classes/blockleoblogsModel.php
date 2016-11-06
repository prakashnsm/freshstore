<?php
if (!class_exists('BlockleoblogsModel')) {

	/**
	 * Model
	 */
	class BlockleoblogsModel extends ObjectModel
	{
		public $params;
		public $paramsOwlCarousel;

		public function __construct($id = null, $id_lang = null, $id_shop = null)
		{
			parent::__construct($id, $id_lang, $id_shop);
		}

		public function getParam()
		{
			
		}

		public function setParam($config = array())
		{
			
		}

		public static function getParamOwlCarousel()
		{
			$data = Configuration::get('BLEOBLOGS_PARAM');
			$data = BlockleoblogsTools::decode($data);
			if (empty($data)) {
				$data = array();
			}

			return $data;
		}

		public static function setParamOwlCarousel($config = array())
		{
			
		}

	}
}