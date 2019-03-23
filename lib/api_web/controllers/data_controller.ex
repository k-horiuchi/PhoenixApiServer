defmodule ApiWeb.DataController do
  use ApiWeb, :controller

  alias Api.Accounts
  alias Api.Accounts.Data

  action_fallback ApiWeb.FallbackController

  def index(conn, _params) do
    datas = Accounts.list_datas()
    render(conn, "index.json", datas: datas)
  end

  def create(conn, %{"data" => data_params}) do
    with {:ok, %Data{} = data} <- Accounts.create_data(data_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.data_path(conn, :show, data))
      |> render("show.json", data: data)
    end
  end

  def show(conn, %{"id" => id}) do
    data = Accounts.get_data!(id)
    render(conn, "show.json", data: data)
  end

  def update(conn, %{"id" => id, "data" => data_params}) do
    data = Accounts.get_data!(id)

    with {:ok, %Data{} = data} <- Accounts.update_data(data, data_params) do
      render(conn, "show.json", data: data)
    end
  end

  def delete(conn, %{"id" => id}) do
    data = Accounts.get_data!(id)

    with {:ok, %Data{}} <- Accounts.delete_data(data) do
      send_resp(conn, :no_content, "")
    end
  end
end
