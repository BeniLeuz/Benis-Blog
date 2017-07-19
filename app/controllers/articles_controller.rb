class ArticlesController < ApplicationController


  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to @article

  end


  before_action :authenticate_user!

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
        params.require(:article).permit(:title, :text)

      end
  end
