defmodule Reactom.ProductView do
  use Reactom.Web, :view

  def render("index.json", %{products: products}) do
    %{data: render_many(products, Reactom.ProductView, "product.json")}
  end

  def render("show.json", %{product: product}) do
    %{data: render_one(product, Reactom.ProductView, "product.json")}
  end

  def render("product.json", %{product: product}) do
    %{id: product.id,
      category: product.category,
      price: product.price,
      stocked: product.stocked,
      name: product.name}
  end
end
