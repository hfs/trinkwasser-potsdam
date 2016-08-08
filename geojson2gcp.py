#!/usr/bin/env python3
import json
import sys

g = json.load(sys.stdin)
for feature in g["features"]:
    coords = feature["geometry"]["coordinates"]
    print("-gcp", coords[0][0], coords[0][1], coords[1][0], coords[1][1], end=" ")
