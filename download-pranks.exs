File.stream!("prank-ids.txt")
|> Stream.with_index
|> Stream.drop(19)
|> Stream.map(fn {line, _} -> splitted_string = String.split(line, "  "); Pranxhow.downloadPrank(hd(splitted_string), hd(List.delete_at(splitted_string, 0))) end)
# |> Stream.map(fn {line, i} -> IO.puts "#{i + 1} #{hd(String.split(line, "  ")); IO.puts("ok")}" end)
|> Stream.run

# words = string:tokens("foo bar", " ")
# IO.puts(words.at(0))

