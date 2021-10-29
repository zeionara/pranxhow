session_key_index = elem(Integer.parse(Enum.at(System.argv(), 0)), 0)
File.stream!("prank-ids.txt")
|> Stream.with_index
|> Stream.drop(Enum.count(Path.wildcard("pranks/*")))
|> Stream.map(fn {line, _} -> splitted_string = String.split(line, "  "); Pranxhow.downloadPrank(hd(splitted_string), hd(List.delete_at(splitted_string, 0)), session_key_index) end)
# |> Stream.map(fn {line, i} -> IO.puts "#{i + 1} #{hd(String.split(line, "  ")); IO.puts("ok")}" end)
|> Stream.run

# words = string:tokens("foo bar", " ")
# IO.puts(words.at(0))

