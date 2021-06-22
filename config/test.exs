import Config

config :priorities_db, PrioritiesDb.Repo,
  database: "priorities",
  username: "priorities",
  password: "priorities",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :logger, level: :info
