defmodule Reactom.DataTest do
  use Reactom.ModelCase

  alias Reactom.Data

  @valid_attrs %{author: "some content", text: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Data.changeset(%Data{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Data.changeset(%Data{}, @invalid_attrs)
    refute changeset.valid?
  end
end
