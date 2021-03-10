defmodule ProductivityAppElixirObserver do
  use GenEvent
  @moduledoc """
  Documentation for `ProductivityAppElixirObserver`.

  This is the subject of the observer patterns. It is the main function.
  It contains a list of observers, in this case the logger and the task_processor.
  Upon receiving an event, it notifies the observers.
  """

  def init() do
    {:ok, pid} = GenEvent.start_link()
    IO.inspect(pid)

    %Observers{list: observerList} = %Observers{list: [TaskLogger, TaskProcessor]} #[TaskLogger, TaskProcessor]

    Enum.each observerList, fn(observer) ->
      register(observer, pid)
    end

    :timer.sleep(2000)

    notifyObservers(pid, {:log, 1})

    :timer.sleep(2000)
    :ok
  end

  def register(observer, pid) do
    GenEvent.add_handler(pid, observer, [])
  end

  def unregister(_observer) do
    true
  end

  def notifyObservers(pid, event) do
    GenEvent.notify(pid, event)
  end


end
