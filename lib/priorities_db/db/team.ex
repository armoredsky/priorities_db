defmodule PrioritiesDb.Db.Team do
  alias PrioritiesDb.Repo
  alias PrioritiesDb.Db.{Priority, Util}
  use Ecto.Schema

  schema "team" do
    field(:name, :string)

    has_many(:priorities, Priority)
  end

  def changeset(team, params \\ %{}) do
    team
    |> Ecto.Changeset.cast(params, [:name])
    |> Ecto.Changeset.validate_required([:name])
  end

  def insert(params) do
    Repo.insert(__MODULE__.changeset(%__MODULE__{}, params))
    |> Util.handle_data_change()
  end

  def get_all() do
    __MODULE__
    |> Repo.all()
    |> Repo.preload(:priorities)
  end

  def get_by_id(team_id) do
    __MODULE__
    |> Repo.get_by!(id: team_id)
    |> Repo.preload(:priorities)
  end
end
