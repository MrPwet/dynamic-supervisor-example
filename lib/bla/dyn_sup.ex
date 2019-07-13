defmodule Bla.DynSup do
  use DynamicSupervisor

  @name __MODULE__

  @spec start_link(any) :: :ignore | {:error, any} | {:ok, pid}
  def start_link(args) do
    DynamicSupervisor.start_link(__MODULE__, args, name: @name)
  end

  def init(_args) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end
end
