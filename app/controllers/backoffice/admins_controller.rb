class Backoffice::AdminsController < BackofficeController
	before_action :authenticate_admin!
	
	before_action :set_admin, only: [:edit, :update, :destroy] 

	after_action :verify_authorized, only: :new
	after_action :verify_policy_scoped, only: :index

	layout "backoffice"
	
	def index
		# @admins = Admin.all
		@admins = policy_scope(Admin)
	end

	def new
		@admin = Admin.new	
		authorize @admin	
	end

	def create
		@admin = Admin.new(params_admin)
		if @admin.save
			redirect_to backoffice_admins_path, notice: I18n.t('messages.admin.create')
		else
			render :new
		end		
	end

	def edit
	end

	def update
		passwd = params[:admin][:password]
		passwd_confirmation = params[:admin][:password_confirmation]

		if passwd.blank? && passwd_confirmation.blank?
			params[:admin].delete(:password)
			params[:admin].delete(:password_confirmation)
		end

		if @admin.update(params_admin) 
			AdminMailer.update_email(current_admin, @admin).deliver_now
			redirect_to backoffice_admins_path, notice: I18n.t('messages.admin.update', item: "Administrador") 
		else
			render :edit
		end
	end

	def destroy
		if @admin.destroy
			redirect_to backoffice_admins_path, notice: I18n.t('messages.admin.destroy')
		else	
			render :index
		end
	end

	private
	
	def set_admin
		@admin = Admin.find(params[:id])
	end

	def params_admin

		if password_blank?
			params[:admin].except(:password,:password_confirmation)
		end

		if @admin.blank?
			params.require(:admin).permit(:name, :email, :role, :password, :password_confirmation)
		else	
			params.require(:admin).permit(policy(@admin).permitted_attributes)
		end
	end

	def password_blank?
		params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?
	end
end
