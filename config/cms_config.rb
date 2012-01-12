module CmsConfig
	CMS_DIRECTORY = 'cms/'
	
	CLIENT_CACHE_TIMES = { 
		'Never'				=> -1, 
		'One Minute'	=> 1.minute,
		'One Hour'		=> 1.hour,
		'One Day'			=> 1.day,
		'One Week'		=> 1.week,
		'One Month'		=> 1.month,
		'One Year'		=> 1.year
	}
end