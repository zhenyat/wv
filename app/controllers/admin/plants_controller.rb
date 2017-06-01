class Admin::PlantsController < Admin::BaseController
  before_action :set_plant, only: [:show, :edit, :update,:destroy]

  def index
    @plants = policy_scope(Plant)
  end

  def show
    authorize @plant
  end

  def new
    @plant = Plant.new
    authorize @plant
  end

  def edit
    authorize @plant
  end

  def create
    @plant = Plant.new(plant_params)
    authorize @plant
    if @plant.save
      flash[:success] = t('messages.created', model: @plant.class.model_name.human)
      redirect_to [:admin, @plant]
    else      
      render :new
    end
  end

  def update
    authorize @plant
    if @plant.update(plant_params)
      flash[:success] = t('messages.updated', model: @plant.class.model_name.human)
      redirect_to [:admin, @plant]
    else      
      render :edit
    end
  end

  def destroy
    authorize @plant
    @plant.destroy
    flash[:success] = t('messages.deleted', model: @plant.class.model_name.human)
    redirect_to admin_plants_path
  end

  private

    # Uses callbacks to share common setup or constraints between actions
    def set_plant
      @plant = Plant.find(params[:id])
    end

    # Only allows a trusted parameter 'white list' through
    def plant_params
      params.require(:plant).permit(:grower_id, :title_la, :title, :hybrid_parentage, :kind, :zone_min, :zone_max, :quantity, :planted_in, :position, :status)
    end
end
