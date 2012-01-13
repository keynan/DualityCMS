module CmsHelper

	def form_field(field, name = '', object_name = '')
		[
			'<p>', 
				'<label for="', object_name, '_', name, '">', name.humanize, '</lable>', field,
			'</p>'
		].join('').html_safe
	end
	
	def form_field_formater(label, input)
		[
			'<p>', 
				label, ' ', input,
			'</p>'
		].join('').html_safe
	end
	
	def settings_switch(setting)
		str = setting
		setting = setting.underscore
		
		label = unless(session[:user].settings.send(setting.to_sym)) then 'Turn On ' else 'Turn Off ' end + str
		link_to_function(label, setting+'_switch()', :id => setting.downcase+'_switch_link').html_safe
	end
	
	def display_field(title, value)
		[
			'<p>', 
				'<span class="field_title">', title.humanize, '</span> ', value,
			'</p>'
		].join('').html_safe
	end

	def fck_id(obj, field)
		[obj, '_' , instance_variable_get('@'+obj).id,'_', field, '_editor'].join('')
	end
	
	def greater(i,j)
		(i>j) ? i : j
	end
	
	def lesser(i,j)
		(i<j) ? i : j
	end
	
end
