class DirectionController < ApplicationController
  def club_list
    count = 0
    @categorys = Category.all
  end
  def club
    @current_page = params[:page] || 1
    @category = Category.find_by(name: params[:category])
    @clubs = @category.clubs.page(@current_page)
  end
end
