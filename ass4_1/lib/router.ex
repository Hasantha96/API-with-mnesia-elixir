defmodule Router do
  use Plug.Router
  plug Plug.Logger

  plug :match
  plug Plug.Parsers,  parsers: [:json],
                      pass: ["application/json"],
                      json_decoder: Jason
  plug :dispatch

  forward "/staff", to: Routes.StaffRoutes

  match _ do
    send_resp(conn, 400, "Invalid URL")
  end
end
