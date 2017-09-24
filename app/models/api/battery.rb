module Api
  class Battery < ApplicationRecord
    belongs_to :stage
    has_many   :results
  end
end
