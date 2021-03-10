defmodule ProductivityAppElixirObserverTest do
  use ExUnit.Case
  doctest ProductivityAppElixirObserver

  test "init" do
    assert ProductivityAppElixirObserver.init() == :ok
  end

end
