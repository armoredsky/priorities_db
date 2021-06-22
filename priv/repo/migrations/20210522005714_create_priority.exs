defmodule PrioritiesDb.Repo.Migrations.CreatePriority do
  use Ecto.Migration

  def change do
    create table(:priority) do
      add :name, :string
      add :description, :varchar
      add :level, :integer
      add :team_id, references(:team)
    end
  end
end
