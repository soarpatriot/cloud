defmodule Cloud.MoldControllerTest do
  use Cloud.ConnCase

  alias Cloud.Mold
  @valid_attrs %{name: "some content", url: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, mold_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing molds"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, mold_path(conn, :new)
    assert html_response(conn, 200) =~ "New mold"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, mold_path(conn, :create), mold: @valid_attrs
    assert redirected_to(conn) == mold_path(conn, :index)
    assert Repo.get_by(Mold, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, mold_path(conn, :create), mold: @invalid_attrs
    assert html_response(conn, 200) =~ "New mold"
  end

  test "shows chosen resource", %{conn: conn} do
    mold = Repo.insert! %Mold{}
    conn = get conn, mold_path(conn, :show, mold)
    assert html_response(conn, 200) =~ "Show mold"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, mold_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    mold = Repo.insert! %Mold{}
    conn = get conn, mold_path(conn, :edit, mold)
    assert html_response(conn, 200) =~ "Edit mold"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    mold = Repo.insert! %Mold{}
    conn = put conn, mold_path(conn, :update, mold), mold: @valid_attrs
    assert redirected_to(conn) == mold_path(conn, :show, mold)
    assert Repo.get_by(Mold, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    mold = Repo.insert! %Mold{}
    conn = put conn, mold_path(conn, :update, mold), mold: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit mold"
  end

  test "deletes chosen resource", %{conn: conn} do
    mold = Repo.insert! %Mold{}
    conn = delete conn, mold_path(conn, :delete, mold)
    assert redirected_to(conn) == mold_path(conn, :index)
    refute Repo.get(Mold, mold.id)
  end
end
