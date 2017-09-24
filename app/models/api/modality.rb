module Api
  class Modality < ApplicationRecord
    belongs_to :competition
    has_many   :stages
  end
end
