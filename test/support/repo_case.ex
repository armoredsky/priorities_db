defmodule PrioritiesDb.RepoCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias PrioritiesDb.Repo

      import Ecto
      import Ecto.Query
      import PrioritiesDb.RepoCase

      # and any other stuff
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(PrioritiesDb.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(PrioritiesDb.Repo, {:shared, self()})
    end

    :ok
  end

  def clean_up_db(_context) do
    PrioritiesDb.Repo.delete_all(PrioritiesDb.Db.Priority)
    PrioritiesDb.Repo.delete_all(PrioritiesDb.Db.Team)
    :ok
  end

  setup :clean_up_db
end
