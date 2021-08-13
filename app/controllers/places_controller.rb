class PlacesController < ApplicationController
  before_action :set_place, only: [:destroy]
  http_basic_authenticate_with :name => ENV["HTTP_AUTH_USERNAME"], :password => ENV["HTTP_AUTH_PASSWORD"], only: [:destroy]


  def index
    @current_page = params[:page] || 1
    @places = Place.page(@current_page)
  end

  def new
    @place = Place.new
  end

  def create
    params[:id]
    @place = LoadPlace.new(place_id: params[:place_id]).perform
    if @place
      render json: { type: "text", text: "感謝你的貢獻，這下子學姊知道下一餐要吃哪了。" }
    else
      render json: flex_text(@place.errors.to_s)
    end
  end

  def create_by_id
    params[:id]
    @place = LoadPlace.new(place_id: params[:place_id]).perform
    if @place
      render json: { type: "text", text: "感謝你的貢獻，這下子學姊知道下一餐要吃哪了。" }
    else
      render json: flex_text(@place.errors.to_s)
    end
  end

  def destroy
    @place.destroy
    @places = Place.all
    respond_to do |format|
      format.html { redirect_to places_url, notice: "該地點已成功被刪除！" }
      format.json { head :no_content }
      format.line { render :index }
    end
  end

  private

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name)
  end
end
