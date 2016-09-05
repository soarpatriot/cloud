defmodule Cloud.PageController do
  use Cloud.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
