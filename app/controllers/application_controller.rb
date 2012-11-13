class ApplicationController < ActionController::Base
  include ControllerAuthentication
  include Userstamp
  # include UrlHelper
  
  protect_from_forgery
end
