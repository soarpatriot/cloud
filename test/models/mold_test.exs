defmodule Cloud.MoldTest do
  use Cloud.ModelCase

  alias Cloud.Mold

  @valid_attrs %{name: "some content", url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Mold.changeset(%Mold{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Mold.changeset(%Mold{}, @invalid_attrs)
    refute changeset.valid?
  end
end
