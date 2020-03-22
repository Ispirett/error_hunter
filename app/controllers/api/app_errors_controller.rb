class Api::AppErrorsController < ApplicationController
  before_action :set_app_error, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:create, :update]

  def index
    @app_errors = AppError.all
  end

  def show
  end

  def new
    @app_error = AppError.new
  end

  def edit
  end

  def create
    @app_name = params[:app_error][:app_name]
    if(@app_name == 'app_name' || App.find_by(name: @app_name).nil?)
      render json: { errors: "app name is missing or does not exist!", status: :unprocessable_entity }
    else

      @app_error = App.find_by(name:params[:app_error][:app_name].downcase)
                       .app_errors.build(app_error_params)
      if @app_error.save

        AppErrorsChannel.broadcast_to(
            @app_error.app.ceo,
            new_error: ApplicationController.renderer
                           .render(partial:'app_errors/app_error', locals: { app_error: @app_error } )
        )
        render json: { status: :created }
      else
        render json: { errors: @app_error.errors, status: :unprocessable_entity }
      end
    end


  end

  def update
    respond_to do |format|
      if @app_error.update(app_error_params)
        format.html { redirect_to @app_error, notice: 'App error was successfully updated.' }
        format.json { render :show, status: :ok, location: @app_error }
      else
        format.html { render :edit }
        format.json { render json: @app_error.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @app_error.destroy
    respond_to do |format|
      format.html { redirect_to app_errors_url, notice: 'App error was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_app_error
    @app_error = AppError.find(params[:id])
  end

  def app_error_params
    params.require(:app_error).permit(:title, :description, :serverity, :app_name, :log )
  end
end

