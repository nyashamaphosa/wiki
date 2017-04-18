class ArticlesController < ApplicationController

  before_action :find_article, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!, except: [:show, :index]


  def index
    @q = Article.ransack(params[:q])
    @articles = @q.result(distinct: true)
  end

  def new
  	@article = current_user.articles.build
  end

  def create
    @articles = current_user.articles.build(article_params)
  	if @article.save
  		redirect_to @article
  	else
  		render "new"
  	end 
  end 

  def show
  end

  def edit
  end

  def update
  	if @article.update(article_params)
  		redirect_to @article
  	else
  		render "edit"
  	end 
  end 

  def destroy
  	@article.delete
  	redirect_to articles_path
  end 

  private

  def find_article
    @article = Article.find(params[:id])
  end 

  def article_params
  	params.require(:article).permit(:title, :body, :language)
  end 

end
