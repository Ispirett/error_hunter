class ApplicationController < ActionController::Base

#=> get the app name form params
  def set_app
    @app = App.find_by(name: params[:name])
  end




end
