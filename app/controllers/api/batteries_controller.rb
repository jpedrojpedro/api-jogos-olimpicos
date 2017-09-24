module Api
  class BatteriesController < ApplicationController
    def index
      competition = load_competition
      modality = load_modality(competition)
      stage = load_stage(modality)
      @batteries = stage.batteries
      render json: @batteries, status: 200
    end

    private

    def load_competition
      Api::Competition.find_by!(slug: params[:competition_slug])
    end

    def load_modality(competition)
      competition.modalities.find_by!(slug: params[:modality_slug])
    end

    def load_stage(modality)
      modality.stages.find_by!(slug: params[:stage_slug])
    end
  end
end
