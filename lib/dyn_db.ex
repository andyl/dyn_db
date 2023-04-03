defmodule DynDB do
  @moduledoc """
  Documentation for `DynDB`.
  """

  def start_link(args) do
    DynDB.Repo.start_link(args)
  end

  # DynDB.Query
  defdelegate all(repo, queryable, opts \\ []), to: DynDB.Query
  defdelegate delete_all(repo, queryable, opts \\ []), to: DynDB.Query
  defdelegate exists?(repo, queryable, opts \\ []), to: DynDB.Query
  defdelegate get(repo, queryable, id, opts \\ []), to: DynDB.Query
  defdelegate get!(repo, queryable, id, opts \\ []), to: DynDB.Query
  defdelegate get_by(repo, queryable, clauses, opts \\ []), to: DynDB.Query
  defdelegate get_by!(repo, queryable, clauses, opts \\ []), to: DynDB.Query
  defdelegate one(repo, queryable, opts \\ []), to: DynDB.Query
  defdelegate one!(repo, queryable, opts \\ []), to: DynDB.Query
  defdelegate update_all(repo, queryable, clauses, opts \\ []), to: DynDB.Query

  # DynDB.Schema
  defdelegate delete(repo, struct_or_changeset, opts \\ []), to: DynDB.Schema
  defdelegate delete!(repo, struct_or_changeset, opts \\ []), to: DynDB.Schema
  defdelegate insert(repo, struct_or_changeset, opts \\ []), to: DynDB.Schema
  defdelegate insert!(repo, struct_or_changeset, opts \\ []), to: DynDB.Schema
  defdelegate insert_all(repo, schema_or_source, entries_or_query, opts \\ []), to: DynDB.Schema
  defdelegate insert_or_update(repo, changeset, opts \\ []), to: DynDB.Schema
  defdelegate insert_or_update!(repo, changeset, opts \\ []), to: DynDB.Schema
  defdelegate update(repo, changeset, opts \\ []), to: DynDB.Schema
  defdelegate update!(repo, changeset, opts \\ []), to: DynDB.Schema

  def migrate(repo, klas) do
    DynDB.Repo.put_dynamic_repo(repo)
    Ecto.Migrator.run(DynDB.Repo, [{0, klas}], :up, all: true, dynamic_repo: repo)
  end

  def exec(repo, callback) do
    DynDB.Repo.put_dynamic_repo(repo)
    callback.()
  end
end
