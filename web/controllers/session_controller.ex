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

    if(String.strip(email) =="" || String.strip(pass) == "") do 
      conn
        |> put_flash(:error, "用户名密码不能为空！")
        |> render(:new)
 
    else 
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
  end

  defp validate_user(attr, tip) do 
     
  end

  def delete(conn, _) do
    conn
    |> Session.logout()
    |> put_flash(:info, "You have been logged out")
    |> redirect(to: "/")
  end
end
