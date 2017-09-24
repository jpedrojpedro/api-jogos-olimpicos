module Api
  class Modality < ApplicationRecord
    belongs_to :competition
    has_many   :stages

    def ended?
      ended_at.present?
    end
  end
end
