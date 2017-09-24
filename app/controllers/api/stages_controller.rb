module Api
  class StagesController < ApplicationController
    def index
      competition = load_competition
      modality = load_modality(competition)
      @stages = modality.stages
      render json: @stages, status: 200
    end

    private

    def load_competition
      Api::Competition.find_by!(slug: params.require(:competition_slug))
    end

    def load_modality(competition)
      competition.modalities.find_by!(slug: params.require(:modality_slug))
    end
  end
end
