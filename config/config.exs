import Config

config :kyc_es_elixir,
  namespace: Exp,
  ecto_repos: [Exp.Repo],
  generators: [binary_id: true]

config :kyc_es_elixir,
  event_store: [
    adapter: Commanded.EventStore.Adapters.EventStore,
    event_store: Exp.EventStore
  ],
  pubsub: :local,
  registry: :local

config :kyc_es_elixir, Exp.EventStore,
  serializer: Commanded.Serialization.JsonSerializer,
  username: "postgres",
  password: "postgres",
  database: "eventstore_dev",
  hostname: "localhost",
  pool_size: 10

config :kyc_es_elixir, event_stores: [Exp.EventStore]

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
