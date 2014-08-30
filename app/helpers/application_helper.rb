module ApplicationHelper
	def title(page_title)
			content_for(:title) { page_title }
	end
	def body_classes(page_body_classes)
			content_for(:body_classes) { page_body_classes }
	end
end
