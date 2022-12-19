#!/usr/bin/python3
import json
import os
from urllib.request import Request, urlopen

with open("/root/.luotianyi-powerdns.cred.json", 'r') as f:
    config = json.loads(f.read())
    config["apiurl"] = config.get("apiurl", "http://127.0.0.1/api/v1/servers/localhost/zones")
    config["target"] = config.get("target", "/etc/bind/domains.conf")
    print("apikey:", "*" * len(config["apikey"]))
    print("apiurl:", config["apiurl"])
    print("target:", config["target"])

request = Request(config["apiurl"])
request.add_header("X-API-Key", config["apikey"])
response = json.loads(urlopen(request).read())
domains = [entry["name"][:-1] for entry in response]
max_length = max([len(d) for d in domains])

with open(config["target"], "w+") as f:
    for domain in domains:
        print("\tDomain:", domain)
        qd = f'"{domain}"'        # quoted domain
        qz = f'"{domain}.zone";'  # quoted zone
        dl = max_length + 4       # max length of domain
        zl = max_length + 8       # max length of zone
        output = "zone  " + f"{qd:<{dl}}" + "  { file  " + f"{qz:<{zl}}" + "  " + 'include "/etc/bind/secondary.conf"; };\n'
        f.write(output)

print("Finished.")
os.system("rm -rvf /var/cache/bind/*")
os.system("systemctl restart named")
os.system("systemctl status  named")
