defmodule Slideworks.PageController do
  use Slideworks.Web, :controller

  def index(conn, %{"theme" => theme}) do
    render conn, "index.html", %{theme: theme}
  end

  def index(conn, _params) do
    render conn, "index.html", %{theme: "black"}
  end
end
