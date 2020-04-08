#!/bin/bash
# Bash script that sends a JSON POST request to a URL passed as the first argument, and displays the body of the response.
curl -s -X "$1" -H "Content-Type: application/json" -d @my_json_0
