require 'ticketmaster'
require 'ticketmaster-pivotal'
require 'ticketmaster-basecamp'
class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  include ApplicationHelper
  
  def get_auth
    YAML.load_file('config/authentication.yml')["authentication"].symbolize_keys!
  end
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
