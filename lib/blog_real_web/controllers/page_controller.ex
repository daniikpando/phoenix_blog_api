defmodule BlogRealWeb.PageController do
  use BlogRealWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
