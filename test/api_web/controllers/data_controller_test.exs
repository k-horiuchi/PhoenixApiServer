defmodule ApiWeb.DataControllerTest do
  use ApiWeb.ConnCase

  alias Api.Accounts
  alias Api.Accounts.Data

  @create_attrs %{
    artist: "some artist",
    title: "some title",
    url: "some url"
  }
  @update_attrs %{
    artist: "some updated artist",
    title: "some updated title",
    url: "some updated url"
  }
  @invalid_attrs %{artist: nil, title: nil, url: nil}

  def fixture(:data) do
    {:ok, data} = Accounts.create_data(@create_attrs)
    data
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all datas", %{conn: conn} do
      conn = get(conn, Routes.data_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create data" do
    test "renders data when data is valid", %{conn: conn} do
      conn = post(conn, Routes.data_path(conn, :create), data: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.data_path(conn, :show, id))

      assert %{
               "id" => id,
               "artist" => "some artist",
               "title" => "some title",
               "url" => "some url"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.data_path(conn, :create), data: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update data" do
    setup [:create_data]

    test "renders data when data is valid", %{conn: conn, data: %Data{id: id} = data} do
      conn = put(conn, Routes.data_path(conn, :update, data), data: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.data_path(conn, :show, id))

      assert %{
               "id" => id,
               "artist" => "some updated artist",
               "title" => "some updated title",
               "url" => "some updated url"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, data: data} do
      conn = put(conn, Routes.data_path(conn, :update, data), data: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete data" do
    setup [:create_data]

    test "deletes chosen data", %{conn: conn, data: data} do
      conn = delete(conn, Routes.data_path(conn, :delete, data))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.data_path(conn, :show, data))
      end
    end
  end

  defp create_data(_) do
    data = fixture(:data)
    {:ok, data: data}
  end
end
