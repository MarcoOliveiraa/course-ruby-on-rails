class ApplicationController < ActionController::Base
	# before_filter :store_current_location, :unless => :devise_controller?

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
			elsif devise_controller? && resource_name == :member
				"site_devise"
			else
				"aplication"
			end
		end

		def user_not_authorized
			flash[:alert] = I18n.t('messages.errors.pundit')
			redirect_to(request.referrer || root_path)
		end

	private

		def store_current_location
			stored_location_for(:member, request.url) 	
		end 
end
