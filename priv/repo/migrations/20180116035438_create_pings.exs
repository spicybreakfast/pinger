defmodule Pinger.Repo.Migrations.CreatePings do
  use Ecto.Migration

  def change do
    create table(:pings) do
      add :url, :string
    end
  end
end
