defmodule Reactom.Repo.Migrations.CreateComment do
  use Ecto.Migration

  def change do
    create table(:author) do
      add :text, :string

      timestamps
    end

  end
end
