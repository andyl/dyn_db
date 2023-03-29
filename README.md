# DynDB

Dynamic Sqlite databases for Elixir.  

## Overview

It's easy to manage dynamic key/value datastores using [:dets][1] or [CubDB][2] .

[1]: https://www.erlang.org/doc/man/dets.html 
[2]: https://github.com/lucaong/cubdb

DynDB intends to make it easy to manage dynamic SqLite datastores.  

## About

Use DynDB to manage one or more segregated / isolated databases. This may be
useful in situations with:
- privacy concerns - medical or financial data 
- regulatory issues - GDPR etc.
- portability requirements - allowing users to download data and run locally 

Key features:
- Dynamic creation and use of Sqlite data stores 
- Ecto Migrations and Query operations
- Encrypted data stores (future) 
- Offline data sync (future) 

## Installation

```elixir
def deps do
  [
    {:dyn_db, github: "andyl/dyn_db"}
  ]
end
```

## Usage

```elixir 
#!/usr/bin/env elixir 

Mix.install([
  {:dyn_db, github: "andyl/dyn_db"}
])

# Write a Migration 
defmodule Migration0 do
  use Ecto.Migration

  def change do
    create table("chats") do
      add(:message, :string)
      timestamps(type: :utc_datetime_usec)
    end
  end
end

# Write a Schema 
defmodule Chat do
  use Ecto.Schema

  schema "chats" do
    field(:message, :string)
    timestamps(type: :utc_datetime_usec)
  end
end

# Interact with the DynDB
defmodule Main do 
  def main do 
    # The database file will be auto-created
    {:ok, db1} = DynDB.start_link(database: "./data1.db")

    # Migrate 
    DynDB.migrate(db1, Migration0) 

    # Query  
    DynDB.insert!(db1, %Chat{message: "HELLO at #{Time.utc_now()} UTC"})
    DynDB.all(db1, Chat) |> IO.inspect()
  end 
end 

Main.main()
```

Run the script, then query the database from the command line!

```bash
> sqlite3 -batch data1.db "select * from chats;"
```

## References 

DynDB is experimental.  Basic functions and best practices are not yet known.

Here are some references to learn about dynamic repos and comparable software.

| Source       | Title                                                |
|--------------|------------------------------------------------------|
| Elixir Forum | [Separate Sqlite Database per Customer?][ef1]        |
| HexDocs      | [Ecto Migrator][hd1]                                 |
| HexDocs      | [Ecto Dynamic Repos][hd2]                            |
| Underjord    | [ECTO & MULTI-TENANCY - DYNAMIC REPOS - PART 1][uj1] |
| Underjord    | [ECTO & MULTI-TENANCY - DYNAMIC REPOS - PART 2][uj2] |
| GitHub       | [CubDB][gh1]                                         |
| GitHub       | [alexkoutmos/litestream][gh2]                        |
| Twitter      | [Alex Koutmos Experiment][tw1]                       |


[uj1]: https://underjord.io/ecto-multi-tenancy-dynamic-repos-part-1-getting-started.html
[uj2]: https://underjord.io/ecto-multi-tenancy-dynamic-repos-part-2.html
[ef1]: https://elixirforum.com/t/separate-sqlite-database-per-customer/54821
[hd1]: https://hexdocs.pm/ecto_sql/Ecto.Migrator.html
[hd2]: https://hexdocs.pm/ecto/replicas-and-dynamic-repositories.html#dynamic-repositories
[gh1]: https://github.com/lucaong/cubdb
[gh2]: https://github.com/akoutmos/litestream
[tw1]: https://twitter.com/akoutmos/status/1495830005267542027

## Roadmap 

- [x] Basic operation 
- [ ] Module Docs 
- [ ] Unit tests 
- [ ] Litestream sync
- [ ] Encrypted databases 
- [ ] Capacity tests to understand scalability limits
- [ ] Usage guides (Migrations, Sync, Encryption, Scalability, ...) 
