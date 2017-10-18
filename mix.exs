defmodule Pinger.Mixfile do
  use Mix.Project

  def project do
    [
      app: :pinger,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :edeliver],
      mod: {Pinger, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      { :logger_file_backend, "~> 0.0.10" },
      {:edeliver, "~> 1.4.4"},
      {:distillery, ">= 0.8.0", warn_missing: false}
    ]
  end
end
