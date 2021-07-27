#!/bin/sh

set -e

cd test
echo "Running tests"
echo
echo "Test # 1: JSON to Binary conversion (test.proto)"
proto-convert -m j2b -p test.proto -t test.Message -i test.json -o test-out.bin -d
diff test.bin test-out.bin && rm test-out.bin
echo
echo "Test # 2: Binary to JSON conversion (test.proto)"
proto-convert -m b2j -p test.proto -t test.Message -i test.bin -o test-out.json -d
cat test-out.json | jq .
diff test.json test-out.json && rm test-out.json
echo
echo "Test # 3: JSON to Binary conversion (log.proto)"
proto-convert -m j2b -p log.proto -t service.logging.Log -i log.json -o log-out.bin -d
diff log.bin log-out.bin && rm log-out.bin
echo
echo "Test # 4: Binary to JSON conversion (log.proto)"
proto-convert -m b2j -p log.proto -t service.logging.Log -i log.bin -o log-out.json -d
cat log-out.json | jq .
diff log.json log-out.json && rm log-out.json
echo
echo "--- [DONE] ---"
