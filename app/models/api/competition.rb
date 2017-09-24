module Api
  class Competition < ApplicationRecord
    has_many :modalities
  end
end
