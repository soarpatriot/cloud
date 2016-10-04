
defmodule Cloud.Plug.Authenticate do 
  import Plug.Conn 
  import Cloud.Router.Helpers
  import Phoenix.Controller
  alias Cloud.Repo
  alias Cloud.User
  def init(default), do: default 

  def call(conn, default) do 
    user = current_user(conn)
    assign(conn, :current_user, user)
    unless user do
      conn 
        |> redirect(to: session_path(conn, :new))
    end
 
  end

  def current_user(conn) do 
    user_id = get_session(conn, :user_id)
    user = user_id && Repo.get User,user_id
  end

  def logged_in?(conn), do: !!current_user(conn)
end
