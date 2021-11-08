OUTPUT_PATH="pranks-list.txt"
MAX_PRANK_ID=100000 # 100
# for prank_id in $(cat complete-log.txt); do
for (( prank_id=1; prank_id<=$MAX_PRANK_ID; prank_id++ )); do
  prank_description=$(
  curl 'https://prank.show/api/prank?id='$prank_id'&order_by=id' \
    -H 'authority: api.prank.show' \
    -H 'accept: application/json, text/plain, */*' \
    -H 'authorization: hjoqNJ6yFtvAH2qI6z2z9PvBwxlXt24j' \
    -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36' \
    -H 'origin: https://prank.show' \
    -H 'sec-fetch-site: same-site' \
    -H 'sec-fetch-mode: cors' \
    -H 'sec-fetch-dest: empty' \
    -H 'referer: https://prank.show/' \
    -H 'accept-language: es-ES,es;q=0.9' \
    -s --compressed
  )
  
  status=$(echo $prank_description | cut -d '"' -f 4)
  # echo $status

  description=$(echo $prank_description | cut -d '"' -f 16)
  # echo $description

  # if [ "$status" == "ok" ]; then
  name=$(echo $prank_description | cut -d '"' -f 12)
  echo "$prank_id   $name   $description" # | tee $OUTPUT_PATH
  # fi
done

  # prank_file_name=$(python -c "import json, sys; response=json.loads(sys.argv[1]); print(response['prank']['name'])" "$prank_description")
  # prank_file_name="pranks/$prank_file_name.mp3"
  # echo $prank_file_name
  # curl 'https://cdn.prank.show/prank/'$prank_id'?session_token=hjoqNJ6yFtvAH2qI6z2z9PvBwxlXt24j' \
  #   -H 'Referer: https://prank.show/' \
  #   -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36' \
  #   -H 'Range: bytes=0-' \
  #   --compressed -o "$prank_file_name"
# done
