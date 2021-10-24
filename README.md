# Pranxhow

An experimental tool for fetching fresh pranks from volnov's website.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `pranxhow` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:pranxhow, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/pranxhow](https://hexdocs.pm/pranxhow).

## Usage

The tool may be used for downloading pranks as mp3 files as follows:

```sh
iex(1)> Pranxhow.downloadPrank(12537)
Downloading from https://compressed-pranks.fra1.digitaloceanspaces.com/12537.mp3?AWSAccessKeyId=foo&Expires=bar&Signature=baz to pranks/12537.mp3...                          
Finished downloading
:ok
iex(2)>
```

