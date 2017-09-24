module Api
  class Stage < ApplicationRecord
    belongs_to :modality
    has_many   :batteries
  end
end
