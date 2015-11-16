defmodule Reactom.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :category, :string
      add :price, :string
      add :stocked, :boolean, default: false
      add :name, :string

      timestamps
    end

  end
end
