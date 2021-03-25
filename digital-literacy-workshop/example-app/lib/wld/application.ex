defmodule Wld.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Wld.Repo,
      # Start the Telemetry supervisor
      WldWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Wld.PubSub},
      # Start the Endpoint (http/https)
      WldWeb.Endpoint
      # Start a worker by calling: Wld.Worker.start_link(arg)
      # {Wld.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Wld.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    WldWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
