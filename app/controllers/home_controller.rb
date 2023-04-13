class HomeController < ApplicationController
  layout 'main'

  def index
    @title = "Dat's Blog"
    @articles = Article.all.order(created_at: :desc)
    @articles_popular = Article.order(view_count: :desc).limit(5)
  end
end
