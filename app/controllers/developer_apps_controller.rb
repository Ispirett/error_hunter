class DeveloperAppsController < ApplicationController

  def create
    @developer_app = DeveloperApp.new(developer_apps_params)
    if(@developer_app.save)
      redirect_to apps_path, notice: "developer was saved"
    else
      redirect_to request.referer, notice: @developer_app.errors.full_messages
    end
  end

  private
  def developer_apps_params
    params.permit(:app_id, :developer_id)
  end
end
