defmodule PrioritiesDb.Db.TeamPriorityTest do
  use PrioritiesDb.RepoCase
  alias PrioritiesDb.Repo
  alias PrioritiesDb.Db.{Priority, Team}

  describe "associations" do
    test "a Priority belongs to a Team" do
      team =
        %Team{name: "team 1"}
        |> Repo.insert!()

      prio =
        %Priority{name: "Quality", level: 1, team_id: team.id}
        |> Repo.insert!()

      team =
        Team
        |> Repo.get_by!(id: team.id)
        |> Repo.preload(:priorities)

      assert team.priorities == [prio]
    end
  end
end
