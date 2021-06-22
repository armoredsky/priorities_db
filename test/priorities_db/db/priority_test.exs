defmodule PrioritiesDb.Db.PriorityTest do
  use PrioritiesDb.RepoCase
  alias PrioritiesDb.Db.{Priority, Team}
  doctest PrioritiesDb.Db.Priority

  test "a Priority has a name, level, description, team" do
    t = %Priority{}
    assert t.name == nil
    assert t.level == nil
    assert t.description == nil
    assert t.team != nil
  end

  describe "changeset" do
    test "name is required" do
      t = %Priority{name: nil, level: 1, team_id: 1}
      changeset = Priority.changeset(t)
      assert changeset.errors == [name: {"can't be blank", [validation: :required]}]
    end

    test "level is required" do
      t = %Priority{name: "1", level: nil, team_id: 1}
      changeset = Priority.changeset(t)
      assert changeset.errors == [level: {"can't be blank", [validation: :required]}]
    end

    test "team is required" do
      t = %Priority{name: "1", level: 1, team_id: nil}
      changeset = Priority.changeset(t)
      assert changeset.errors == [team_id: {"can't be blank", [validation: :required]}]
    end
  end

  describe "insert" do
    test "a Priority returns a Priority with id" do
      team = Repo.insert!(%Team{name: "test_team"})

      prio = %{name: "a", level: 1, team_id: team.id}
      {:ok, priority} = Priority.insert(prio)

      assert priority.id >= 1
    end

    test "an invalid Priority returns the errors" do
      t = %{name: "", level: 1, team_id: 1}
      {:error, errors} = Priority.insert(t)
      assert errors == %{name: ["can't be blank"]}
    end
  end

  describe "update" do
    test "a Priority returns a priority" do
      team = Repo.insert!(%Team{name: "test_team"})
      prio = %{name: "a", level: 1, team_id: team.id}
      {:ok, priority} = Priority.insert(prio)

      {:ok, priority} = Priority.update(%{priority | level: 5})

      assert priority.level == 5
    end
  end
end
