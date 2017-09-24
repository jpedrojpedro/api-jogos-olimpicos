module Api
  class ModalitiesController < ApplicationController
    def index
      @modalities = Modality.all
      render json: @modalities, status: 200
    end
  end
end
