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

  defmodule PrankLink do
    defstruct status: "", data: ""
  end

  def downloadPrank(id, name) do
    IO.puts(id)
    url = "https://prank.show/api/pranks/getLink?id=#{id}" 
    IO.puts(url)
    headers = [authorization: Application.fetch_env!(:pranxhow, :session)]
    %HTTPoison.Response{body: body} = HTTPoison.get!(url, headers)
    link = Poison.decode!(body, as: !PrankLink)
    IO.puts(link["data"])


    path = "pranks/#{name}.mp3"
    %HTTPoison.Response{body: body} = HTTPoison.get!(link["data"], [], [recv_timeout: 3600_000])
    File.write(path, body)
    # 
    # IO.puts("Finished downloading prank #{id}")
    #
    #
    # IO.puts(id)
    # path = "pranks/#{id}.mp3"
    # url = "https://compressed-pranks.fra1.digitaloceanspaces.com/#{id}.mp3?AWSAccessKeyId=#{Application.fetch_env!(:pranxhow, :aws_access_key_id)}" <> 
    #   "&Expires=#{Application.fetch_env!(:pranxhow, :expires)}&Signature=#{Application.fetch_env!(:pranxhow, :signature)}"
    # IO.puts("Downloading from #{url} to #{path}...")

    # File.mkdir_p!(Path.dirname(path))

    # %HTTPoison.Response{body: body} = HTTPoison.get!(url)
    # File.write(path, body)

    # IO.puts("Finished downloading prank #{id}")
    # IO.puts(Application.fetch_env!(:pranxhow, :key1))
  end
end
