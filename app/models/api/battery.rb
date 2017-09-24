module Api
  class Battery < ApplicationRecord
    belongs_to :stage
  end
end
