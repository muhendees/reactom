defmodule Reactom.ProductTest do
  use Reactom.ModelCase

  alias Reactom.Product

  @valid_attrs %{category: "some content", name: "some content", price: "some content", stocked: true}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Product.changeset(%Product{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Product.changeset(%Product{}, @invalid_attrs)
    refute changeset.valid?
  end
end
