class Site::AdDetailController < SiteController

	layout "site"
	def show
		@ad = Ad.find(params[:id])
	end
end
