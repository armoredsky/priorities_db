defmodule PrioritiesDb.PrioritiesDbTest do
  use PrioritiesDb.RepoCase
  doctest PrioritiesDb

  @team %{
    name: "Team 1"
  }

  @priority %{
    name: "quality",
    description: "desc",
    level: 1
  }

  test "insert team" do
    {:ok, team} = PrioritiesDb.insert_team(@team)
    assert team.id >= 1
  end

  test "add a priority to a team" do
    {:ok, team} = PrioritiesDb.insert_team(@team)
    {:ok, priority} = PrioritiesDb.add_priority(team.id, @priority)

    assert priority.id >= 1
  end

  test "get all teams" do
    PrioritiesDb.insert_team(@team)
    PrioritiesDb.insert_team(%{name: "team_2"})

    teams = PrioritiesDb.get_teams()

    assert Enum.count(teams) == 2
  end
end
