defmodule Slideworks.PageController do
  use Slideworks.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
