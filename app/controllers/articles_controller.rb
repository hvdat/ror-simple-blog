class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :authorize_author, only: %i[edit update destroy]
  layout 'main', only: %i[index show]
  helper_method :author?

  def index
    @title = "#{author_name.capitalize}'s Articles"
    @articles = User.find(params[:user_id]).articles.order(created_at: :desc)

    @articles_popular = Article.order(view_count: :desc).limit(5)
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)

    if @article.save
      redirect_to user_article_path(current_user, @article)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @article = Article.find(params[:id])
    @articles_popular = Article.order(view_count: :desc).limit(4)
    @article.increment!(:view_count, 1)
    @author_name = author_name
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to user_article_path(current_user, @article)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy

    redirect_to root_path
  end

  def author?(article)
    current_user == article.user
  end

  def author_name()
    email = User.find(params[:user_id]).email
    email.split('@').first
  end

  def authorize_author
    @article = Article.find(params[:id])
    return if current_user == @article.user

    redirect_to user_article_path(@article.user, @article), notice: 'You are not authorized to access this page.'
  end

  private

  def article_params
    params.require(:article).permit(:title, :brief, :body)
  end
end
