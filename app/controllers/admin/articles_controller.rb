class Admin::ArticlesController < Admin::BaseController
  before_action :set_article, only: [:show, :edit, :update,:destroy]

  def index
    @articles = policy_scope(Article)
  end

  def show
    authorize @article
  end

  def new
    @article = Article.new
    authorize @article
  end

  def edit
    authorize @article
  end

  def create
    @article = Article.new(article_params)
    authorize @article
    if @article.save
      flash[:success] = t('messages.created', model: @article.class.model_name.human)
      redirect_to [:admin, @article]
    else      
      render :new
    end
  end

  def update
    authorize @article
    if @article.update(article_params)
      flash[:success] = t('messages.updated', model: @article.class.model_name.human)
      redirect_to [:admin, @article]
    else      
      render :edit
    end
  end

  def destroy
    authorize @article
    @article.destroy
    flash[:success] = t('messages.deleted', model: @article.class.model_name.human)
    redirect_to admin_articles_path
  end

  private

    # Uses callbacks to share common setup or constraints between actions
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allows a trusted parameter 'white list' through
    def article_params
      params.require(:article).permit(:title, :author, :content, :status)
    end
end
