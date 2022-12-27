defmodule Exp.Repo do
  use Ecto.Repo,
    otp_app: :kyc_es_elixir,
    adapter: Ecto.Adapters.Postgres
end
