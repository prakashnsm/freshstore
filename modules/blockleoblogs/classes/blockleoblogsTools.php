<?php
if (!class_exists('BlockleoblogsTools')) {

	class BlockleoblogsTools
	{

		public static function base64Decode($data)
		{
			return call_user_func('base64_decode', $data);
		}

		public static function base64Encode($data)
		{
			return call_user_func('base64_encode', $data);
		}

		public static function encode($data = array())
		{
			return call_user_func('base64_encode', Tools::jsonEncode($data));
		}

		public static function decode($data = array())
		{
			return Tools::jsonDecode(call_user_func('base64_decode', $data), true);
		}

	}
}