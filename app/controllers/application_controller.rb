class ApplicationController < ActionController::Base

  def is_app_ceo?
    
  end
#=> get the app name form params
  def set_app
    @app = App.find_by(name: params[:name])
  end
end
