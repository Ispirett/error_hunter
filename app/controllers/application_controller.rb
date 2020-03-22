class ApplicationController < ActionController::Base

#=> get the app name form params
  def set_app
    @app = App.find_by(name: params[:name])
  end

  def app_owner?
    redirect_to root_path unless @app.ceo === current_user
  end


end
