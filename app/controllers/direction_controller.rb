class DirectionController < ApplicationController
  def club_list
    backgroundColors = ["#DB2763", "#B0DB43", "#8ECD89", "#8ECD89", "#98A8C0", "#C492B1", "#C99CB8"]
    count = 0
    @categorys = Club.distinct.pluck(:category).map do |category|
      { name: category, backgroundColor: backgroundColors[count], clubs: Club.where(category: category).first(5).map(&:name).join('、') }
    ensure
      count += 1
    end
  end
end
