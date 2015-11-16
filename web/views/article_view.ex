defmodule Reactom.ArticleView do
  use Reactom.Web, :view

  def render("index.json", %{articles: articles}) do
    %{data: render_many(articles, Reactom.ArticleView, "article.json")}
  end

  def render("show.json", %{article: article}) do
    %{data: render_one(article, Reactom.ArticleView, "article.json")}
  end

  def render("article.json", %{article: article}) do
    %{id: article.id,
      name: article.name,
      body: article.body,
      author: article.author}
  end
end
