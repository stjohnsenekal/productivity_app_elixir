defmodule TaskProcessor do
  use GenEvent
  @moduledoc """
  Documentation for `ToDo`.
  """

  def handle_event({:log, x}, messages) do
    IO.puts("reached handler in tasks")
    IO.inspect(x)
    IO.inspect(messages)
    {:ok, [x|messages]}
  end

end
