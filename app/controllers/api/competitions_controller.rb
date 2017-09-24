module Api
  class CompetitionsController < ApplicationController
    def index
      @competitions = Competition.all
      render json: @competitions, status: 200
    end
  end
end
