import requests
import json

response = requests.get("https://db.ygoprodeck.com/api/v7/cardinfo.php")
json_data = json.loads(response.text)["data"]
ids = []
for i in json_data:
    ids.append(i["id"])
f = open("ids.txt", "a")
f.write(str(ids))
f.close()