defmodule Doubler do
  use GenServer

  # Public API

  @spec start_link([]) :: :ignore | {:error, any} | {:ok, pid}
  def start_link([] = args) do
    GenServer.start(__MODULE__, args, [])
  end

  @spec compute(pid, number) :: any
  def compute(pid, number) when is_pid(pid) and is_number(number) do
    GenServer.call(pid, {:compute, number})
  end

  defdelegate stop(pid), to: GenServer

  # Callbacks

  @spec init([]) :: {:ok, nil}
  def init([]) do
    {:ok, nil}
  end

  def handle_call({:compute, number}, _from, state) do
    IO.puts("Doubling #{number}...")
    Process.sleep(1500)
    {:reply, number * 2, state}
  end
end
