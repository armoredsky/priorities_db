defmodule PrioritiesDb.Db.Priority do
  alias PrioritiesDb.Repo
  alias PrioritiesDb.Db.{Team, Util}
  use Ecto.Schema

  schema "priority" do
    field(:name, :string)
    field(:description, :string)
    field(:level, :integer)

    belongs_to(:team, Team)
  end

  def changeset(priority, params \\ %{}) do
    priority
    |> Ecto.Changeset.cast(params, [:name, :description, :level, :team_id])
    |> Ecto.Changeset.validate_required([:name, :level, :team_id])
  end

  def insert(params) do
    Repo.insert(__MODULE__.changeset(%__MODULE__{}, params))
    |> Util.handle_data_change()
  end

  def update(params = %__MODULE__{}), do: update(Map.from_struct(params))
  def update(params) do
    priority = Repo.get!(__MODULE__, params.id)

    Repo.update(__MODULE__.changeset(priority, params))
    |> Util.handle_data_change()
  end
end
