module ApplicationHelper

	def title(str)
		('<h1>' + str + '</h1>').html_safe
	end
	
end
