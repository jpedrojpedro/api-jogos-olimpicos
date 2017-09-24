module Api
  class ModalitiesController < ApplicationController
    def index
      competition = load_competition
      @modalities = competition.modalities
      render json: @modalities, status: 200
    end

    private

    def load_competition
      Api::Competition.find_by!(slug: params.require(:competition_slug))
    end
  end
end
