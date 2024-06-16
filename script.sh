#! /bin/bash

function show_commands() {
	echo "Available commands: "$1""
	printf '\r\n'
	printf '    '
	printf '%s\n    ' "${commands[@]}"
	printf '\r\n'
}

function start() {
    docker-compose up --build -d
}

function logs() {
    docker-compose logs -f
}

commands=(start logs)

if [[ $# -gt 0 ]] && [[ "${commands[@]}" =~ "$1" ]]; then
	$@;
else
	show_commands "$commands"
fi
