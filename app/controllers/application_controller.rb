class ApplicationController < ActionController::Base
  protect_from_forgery
  
  Mime::Type.register "application/pdf", :pdf
end
