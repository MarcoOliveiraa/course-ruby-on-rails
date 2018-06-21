class Site::Profile::MyDataController < Site::ProfileController
  
  def edit
  	@member = Member.find(params[:id])
  end

end
