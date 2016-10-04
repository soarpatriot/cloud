# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :cloud,
  ecto_repos: [Cloud.Repo]

# Configures the endpoint
config :cloud, Cloud.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5KmsWNmpL8RSzuI33/H3vPV5Gl7OVBSuj1tNTGBFO6g2zT+Lp2HJU7KoyNiF9daB",
  render_errors: [view: Cloud.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Cloud.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

#config :addict,
#  secret_key: "243262243132244a61316b4d6d2e66624e69385946624d6c637344354f",
#  extra_validation: fn ({valid, errors}, user_params) -> {valid, errors} end, # define extra validation here
#  user_schema: Cloud.User,
#  repo: Cloud.Repo,
#  from_email: "no-reply@example.com", # CHANGE THIS
#  mailgun_domain: "",
#  mailgun_key: "",
#  mail_service: :mailgun
#
#config :passport,
#  resource: "User",
#  repo: "#{binding[:base]}.Repo"
