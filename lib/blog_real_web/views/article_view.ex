defmodule BlogRealWeb.Api.V1.ArticleView do
  use BlogRealWeb, :view

  alias BlogRealWeb.Api.V1.ArticleView

  def render("index.json", %{articles: articles}) do
    %{data: render_many(articles, ArticleView, "article.json")}
  end

  def render("show.json", %{article: article}) do
    %{data: render_one(article, ArticleView, "article.json")}
  end

  def render("article.json", %{article: article}) do
    %{id: article.id,
      title: article.title,
      content: article.content,
      description: article.description,
      views: article.views,
      metadata: article.metadata}
  end
end
