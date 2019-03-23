defmodule ApiWeb.DataView do
  use ApiWeb, :view
  alias ApiWeb.DataView

  def render("index.json", %{datas: datas}) do
    %{data: render_many(datas, DataView, "data.json")}
  end

  def render("show.json", %{data: data}) do
    %{data: render_one(data, DataView, "data.json")}
  end

  def render("data.json", %{data: data}) do
    %{id: data.id,
      url: data.url,
      title: data.title,
      artist: data.artist}
  end
end
