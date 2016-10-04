
defmodule Cloud.Session do 
  import Plug.Conn 
  import Comeonin.Bcrypt, only: [ checkpw: 2]
  alias Cloud.User

  def login(conn, user) do 
    conn
    |> assign(:current_user, user)
    |> put_session(:user_id, user.id)
    |> configure_session(renew: true)
    
  end

  def login(conn, email, given_pass) do 
    user = Cloud.Repo.get_by(User, email: email)
    cond do 
      user && checkpw(given_pass, user.password_hash) ->
        {:ok, login(conn,user)}
      user ->
        {:error, :unauthorized,conn}
      true -> 
        {:error, :not_found, conn}
    end
  end

  def logout(conn) do 
    configure_session(conn, drop: true)
  end
end
