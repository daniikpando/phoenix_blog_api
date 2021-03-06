use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :blog_real, BlogRealWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :blog_real, BlogReal.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "daniel",
  password: "123456",
  database: "blog_real_test",
  hostname: "127.0.0.1",
  pool: Ecto.Adapters.SQL.Sandbox
