defmodule Wld.Repo do
  use Ecto.Repo,
    otp_app: :wld,
    adapter: Ecto.Adapters.Postgres
end
