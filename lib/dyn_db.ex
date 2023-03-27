defmodule DynDb do
  @moduledoc """
  Documentation for `DynDb`.
  """

  def start_link(args) do
    DynDb.Repo.start_link(args)
  end

  defdelegate all(repo, queryable, opts \\ []), to: DynDb.Query
  defdelegate delete_all(repo, queryable, opts \\ []), to: DynDb.Query
  defdelegate exists?(repo, queryable, opts \\ []), to: DynDb.Query
  defdelegate get(repo, queryable, id, opts \\ []), to: DynDb.Query
  defdelegate get!(repo, queryable, id, opts \\ []), to: DynDb.Query
  defdelegate get_by(repo, queryable, clauses, opts \\ []), to: DynDb.Query
  defdelegate get_by!(repo, queryable, clauses, opts \\ []), to: DynDb.Query
  defdelegate one(repo, queryable, opts \\ []), to: DynDb.Query
  defdelegate one!(repo, queryable, opts \\ []), to: DynDb.Query
  defdelegate update_all(repo, queryable, clauses, opts \\ []), to: DynDb.Query

  defdelegate delete(repo, struct_or_changeset, opts \\ []), to: DynDb.Schema
  defdelegate delete!(repo, struct_or_changeset, opts \\ []), to: DynDb.Schema
  defdelegate insert(repo, struct_or_changeset, opts \\ []), to: DynDb.Schema
  defdelegate insert!(repo, struct_or_changeset, opts \\ []), to: DynDb.Schema
  defdelegate insert_all(repo, schema_or_source, entries_or_query, opts \\ []), to: DynDb.Schema
  defdelegate insert_or_update(repo, changeset, opts \\ []), to: DynDb.Schema
  defdelegate insert_or_update!(repo, changeset, opts \\ []), to: DynDb.Schema
  defdelegate update(repo, changeset, opts \\ []), to: DynDb.Schema
  defdelegate update!(repo, changeset, opts \\ []), to: DynDb.Schema

  def migrate(repo, klas) do
    DynDb.Repo.put_dynamic_repo(repo)
    Ecto.Migrator.run(DynDb.Repo, [{0, klas}], :up, all: true, dynamic_repo: repo)
  end

  def exec(repo, callback) do
    DynDb.Repo.put_dynamic_repo(repo)
    callback.()
  end
end
