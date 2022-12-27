defmodule Exp.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Exp.Repo,
      ExpWeb.Telemetry,
      {Phoenix.PubSub, name: Exp.PubSub},
      ExpWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: Exp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    ExpWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
