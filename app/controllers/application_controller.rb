class ApplicationController < ActionController::Base
  if ENV['RAILS_ENV'] == 'production'
    http_basic_authenticate_with name: 'eyegum', password: 'nowhere'
  end
end
