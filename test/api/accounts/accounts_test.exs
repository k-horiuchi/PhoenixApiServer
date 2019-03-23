defmodule Api.AccountsTest do
  use Api.DataCase

  alias Api.Accounts

  describe "datas" do
    alias Api.Accounts.Data

    @valid_attrs %{artist: "some artist", title: "some title", url: "some url"}
    @update_attrs %{artist: "some updated artist", title: "some updated title", url: "some updated url"}
    @invalid_attrs %{artist: nil, title: nil, url: nil}

    def data_fixture(attrs \\ %{}) do
      {:ok, data} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_data()

      data
    end

    test "list_datas/0 returns all datas" do
      data = data_fixture()
      assert Accounts.list_datas() == [data]
    end

    test "get_data!/1 returns the data with given id" do
      data = data_fixture()
      assert Accounts.get_data!(data.id) == data
    end

    test "create_data/1 with valid data creates a data" do
      assert {:ok, %Data{} = data} = Accounts.create_data(@valid_attrs)
      assert data.artist == "some artist"
      assert data.title == "some title"
      assert data.url == "some url"
    end

    test "create_data/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_data(@invalid_attrs)
    end

    test "update_data/2 with valid data updates the data" do
      data = data_fixture()
      assert {:ok, %Data{} = data} = Accounts.update_data(data, @update_attrs)
      assert data.artist == "some updated artist"
      assert data.title == "some updated title"
      assert data.url == "some updated url"
    end

    test "update_data/2 with invalid data returns error changeset" do
      data = data_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_data(data, @invalid_attrs)
      assert data == Accounts.get_data!(data.id)
    end

    test "delete_data/1 deletes the data" do
      data = data_fixture()
      assert {:ok, %Data{}} = Accounts.delete_data(data)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_data!(data.id) end
    end

    test "change_data/1 returns a data changeset" do
      data = data_fixture()
      assert %Ecto.Changeset{} = Accounts.change_data(data)
    end
  end
end
