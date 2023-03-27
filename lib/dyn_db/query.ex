defmodule DynDb.Query do

  def all(repo, queryable, opts \\ []) do
    DynDb.Repo.put_dynamic_repo(repo)
    DynDb.Repo.all(queryable, opts)
  end

  def delete_all(repo, queryable, opts \\ []) do
    DynDb.Repo.put_dynamic_repo(repo)
    DynDb.Repo.delete_all(queryable, opts)
  end

  def exists?(repo, queryable, opts \\ []) do
    DynDb.Repo.put_dynamic_repo(repo)
    DynDb.Repo.exists?(queryable, opts)
  end

  def get(repo, queryable, id, opts \\ []) do
    DynDb.Repo.put_dynamic_repo(repo)
    DynDb.Repo.get(queryable, id, opts)
  end

  def get!(repo, queryable, id, opts \\ []) do
    DynDb.Repo.put_dynamic_repo(repo)
    DynDb.Repo.get!(queryable, id, opts)
  end

  def get_by(repo, queryable, clauses, opts \\ []) do
    DynDb.Repo.put_dynamic_repo(repo)
    DynDb.Repo.get_by(queryable, clauses, opts)
  end

  def get_by!(repo, queryable, clauses, opts \\ []) do
    DynDb.Repo.put_dynamic_repo(repo)
    DynDb.Repo.get_by(queryable, clauses, opts)
  end

  def one(repo, queryable, opts \\ []) do
    DynDb.Repo.put_dynamic_repo(repo)
    DynDb.Repo.one(queryable, opts)
  end

  def one!(repo, queryable, opts \\ []) do
    DynDb.Repo.put_dynamic_repo(repo)
    DynDb.Repo.one!(queryable, opts)
  end

  def update_all(repo, queryable, clauses, opts \\ []) do
    DynDb.Repo.put_dynamic_repo(repo)
    DynDb.Repo.update_all(queryable, clauses, opts)
  end

end
