class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.paginate(page: params[:page])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      redirect_to admin_categories_url
    else
      render 'edit'
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Success for created"
      redirect_to admin_categories_url
    else
      render 'new'
    end  
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to admin_categories_url
  end

  private
  def category_params
    params.require(:category).permit(:title, :description)
  end

end
