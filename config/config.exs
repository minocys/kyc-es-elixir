# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :kyc_es_elixir,
  namespace: Exp,
  ecto_repos: [Exp.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :kyc_es_elixir, ExpWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: ExpWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Exp.PubSub,
  live_view: [signing_salt: "KinBWtGy"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
