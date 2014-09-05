# Application Helper
module ApplicationHelper
  # sets title for pages
	def title(page_title)
			content_for(:title) { page_title }
	end
  # sets classes for body HTML tag
	def body_classes(page_body_classes)
			content_for(:body_classes) { page_body_classes }
	end
end
