defmodule PrioritiesDb.Repo.Migrations.CreateTeam do
  use Ecto.Migration

  def change do
    create table(:team) do
      add :name, :string
    end
  end
end
