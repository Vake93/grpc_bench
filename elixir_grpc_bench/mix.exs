defmodule Helloworld.Mixfile do
  use Mix.Project

  def project do
    [
      app: :helloworld,
      version: "0.1.0",
      elixir: "~> 1.13",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: releases()
    ]
  end

  def application do
    [mod: {HelloworldApp, []}, applications: [:logger, :grpc]]
  end

  defp deps do
    [
      # {:grpc, github: "elixir-grpc/grpc"},
      {:grpc, github: "eigr/grpc"},
      {:protobuf, "~> 0.9.0", override: true},
      {:cowlib, "~> 2.11", override: true},
      {:dialyxir, "~> 0.5", only: [:dev, :test], runtime: false}
    ]
  end

  defp releases() do
    [
      helloworld: [
        include_executables_for: [:unix],
        applications: [runtime_tools: :permanent]
      ]
    ]
  end
end
