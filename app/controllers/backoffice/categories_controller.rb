class Backoffice::CategoriesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_category, only: [:edit, :update, :destroy] 

  layout "backoffice"

  def index
  	@categories = Category.all
  end

  def new
    @category = Category.new  	
  end

  def create
    @category = CategoryService.create(params_category)
    unless @category.errors.any? 
      redirect_to backoffice_categories_path , notice: "Categoria Salva com sucesso!"
    else  
      render :new  
    end 
  end

  def edit
  end

  def update
    if @category.update(params_category)
      redirect_to backoffice_categories_path, notice: I18n.t('messages.category.update', item: "Categoria")  
    else 
      render :edit
    end
  end

  def destroy
    if @category.destroy
      redirect_to backoffice_categories_path, notice: I18n.t('messages.category.destroy')
    else 
      render :index
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def params_category
    params.require(:category).permit(:description)    
  end
end
