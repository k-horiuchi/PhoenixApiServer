defmodule Api.Repo.Migrations.CreateDatas do
  use Ecto.Migration

  def change do
    create table(:datas) do
      add :url, :string
      add :title, :string
      add :artist, :string

      timestamps()
    end

  end
end
