defmodule Api.Accounts.Data do
  use Ecto.Schema
  import Ecto.Changeset

  schema "datas" do
    field :artist, :string
    field :title, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(data, attrs) do
    data
    |> cast(attrs, [:url, :title, :artist])
    |> validate_required([:url, :title, :artist])
  end
end
