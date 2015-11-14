defmodule Reactom.CommentView do
  use Reactom.Web, :view

  def render("index.json", %{comments: comments}) do
    %{data: render_many(comments, Reactom.CommentView, "comment.json")}
  end

  def render("show.json", %{comment: comment}) do
    %{data: render_one(comment, Reactom.CommentView, "comment.json")}
  end

  def render("comment.json", %{comment: comment}) do
    %{id: comment.id,
      author: comment.author,
      text: comment.text}
  end
end
