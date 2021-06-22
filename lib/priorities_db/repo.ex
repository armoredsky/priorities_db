defmodule PrioritiesDb.Repo do
  use Ecto.Repo,
    otp_app: :priorities_db,
    adapter: Ecto.Adapters.Postgres
end
