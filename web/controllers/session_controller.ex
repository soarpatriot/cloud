defmodule Cloud.SessionController do
  use Cloud.Web, :controller
  require IEx
  alias Cloud.User
  alias Cloud.Session

  plug :put_layout, "bare.html"


  def new(conn, _) do
    conn
    |> render(:new)
  end

  def create(conn, %{"session" => %{"email" => email, "password" => pass}}) do
    case Session.login(conn, email, pass) do
    {:ok, conn} ->
      conn
      |> put_flash(:info, "Welcome back!")
      |> redirect(to: page_path(conn, :index))
    {:error, _reason, conn} ->
      conn
      |> put_flash(:error, "用户名或密码不正确！")
      |> render(:new)
    end
  end

  def delete(conn, _) do
    conn
    |> Session.logout()
    |> put_flash(:info, "You have been logged out")
    |> redirect(to: "/")
  end
end
