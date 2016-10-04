

defmodule Cloud.Password do 
  alias Cloud.Repo 
  import Ecto.Changeset, only: [put_change: 3]
  import Comeonin.Bcrypt, only: [hashpwsalt: 1]

  @doc """
  generates a password
  """
  
  def generate_password(changeset) do 
    put_change(changeset, :password_hash, hashpwsalt(changeset.params["password"]))
  end

  @doc """
  generate the passsword
  """
  def encrypted(changeset) do 
    changeset 
      |> generate_password
  end
end
