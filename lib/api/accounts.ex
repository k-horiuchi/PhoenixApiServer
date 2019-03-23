defmodule Api.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Api.Repo

  alias Api.Accounts.Data

  @doc """
  Returns the list of datas.

  ## Examples

      iex> list_datas()
      [%Data{}, ...]

  """
  def list_datas do
    Repo.all(Data)
  end

  @doc """
  Gets a single data.

  Raises `Ecto.NoResultsError` if the Data does not exist.

  ## Examples

      iex> get_data!(123)
      %Data{}

      iex> get_data!(456)
      ** (Ecto.NoResultsError)

  """
  def get_data!(id), do: Repo.get!(Data, id)

  @doc """
  Creates a data.

  ## Examples

      iex> create_data(%{field: value})
      {:ok, %Data{}}

      iex> create_data(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_data(attrs \\ %{}) do
    %Data{}
    |> Data.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a data.

  ## Examples

      iex> update_data(data, %{field: new_value})
      {:ok, %Data{}}

      iex> update_data(data, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_data(%Data{} = data, attrs) do
    data
    |> Data.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Data.

  ## Examples

      iex> delete_data(data)
      {:ok, %Data{}}

      iex> delete_data(data)
      {:error, %Ecto.Changeset{}}

  """
  def delete_data(%Data{} = data) do
    Repo.delete(data)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking data changes.

  ## Examples

      iex> change_data(data)
      %Ecto.Changeset{source: %Data{}}

  """
  def change_data(%Data{} = data) do
    Data.changeset(data, %{})
  end
end
