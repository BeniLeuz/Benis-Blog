class ArticlesController < ApplicationController

  before_action :authenticate_user!

  def destroy
    @article = Article.find(params[:id])
    authorize @article
    @article.destroy

    redirect_to @article

  end



  def index
    @articles = Article.all
  end



  def show
    @article = Article.find(params[:id])
  end


  def new
    @article = Article.new
  end


  def edit
    @article = Article.find(params[:id])
  end


  def create
      @article = Article.new(article_params.merge(user: current_user))
      if @article.save
      redirect_to @article
      else
        render 'new'
      end


      def update
      @article = Article.find(params[:id])
      if @article.update(article_params)
        redirect_to @article
      else
        render 'edit'
      end
    end
end


  private
      def article_params
        params.require(:article).permit(:title, :text, :image)


      end
  end
