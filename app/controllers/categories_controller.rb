class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @current_page = params[:page] || 1
    @category = Category.find_by(name: params[:name])
    @clubs = @category.clubs.page(@current_page)
  end
end
