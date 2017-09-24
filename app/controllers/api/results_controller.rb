module Api
  class ResultsController < ApplicationController
    def index
      competition = load_competition
      modality = load_modality(competition)
      stage = load_stage(modality)
      battery = load_battery(stage)
      @results = battery.results
      render json: @results, status: 200
    end

    def create
      competition = load_competition
      modality = load_modality(competition)
      if modality.ended?
        render json: { code: 403, message: 'competição encerrada' } and return
      end
      stage = load_stage(modality)
      battery = load_battery(stage)
      @result =
        battery.results.create(athlete: 'JP', country: 'BRA', value: '10.001')
      render json: @result, status: 200
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

    def load_battery(stage)
      stage.batteries.find_by!(number: params[:battery_number])
    end
  end
end
