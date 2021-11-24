defmodule Ass41.Staff do
  require Amnesia
  require Amnesia.Helper
  require Exquisite
  require Database.Staff

  alias Database.Staff

  def add_staff(first_name, last_name, age, starting_salary) do
    Amnesia.transaction do
      %Staff{first_name: first_name, last_name: last_name, age: age, salary: starting_salary}
      |> Staff.write()
    end
  end

  def get_staff(staff_id) do
    Amnesia.transaction do
      Staff.read(staff_id)
    end
    |> case do
      %Staff{} = staff -> staff
      _ -> {:error, :not_found}
    end
  end

end
