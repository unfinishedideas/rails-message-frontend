class ApplicationController < ActionController::Base

  rescue_from ActiveRecord::RecordNotFound do |exception|
    json_response({ message: exception.message }, :not_found)
  end
end
