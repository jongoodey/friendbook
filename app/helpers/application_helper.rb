module ApplicationHelper
	def flash_class(type)
		case type
		when :alert
			"error"
		when :notice
			"success"
		else
			""
		end
	end
end
