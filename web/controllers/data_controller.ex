defmodule Reactom.DataController do
  use Reactom.Web, :controller

  alias Reactom.Data

  plug :scrub_params, "data" when action in [:create, :update]

  def index(conn, _params) do
    comments = Repo.all(Data)
    render(conn, "index.json", comments: comments)
  end

  def create(conn, %{"data" => data_params}) do
    changeset = Data.changeset(%Data{}, data_params)

    case Repo.insert(changeset) do
      {:ok, data} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", data_path(conn, :show, data))
        |> render("show.json", data: data)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Reactom.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    data = Repo.get!(Data, id)
    render(conn, "show.json", data: data)
  end

  def update(conn, %{"id" => id, "data" => data_params}) do
    data = Repo.get!(Data, id)
    changeset = Data.changeset(data, data_params)

    case Repo.update(changeset) do
      {:ok, data} ->
        render(conn, "show.json", data: data)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Reactom.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    data = Repo.get!(Data, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(data)

    send_resp(conn, :no_content, "")
  end
end
