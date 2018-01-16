defmodule Pinger.Ping do
  use Ecto.Schema

  schema "pings" do
    field :url, :string
  end
end
