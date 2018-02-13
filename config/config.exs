# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :yojee_chat_example,
  ecto_repos: [YojeeChatExample.Repo]

# Configures the endpoint
config :yojee_chat_example, YojeeChatExampleWeb.Endpoint,
	http: [port: {:system, "PORT"}],
  url: [host: "localhost"],
  secret_key_base: "YfWm0HzzwsiEUgV7hgNNV09y6tficxKchsn200tLPPECtFmggvGGFBR3ICAUDqwb",
  render_errors: [view: YojeeChatExampleWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: YojeeChatExample.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :libcluster,
  topologies: [
    ycluster: [
      # The selected clustering strategy. Required.
      strategy: Cluster.Strategy.Epmd,
      # Configuration for the provided strategy. Optional.
      config: [hosts: [:"a@127.0.0.1", :"b@127.0.0.1", :"c@127.0.0.1"]],
      # The function to use for connecting nodes. The node
      # name will be appended to the argument list. Optional
      connect: {:net_kernel, :connect, []},
      # The function to use for disconnecting nodes. The node
      # name will be appended to the argument list. Optional
      disconnect: {:net_kernel, :disconnect, []},
      # The function to use for listing nodes.
      # This function must return a list of node names. Optional
      list_nodes: {:erlang, :nodes, [:connected]},
      # A list of options for the supervisor child spec
      # of the selected strategy. Optional
      child_spec: [restart: :transient]
    ]
  ]
