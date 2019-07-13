defmodule Bla.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {DynamicSupervisor, name: Bla.DynSup, strategy: :one_for_one}
      # Starts a worker by calling: Bla.Worker.start_link(arg)
      # {Bla.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Bla.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
