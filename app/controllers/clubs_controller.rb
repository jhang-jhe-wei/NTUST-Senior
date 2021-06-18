class ClubsController < ApplicationController
    def show
        @club = Club.find_by(name: params[:name])
    end
end
