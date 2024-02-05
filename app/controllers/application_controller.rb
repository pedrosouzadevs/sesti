class ApplicationController < ActionController::Base
  after_action :authenticate_user!
end
