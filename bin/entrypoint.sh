#!/bin/bash
set -e

rails db:create
rails db:migrate
rails db:seed

exec "$@"