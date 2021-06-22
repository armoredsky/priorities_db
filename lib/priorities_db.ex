defmodule PrioritiesDb do
  alias PrioritiesDb.Db.{Team, Priority}
  alias PrioritiesDb.Service

  defdelegate insert_team(team), to: Team, as: :insert
  defdelegate get_teams, to: Team, as: :get_all
  defdelegate get_team(team_id), to: Team, as: :get_by_id

  defdelegate add_priority(team_id, priority), to: Service
  defdelegate update_priority(priority), to: Priority, as: :update
end
