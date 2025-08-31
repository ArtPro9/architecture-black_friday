#!/bin/bash

echo "Document counts on shard 1 primary"
docker compose exec -T shard1-primary mongosh --port 27018 --quiet <<EOF
use somedb
db.helloDoc.countDocuments()
EOF

echo "Document counts on shard 1 secondary 1"
docker compose exec -T shard1-secondary-1 mongosh --port 27018 --quiet <<EOF
use somedb
db.helloDoc.countDocuments()
EOF

echo "Document counts on shard 1 secondary 2"
docker compose exec -T shard1-secondary-2 mongosh --port 27018 --quiet <<EOF
use somedb
db.helloDoc.countDocuments()
EOF

echo "Document counts on shard 2 primary"
docker compose exec -T shard2-primary mongosh --port 27019 --quiet <<EOF
use somedb
db.helloDoc.countDocuments()
EOF

echo "Document counts on shard 2 secondary 1"
docker compose exec -T shard2-secondary-1 mongosh --port 27019 --quiet <<EOF
use somedb
db.helloDoc.countDocuments()
EOF

echo "Document counts on shard 2 secondary 2"
docker compose exec -T shard2-secondary-2 mongosh --port 27019 --quiet <<EOF
use somedb
db.helloDoc.countDocuments()
EOF
