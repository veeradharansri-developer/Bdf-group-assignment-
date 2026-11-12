#!/bin/bash
# Part 5: the 3 twist tests (server must be running on port 3000)
B=http://localhost:3000
echo "--- Test 1: Delete Court 2 (expect 200)"
curl -s -o /dev/null -w "DELETE /courts/2 -> %{http_code}\n" -X DELETE $B/courts/2
echo "--- Test 2: Get Court 2 (expect 404)"
curl -s -w "\nGET /courts/2 -> %{http_code}\n" $B/courts/2
echo "--- Test 3: Restore it, then get it (expect 200, 200)"
curl -s -o /dev/null -w "POST /courts/2/restore -> %{http_code}\n" -X POST $B/courts/2/restore
curl -s -w "\nGET /courts/2 -> %{http_code}\n" $B/courts/2
