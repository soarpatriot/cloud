defmodule Cloud.Repo.Migrations.CreateMold do
  use Ecto.Migration

  def change do
    create table(:molds) do
      add :name, :string
      add :url, :string

      timestamps()
    end

  end
end
