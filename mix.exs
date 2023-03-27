defmodule DynDb.MixProject do
  use Mix.Project

  def project do
    [
      app: :dyn_db,
      version: "0.0.1",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ecto, "~> 3.9"},
      {:ecto_sql, "~> 3.9"},
      {:ecto_sqlite3, "~> 0.9"},
    ]
  end
end
