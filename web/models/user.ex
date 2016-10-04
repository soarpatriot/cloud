defmodule Cloud.User do
  use Cloud.Web, :model
  alias Cloud.Password

  schema "users" do
    field :email, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :password_hash, :string

    timestamps
  end
  
  @required_fields ~w(email password password_confirmation)

  def changeset(model, params \\ :empty) do model
    |> cast(params, @required_fields, [])
    |> validate_length(:email, min: 1, max: 150)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 6, max: 30)
    |> unique_constraint(:email)
  end
  
  def registration_changeset(model, params) do model
    |> changeset(params)
    |> cast(params, @required_fields, [])
    |> validate_confirmation(:password)
    # |> put_hashed_password()
    |> Password.encrypted()
  end
  defp put_hashed_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        Password.encrypted(pass)
        _ ->
          changeset
    end
  end

end
