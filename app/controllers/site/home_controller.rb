class Site::HomeController < SiteController
  
  layout 'site'

  def index
  	@categories = Category.order_by_description
    @ads = Ad.descending_order(6)
  end

end
