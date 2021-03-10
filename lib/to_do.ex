defmodule ToDo do
  @moduledoc """
  Documentation for `ToDo`.
  """

  def init() do
    IO.puts("welcome")
    Date.utc_today()
    #pipe all the initiating activities, get date, get today's schedule, show list

  end

  @doc """
    Creates a new schedule list struct.
  """
  def create_list(name, listItems) do
    %ScheduleList{name: name, listItems: listItems}
  end

  @doc """
    Creates a new schedule list item struct.
  """
  def create_listItem(name, date, rank) do
    %ListItem{name: name, date: date, rank: rank}
  end

  @doc """
    Retrieves a list with a certain name.
  """
  def get_list(name) do
    %ScheduleList{name: name}
  end

  @doc """
    Adds an list item to a schedule list.
  """
  def add_to_list(scheduleList, listItem) do
    #IO.inspect(scheduleList)
    updatedItems = scheduleList.listItems ++ [listItem]
    %ScheduleList{name: scheduleList.name, listItems: updatedItems}
  end

end
