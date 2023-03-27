defmodule DynDb.Schema do

  def delete(repo, struct_or_changeset, opts \\ []) do
    DynDb.Repo.put_dynamic_repo(repo)
    DynDb.Repo.delete(struct_or_changeset, opts)
  end

  def delete!(repo, struct_or_changeset, opts \\ []) do
    DynDb.Repo.put_dynamic_repo(repo)
    DynDb.Repo.delete!(struct_or_changeset, opts)
  end

  def insert(repo, struct_or_changeset, opts \\ []) do
    DynDb.Repo.put_dynamic_repo(repo)
    DynDb.Repo.insert(struct_or_changeset, opts)
  end

  def insert!(repo, struct_or_changeset, opts \\ []) do
    DynDb.Repo.put_dynamic_repo(repo)
    DynDb.Repo.insert!(struct_or_changeset, opts)
  end

  def insert_all(repo, schema_or_source, entries_or_query, opts \\ []) do
    DynDb.Repo.put_dynamic_repo(repo)
    DynDb.Repo.insert_all(schema_or_source, entries_or_query, opts)
  end

  def insert_or_update(repo, changeset, opts \\ []) do
    DynDb.Repo.put_dynamic_repo(repo)
    DynDb.Repo.insert_or_update(changeset, opts)
  end

  def insert_or_update!(repo, changeset, opts \\ []) do
    DynDb.Repo.put_dynamic_repo(repo)
    DynDb.Repo.insert_or_update!(changeset, opts)
  end

  def update(repo, changeset, opts \\ []) do
    DynDb.Repo.put_dynamic_repo(repo)
    DynDb.Repo.update(changeset, opts)
  end

  def update!(repo, changeset, opts \\ []) do
    DynDb.Repo.put_dynamic_repo(repo)
    DynDb.Repo.update!(changeset, opts)
  end

end
