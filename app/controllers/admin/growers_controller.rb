class Admin::GrowersController < Admin::BaseController
  before_action :set_grower, only: [:show, :edit, :update,:destroy]
  after_action  :remove_logo_dir, only: :destroy

  def index
    @growers = policy_scope(Grower)
  end

  def show
    authorize @grower
  end

  def new
    @grower = Grower.new
    authorize @grower
  end

  def edit
    authorize @grower
  end

  def create
    @grower = Grower.new(grower_params)
    authorize @grower
    if @grower.save
      flash[:success] = t('messages.created', model: @grower.class.model_name.human)
      redirect_to [:admin, @grower]
    else      
      render :new
    end
  end

  def update
    authorize @grower
    if @grower.update(grower_params)
      flash[:success] = t('messages.updated', model: @grower.class.model_name.human)
      redirect_to [:admin, @grower]
    else      
      render :edit
    end
  end

  def destroy
    authorize @grower
    @grower.destroy
    flash[:success] = t('messages.deleted', model: @grower.class.model_name.human)
    redirect_to admin_growers_path
  end

  private

    # Removes upload avatar directory of a destroyed Account
    def remove_logo_dir
      dir =  "public/uploads/grower/avatar/#{@grower.id}"
      FileUtils.remove_dir dir if Dir.empty?(dir)
    end

    # Uses callbacks to share common setup or constraints between actions
    def set_grower
      @grower = Grower.find(params[:id])
    end

    # Only allows a trusted parameter 'white list' through
    def grower_params
      params.require(:grower).permit(:name, :title, :address, :phone, :url, :about, :description, :logo, :status, :remove_logo)
    end
end
