use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :slideworks, Slideworks.Endpoint,
  secret_key_base: "ehpx7HLjMSvufCEI6luQ1/Hnh5J9EWigbC10O4w+CUM5Y+uxipN3C9nyY8Bx9dAv"

# Configure your database
config :slideworks, Slideworks.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "slideworks_prod",
  size: 20 # The amount of database connections in the pool
