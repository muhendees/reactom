defmodule Reactom.Repo.Migrations.CreateArticle do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add :name, :string
      add :body, :string
      add :author, :string

      timestamps
    end

  end
end
