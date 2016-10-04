defmodule Cloud.PageController do
  use Cloud.Web, :controller
  # plug Addict.Plugs.Authenticated when action in [:index]
  # plug :action


  def index(conn, _params) do
    render conn, "index.html"
  end
end
