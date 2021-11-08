import Config

config :pranxhow, # :auth, 
  session: [
    "foo",
    "bar",
    "baz",
    "qux"
  ],
  aws_access_key_id: "quux", 
  expires: "quuz",
  signature: "corge"

# import_config "#{Mix.env()}.exs"
