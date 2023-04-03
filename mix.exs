defmodule DynDB.MixProject do
  use Mix.Project

  def project do
    [
      app: :dyn_db,
      version: "0.0.1",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "DynDB",
      source_url: "https://github.com/andyl/dyn_db",
      homepage_url: "https://github.com/andyl/dyn_db",
      docs: docs()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  def docs do
    [
      main: "readme",
      extras: ["README.md"],
    ]
  end

  defp deps do
    [
      {:ecto, "~> 3.9"},
      {:ecto_sql, "~> 3.9"},
      {:ecto_sqlite3, "~> 0.9"},
      {:ex_doc, "~> 0.27", only: :dev, runtime: false}
    ]
  end
end
