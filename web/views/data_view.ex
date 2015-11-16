defmodule Reactom.DataView do
  use Reactom.Web, :view

  def render("index.json", %{comments: comments}) do
    %{data: render_many(comments, Reactom.DataView, "data.json")}
  end

  def render("show.json", %{data: data}) do
    %{data: render_one(data, Reactom.DataView, "data.json")}
  end

  def render("data.json", %{data: data}) do
    %{id: data.id,
      author: data.author,
      text: data.text}
  end
end
