#!/bin/bash

ensure_dependencies() {
	local app_dir="$1"

	if [ ! -d "$app_dir/node_modules" ]; then
		echo "Installing dependencies in $app_dir..."
		(cd "$app_dir" && npm install) || exit 1
	fi
}

ensure_dependencies backend
ensure_dependencies frontend

echo "Starting backend..."
(cd backend && npm run dev) &

echo "Starting frontend..."
(cd frontend && npm run dev) &

wait
