class Api::AppErrorsController < ApplicationController
  before_action :set_app_error, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:create, :update]

  def index
    @app_errors = AppError.all
  end

  # GET /app_errors/1
  # GET /app_errors/1.json
  def show
  end

  # GET /app_errors/new
  def new
    @app_error = AppError.new
  end

  # GET /app_errors/1/edit
  def edit
  end

  # POST /app_errors
  # POST /app_errors.json
  def create
    @app_error = App.find_by(name:params[:app_error][:app_name].downcase)
                    .app_errors.build(app_error_params)
    if @app_error.save
      render json: { status: :created }
    else
      render json: { errors:@app_error.errors, status: :unprocessable_entity }
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

  # DELETE /app_errors/1
  # DELETE /app_errors/1.json
  def destroy
    @app_error.destroy
    respond_to do |format|
      format.html { redirect_to app_errors_url, notice: 'App error was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_app_error
    @app_error = AppError.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def app_error_params
    params.require(:app_error).permit(:title, :description, :serverity, :app_name)
  end
end

