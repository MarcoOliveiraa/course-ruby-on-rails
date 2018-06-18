class ApplicationController < ActionController::Base
	# Pundit
	protect_from_forgery
	include Pundit

	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
	
	 #Set layout
	layout :layout_by_resource

	protected

		def layout_by_resource
			if devise_controller? && resource_name == :admin
				"backoffice_devise"
			else
				"aplication"
			end
		end

		def user_not_authorized
			flash[:alert] = I18n.t('messages.errors.pundit')
			redirect_to(request.referrer || root_path)
		end
end
