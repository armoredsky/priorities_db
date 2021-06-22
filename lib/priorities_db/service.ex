defmodule PrioritiesDb.Service do
  alias PrioritiesDb.Db.{Priority}

  def add_priority(team_id, priority) do
    priority
    |> Map.put(:team_id, team_id)
    |> Priority.insert()
  end
end
