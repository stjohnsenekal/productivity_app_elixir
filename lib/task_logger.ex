defmodule TaskLogger do
  use GenEvent
  @moduledoc """
  Documentation for `ToDo`.
  """

  def handle_event({:log, x}, messages) do
    IO.puts("reached handler in logger")
    IO.inspect(x)
    IO.inspect(messages)
    {:ok, [x|messages]}
  end

  def log() do
    "logged"
  end


end
