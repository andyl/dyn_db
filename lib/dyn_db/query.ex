defmodule DynDB.Query do

  def all(repo, queryable, opts \\ []) do
    DynDB.Repo.put_dynamic_repo(repo)
    DynDB.Repo.all(queryable, opts)
  end

  def delete_all(repo, queryable, opts \\ []) do
    DynDB.Repo.put_dynamic_repo(repo)
    DynDB.Repo.delete_all(queryable, opts)
  end

  def exists?(repo, queryable, opts \\ []) do
    DynDB.Repo.put_dynamic_repo(repo)
    DynDB.Repo.exists?(queryable, opts)
  end

  def get(repo, queryable, id, opts \\ []) do
    DynDB.Repo.put_dynamic_repo(repo)
    DynDB.Repo.get(queryable, id, opts)
  end

  def get!(repo, queryable, id, opts \\ []) do
    DynDB.Repo.put_dynamic_repo(repo)
    DynDB.Repo.get!(queryable, id, opts)
  end

  def get_by(repo, queryable, clauses, opts \\ []) do
    DynDB.Repo.put_dynamic_repo(repo)
    DynDB.Repo.get_by(queryable, clauses, opts)
  end

  def get_by!(repo, queryable, clauses, opts \\ []) do
    DynDB.Repo.put_dynamic_repo(repo)
    DynDB.Repo.get_by(queryable, clauses, opts)
  end

  def one(repo, queryable, opts \\ []) do
    DynDB.Repo.put_dynamic_repo(repo)
    DynDB.Repo.one(queryable, opts)
  end

  def one!(repo, queryable, opts \\ []) do
    DynDB.Repo.put_dynamic_repo(repo)
    DynDB.Repo.one!(queryable, opts)
  end

  def update_all(repo, queryable, clauses, opts \\ []) do
    DynDB.Repo.put_dynamic_repo(repo)
    DynDB.Repo.update_all(queryable, clauses, opts)
  end

end
