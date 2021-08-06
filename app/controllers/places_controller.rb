class PlacesController < ApplicationController
  before_action :set_feedback, only: [:destroy]

  def index
    @current_page = params[:page] || 1
    @places = Place.page(@current_page)
  end

  def new
    @place = Place.new
  end

  def create
    @place = LoadPlace.new(place_params[:name]).perform
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
      format.html { redirect_to feedbacks_url, notice: "Feedback was successfully destroyed." }
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
