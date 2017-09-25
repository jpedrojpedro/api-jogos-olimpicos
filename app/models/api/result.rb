module Api
  class Result < ApplicationRecord
    belongs_to :battery
    validate :validate_attempts

    private

    def validate_attempts
      attempts =
        Result.where(athlete: athlete, country: country, battery: battery).count
      return if attempts < battery.max_tries
      errors.add(:base, 'limite de tentativas excedido')
    end
  end
end
