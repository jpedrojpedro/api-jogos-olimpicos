class ApplicationController < ActionController::Base
  protect_from_forgery(with: :exception) unless Rails.env.development?
  rescue_from ActiveRecord::RecordNotFound do
    render json: { code: 404, message: 'elemento não encontrado' }
  end
end
