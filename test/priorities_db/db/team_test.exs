defmodule PrioritiesDb.Db.TeamTest do
  use PrioritiesDb.RepoCase
  alias PrioritiesDb.Db.Team
  doctest PrioritiesDb.Db.Team

  test "a Team has a name" do
    t = %Team{}
    assert t.name == nil
  end

  describe "changeset" do
    test "first name is required" do
      t = %Team{name: nil}
      changeset = Team.changeset(t)
      assert changeset.errors == [name: {"can't be blank", [validation: :required]}]
    end
  end

  describe "insert" do
    test "inserting a Team returns a Team with id" do
      t = %{name: "a"}
      {:ok, team} = Team.insert(t)
      assert team.id >= 1
    end

    test "inserting an invalid Team returns the errors" do
      t = %{name: ""}
      {:error, errors} = Team.insert(t)
      assert errors == %{name: ["can't be blank"]}
    end
  end

  describe "get" do
    test "a team" do
      {:ok, team} = Team.insert(%{name: "a"})

      fetched_team = Team.get_by_id(team.id)
      assert fetched_team.id == team.id
    end

    test "inserting an invalid Team returns the errors" do
      t = %{name: ""}
      {:error, errors} = Team.insert(t)
      assert errors == %{name: ["can't be blank"]}
    end
  end
end
