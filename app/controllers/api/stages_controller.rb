module Api
  class StagesController < ApplicationController
    def index
      @stages = Stage.all
      render json: @stages, status: 200
    end
  end
end
