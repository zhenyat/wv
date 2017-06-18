class Admin::OverviewsController < Admin::BaseController
  before_action :set_overview, only: [:show, :edit, :update,:destroy]
  after_action  :remove_image_dir, only: :destroy

  def index
    @overviews = policy_scope(Overview)
  end

  def show
    authorize @overview
  end

  def new
    @overview = Overview.new
    authorize @overview
  end

  def edit
    authorize @overview
  end

  def create
    @overview = Overview.new(overview_params)
    authorize @overview
    if @overview.save
      flash[:success] = t('messages.created', model: @overview.class.model_name.human)
      redirect_to [:admin, @overview]
    else      
      render :new
    end
  end

  def update
    authorize @overview
    if @overview.update(overview_params)
      flash[:success] = t('messages.updated', model: @overview.class.model_name.human)
      redirect_to [:admin, @overview]
    else      
      render :edit
    end
  end

  def destroy
    authorize @overview
    @overview.destroy
    flash[:success] = t('messages.deleted', model: @overview.class.model_name.human)
    redirect_to admin_overviews_path
  end

  private

    # Removes upload image directory of a destroyed Overview
    def remove_image_dir
      dir =  "public/uploads/overview/image/#{@overview.id}"
      FileUtils.remove_dir dir if Dir.empty?(dir)
    end

    # Uses callbacks to share common setup or constraints between actions
    def set_overview
      @overview = Overview.find(params[:id])
    end

    # Only allows a trusted parameter 'white list' through
    def overview_params
      params.require(:overview).permit(:name, :title, :carousel, :content, :image, :taken_at, :position, :status)
    end
end
