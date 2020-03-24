class AppsController < ApplicationController
  before_action :set_app, only: [:show, :edit, :update, :destroy, :add_developer]
  before_action :authenticate_user! , except: :home
  before_action :app_owner?, only: [:destroy, :update]
  include Pundit
  # GET /apps
  # GET /apps.json
  def home
    @test_user_one = User.second
    @test_user_two = User.third
    # logger.info ErrorHunter::App.add_error(title: "HimController",
    #                            description: "app has melted" ,
    #                            log: "fish_file/auth.js on line 8 unknown method" ,
    #                            severity: "urgent")

  end


  def index
    if user_signed_in?
    @logged_in_user = current_user
    @developer_apps =  current_user.developer_apps
    end

    @ceo_apps = App.where(ceo_id: current_user)
    #=> allow developers from app to see app
  end

  # GET /apps/1
  # GET /apps/1.json
  def show
    authorize @app
    @app_errors = @app.app_errors.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  # GET /apps/new
  def new
    @app = App.new
  end

  # GET /apps/1/edit
  def edit
  end



  # POST /apps
  # POST /apps.json
  def create
    @app = App.new(app_params)
    @app.ceo = current_user
    @app.name.downcase!
    respond_to do |format|
      if @app.save
        format.html { redirect_to @app, notice: 'App was successfully created.' }
        format.json { render :show, status: :created, location: @app }
      else
        format.html { render :new }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end



  # PATCH/PUT /apps/1
  # PATCH/PUT /apps/1.json
  def update
    respond_to do |format|
      if @app.update(app_params)
        format.html { redirect_to @app, notice: 'App was successfully updated.' }
        format.json { render :show, status: :ok, location: @app }
      else
        format.html { render :edit }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apps/1
  # DELETE /apps/1.json
  def destroy
    @app.destroy

    respond_to do |format|
      format.html { redirect_to apps_url, notice: 'App was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Only allow a list of trusted parameters through.
    def app_params
      params.require(:app).permit(:ceo_id, :developer_id, :name)
    end
end
