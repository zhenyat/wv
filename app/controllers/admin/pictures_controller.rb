class Admin::PicturesController < Admin::BaseController
  before_action :set_picture, only: [:show, :edit, :update,:destroy]
  after_action  :remove_photo_dir, only: :destroy
  
  def index
    @pictures = policy_scope(Picture)
  end

  def show
    authorize @picture
  end

  def new
    @picture = Picture.new
    authorize @picture
  end

  def edit
    authorize @picture
  end

  def create
    @picture = Picture.new(picture_params)
    authorize @picture
    if @picture.save
      flash[:success] = t('messages.created', model: @picture.class.model_name.human)
      redirect_to [:admin, @picture]
    else      
      render :new
    end
  end

  def update
    authorize @picture
    if @picture.update(picture_params)
      flash[:success] = t('messages.updated', model: @picture.class.model_name.human)
      redirect_to [:admin, @picture]
    else      
      render :edit
    end
  end

  def destroy
    authorize @picture
    @picture.destroy
    flash[:success] = t('messages.deleted', model: @picture.class.model_name.human)
    redirect_to admin_pictures_path
  end

  private

    # Removes upload avatar directory of a destroyed Account
    def remove_photo_dir
      dir = File.dirname(@picture.photo.current_path)
      FileUtils.remove_dir dir if Dir.empty?(dir)
    end

    # Uses callbacks to share common setup or constraints between actions
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Only allows a trusted parameter 'white list' through
    def picture_params
      params.require(:picture).permit(:plant_id, :kind, :title, :content, :photo, :taken_at, :position, :status, :remove_photo)
    end
end
