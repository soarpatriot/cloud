defmodule Cloud.MoldController do
  use Cloud.Web, :controller

  alias Cloud.Mold

  def index(conn, _params) do
    molds = Repo.all(Mold)
    render(conn, "index.html", molds: molds)
  end

  def new(conn, _params) do
    changeset = Mold.changeset(%Mold{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"mold" => mold_params}) do
    changeset = Mold.changeset(%Mold{}, mold_params)

    case Repo.insert(changeset) do
      {:ok, _mold} ->
        conn
        |> put_flash(:info, "Mold created successfully.")
        |> redirect(to: mold_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    mold = Repo.get!(Mold, id)
    render(conn, "show.html", mold: mold)
  end

  def edit(conn, %{"id" => id}) do
    mold = Repo.get!(Mold, id)
    changeset = Mold.changeset(mold)
    render(conn, "edit.html", mold: mold, changeset: changeset)
  end

  def update(conn, %{"id" => id, "mold" => mold_params}) do
    mold = Repo.get!(Mold, id)
    changeset = Mold.changeset(mold, mold_params)

    case Repo.update(changeset) do
      {:ok, mold} ->
        conn
        |> put_flash(:info, "Mold updated successfully.")
        |> redirect(to: mold_path(conn, :show, mold))
      {:error, changeset} ->
        render(conn, "edit.html", mold: mold, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    mold = Repo.get!(Mold, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(mold)

    conn
    |> put_flash(:info, "Mold deleted successfully.")
    |> redirect(to: mold_path(conn, :index))
  end
end
