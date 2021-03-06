defmodule Ass41.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger


  @impl true
  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: Router, options: [port: port()]}
      # Starts a worker by calling: Ass41.Worker.start_link(arg)
      # {Ass41.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Ass41.Supervisor]
    Logger.info("Loading......")
    Supervisor.start_link(children, opts)
  end
  defp port, do: Application.get_env(:app, :port, 8080)
end
