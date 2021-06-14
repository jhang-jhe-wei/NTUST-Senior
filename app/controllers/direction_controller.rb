class DirectionController < ApplicationController
  def club_list
    count = 0
    @categorys = Category.all
  end
end
