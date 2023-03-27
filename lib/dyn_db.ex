defmodule DynDb do
  @moduledoc """
  Documentation for `DynDb`.
  """

  def start_link(args) do
    DynDb.Repo.start_link(args)
  end

  def all(repo, sch) do
    DynDb.Repo.put_dynamic_repo(repo)
    DynDb.Repo.all(sch)
  end

  def insert!(repo, data) do
    DynDb.Repo.put_dynamic_repo(repo)
    DynDb.Repo.insert!(data)
  end

  def migrate(repo, klas) do
    DynDb.Repo.put_dynamic_repo(repo)
    Ecto.Migrator.run(DynDb.Repo, [{0, klas}], :up, all: true, dynamic_repo: repo)
  end

  def exec(repo, callback) do
    DynDb.Repo.put_dynamic_repo(repo)
    callback.()
  end
end
