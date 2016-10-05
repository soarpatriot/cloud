
defmodule Passport.Plug do 
  require Logger
  import Plug.Conn 
  import Phoenix.Controller
  alias Cloud.Repo
  alias Cloud.User
  require IEx

  def authenticate(conn, _) do 
    Logger.info("authenticate")
    as_conn = current_user(conn,nil)
    case as_conn.assigns[:current_user] do
      nil ->
        Logger.info("current_user is nil!")
        as_conn |> redirect(to: "/login") |> halt
      _ ->
        as_conn
    end
 
  end

  def current_user(conn, _) do 
    user_id = get_session(conn, :user_id)
    user = user_id && Repo.get User,user_id
    assign(conn, :current_user, user)
  end

  # def logged_in?(conn), do: !!current_user(conn)
end
