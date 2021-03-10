defmodule ToDoTest do
  use ExUnit.Case
  doctest ToDo

  test "create list" do
    assert ToDo.create_list("II", []) == %ScheduleList{name: "II", listItems: []}
  end

  test "get list" do
    assert ToDo.get_list("II") == %ScheduleList{name: "II", listItems: []}
  end

  test "create list item independently" do
    dateOfToday = Date.utc_today
    assert ToDo.create_listItem("Pay rent", dateOfToday, 1) == %ListItem{name: "Pay rent", date: dateOfToday, rank: 1}
  end

  test "create list item and add to list" do
    dateOfToday = Date.utc_today

    listItem1 = ToDo.create_listItem("Update github repo", dateOfToday, 2)
    listItem2 = ToDo.create_listItem("Add secondary SSH key", dateOfToday, 3)

    result
      =
      ToDo.get_list("II")
      |>  ToDo.add_to_list(listItem1)
      |>  ToDo.add_to_list(listItem2)

      assert result = %ScheduleList{name: "II", listItems: [listItem1, listItem2]}

  end

end
