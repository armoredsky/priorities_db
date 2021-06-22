defmodule PrioritiesDb.ServiceTest do
  use PrioritiesDb.RepoCase
  alias PrioritiesDb.Service
  alias PrioritiesDb.Db.Team
  doctest PrioritiesDb.Service

  @team %{
    name: "Team 1"
  }

  @priority %{
    name: "quality",
    description: "desc",
    level: 1
  }

  test "add a priority to a team" do
    {:ok, team} = Team.insert(@team)
    {:ok, priority} = Service.add_priority(team.id, @priority)

    assert priority.id >= 1
  end
end
