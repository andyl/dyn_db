defmodule DynDb.Repo do
  use Ecto.Repo,
    adapter: Ecto.Adapters.SQLite3,
    otp_app: :dyn_db
end
