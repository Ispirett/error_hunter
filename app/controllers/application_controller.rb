class ApplicationController < ActionController::Base

#=> get the app name form params
  def set_app
    @app = App.find_by(name: params[:name])
  end

  def app_owner?
    redirect_to root_path unless @app.ceo == current_user
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  private
  def  user_not_authorized
    flash[:notice] = 'you are not authorized to do this'
    redirect_to request.referrer || root_path
  end
end
