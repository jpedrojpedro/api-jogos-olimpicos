module Api
  class Battery < ApplicationRecord
    belongs_to :stage
    has_many   :results

    def rank
      ranking = results.sort_by(&:value)
      return ranking if stage.modality.measurement_unity == 'segundos'
      ranking.reverse
    end
  end
end
