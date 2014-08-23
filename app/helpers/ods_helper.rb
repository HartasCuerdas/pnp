module OdsHelper
	def enable_link_text(o)
		o ? 'ON' : 'OFF'
	end
	def enable_btn_class(o)
		o ? 'btn-success' : 'btn-default'
	end
end
