class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: 'eyegum', password: 'nowhere'
end
