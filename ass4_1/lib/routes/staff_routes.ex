defmodule Routes.StaffRoutes do
  use Routes.Base

  require Amnesia
  require Amnesia.Helper
  require Exquisite
  require Database.Staff

  alias Database.Staff

  get "/:acc_id" do
    id_num= String.to_integer(acc_id)
    case Ass41.Staff.get_staff(id_num) do
      %Staff{} = staff ->
        data= [%{"id" => staff.id, "first name" => staff.first_name, "age" => staff.age, "last name" => staff.last_name, "salary" => staff.salary}]
        send(conn, 200, data)
    end
  end

  post "/add staff" do
    first_name= conn.body_params["first name"]
    last_name= conn.body_params["last name"]
    age= conn.body_params["age"]
    salary= conn.body_params["salary"]
    case Ass41.Staff.add_staff(first_name,last_name,age,salary) do
      %Staff{} = staff ->
        data= [%{"id" => staff.id, "first name" => staff.first_name, "age" => staff.age, "last name" => staff.last_name, "salary" => staff.salary}]
        send(conn, 200, data)
    end
  end

end
