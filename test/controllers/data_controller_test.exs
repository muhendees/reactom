defmodule Reactom.DataControllerTest do
  use Reactom.ConnCase

  alias Reactom.Data
  @valid_attrs %{author: "some content", text: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, data_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    data = Repo.insert! %Data{}
    conn = get conn, data_path(conn, :show, data)
    assert json_response(conn, 200)["data"] == %{"id" => data.id,
      "author" => data.author,
      "text" => data.text}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, data_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, data_path(conn, :create), data: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Data, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, data_path(conn, :create), data: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    data = Repo.insert! %Data{}
    conn = put conn, data_path(conn, :update, data), data: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Data, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    data = Repo.insert! %Data{}
    conn = put conn, data_path(conn, :update, data), data: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    data = Repo.insert! %Data{}
    conn = delete conn, data_path(conn, :delete, data)
    assert response(conn, 204)
    refute Repo.get(Data, data.id)
  end
end
