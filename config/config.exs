# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :pinger, Pinger.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "pinger_repo",
  username: "pinger"
  #password: "pass",
  #hostname: "localhost"

config :pinger, ecto_repos: [Pinger.Repo]


# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for
# 3rd-party users, it should be done in your "mix.exs" file.

# You can configure your application as:
#
#     config :pinger, key: :value
#
# and access this configuration in your application as:
#
#     Application.get_env(:pinger, :key)
#

config :logger, backends: [{LoggerFileBackend, :info}]

config :logger,
       :info,
       path: "logs/ping.log",
       level: :info,
       format: "\n$date $time $metadata[$level] $levelpad$message"

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
#     import_config "#{Mix.env}.exs"
