module Api
  class Battery < ApplicationRecord
    belongs_to :stage
    has_many   :results

    def rank
      return results.sort(&:value) if stage.modality.measurement_unity == 'segundos'
      results.sort(&:value).reverse
    end
  end
end
