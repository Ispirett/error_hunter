class AppErrorsController < ApplicationController
  before_action :set_app_error, only: [:show, :edit, :update, :destroy]

  # GET /app_errors
  # GET /app_errors.json
  def index
    @app_errors = AppError.all.includes(:developers)
  end

  # GET /app_errors/1
  # GET /app_errors/1.json
  def show
    @app_errors = @app_error.app.app_errors.order(create_at: :desc).paginate(page: params[:page], per_page: 10)
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
    @app_error = AppError.new(app_error_params)

      if @app_error.save
        redirect_to @app_error, notice: 'App error was successfully created.'
      else
        redirect_to @app_error, notice:  @app_error.errors.full_messages
      end
    end

  r
  def assign_developer
    @app_error = AppError.find(params[:id])
    if @app_error.update(app_error_params)
       @app_errors = @app_error.app.app_errors.paginate(page: params[:page], per_page: 10)
    end
  end

  # PATCH/PUT /app_errors/1
  # PATCH/PUT /app_errors/1.json
  def update
    respond_to do |format|
      if @app_error.update(app_error_params)
        # format.html { redirect_to @app_error, notice: 'App error was successfully updated.' }
        # format.json { render :show, status: :ok, location: @app_error }
        @app_errors = @app_error.app.app_errors.paginate(page: params[:page], per_page: 10)
        format.js
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
      params.require(:app_error).permit(:title, :description, :severity, :app_id, :app_name, :status, :developer_id)
    end
end
