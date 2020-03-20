class ErrorsController < ApplicationController
  before_action :set_error, only: [:show, :edit, :update, :destroy]
  before_action :set_app, only: [:show]

  def index
    @errors = Error.all
  end


  def show
    @app_errors = @app.errors
  end

  def new
    @error = Error.new
  end


  def edit

  end


  def create
    @error = Error.new(error_params)

    respond_to do |format|
      if @error.save
        format.html { redirect_to @error, notice: 'Error was successfully created.' }
        format.json { render :show, status: :created, location: @error }
      else
        format.html { render :new }
        format.json { render json: @error.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @error.update(error_params)
        format.html { redirect_to @error, notice: 'Error was successfully updated.' }
        format.json { render :show, status: :ok, location: @error }
      else
        format.html { render :edit }
        format.json { render json: @error.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @error.destroy
    respond_to do |format|
      format.html { redirect_to errors_url, notice: 'Error was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_error
      @error = Error.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def error_params
      params.require(:error).permit(:title, :description, :serverity, :app_id)
    end
end
