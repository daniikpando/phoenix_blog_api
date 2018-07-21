# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :blog_real,
  ecto_repos: [BlogReal.Repo]

# Configures the endpoint
config :blog_real, BlogRealWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "KTA2gILrYoEcU/lWmhDqYpYKd4ohd6FLX95F3guLsFdv/2iDie0W7Oks19Kz9LuC",
  render_errors: [view: BlogRealWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BlogReal.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
