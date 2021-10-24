defmodule Pranxhow do
  @moduledoc """
  Documentation for `Pranxhow`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Pranxhow.hello()
      :world

  """
  def hello do
    :world
  end

  def downloadPrank(id) do
    path = "pranks/#{id}.mp3"
    url = "https://compressed-pranks.fra1.digitaloceanspaces.com/#{id}.mp3?AWSAccessKeyId=#{Application.fetch_env!(:pranxhow, :aws_access_key_id)}" <> 
      "&Expires=#{Application.fetch_env!(:pranxhow, :expires)}&Signature=#{Application.fetch_env!(:pranxhow, :signature)}"
    IO.puts("Downloading from #{url} to #{path}...")

    File.mkdir_p!(Path.dirname(path))

    %HTTPoison.Response{body: body} = HTTPoison.get!(url)
    File.write(path, body)

    IO.puts("Finished downloading")
    # IO.puts(Application.fetch_env!(:pranxhow, :key1))
  end
end
