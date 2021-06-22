import Config

config :priorities_db, PrioritiesDb.Repo,
  database: "priorities",
  username: "priorities",
  password: "priorities",
  hostname: "localhost"

config :priorities_db, ecto_repos: [PrioritiesDb.Repo]

import_config "#{Mix.env()}.exs"
