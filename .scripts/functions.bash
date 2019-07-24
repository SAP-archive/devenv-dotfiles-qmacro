#!/bin/bash

templatedir=${LP}/project-templates

# np - new project (from template)
# Sets up a new project dir from a tar / gzipped project template
function np() {

	# Find all dirs in template dir and offer choice via fzf
	template=$( \
		find ${templatedir} -depth 1 -type d -exec basename {} \; | \
	    fzf --height=5 \
	)

	# Abort if no template selected
	if [ -z "${template}" ]; then
		echo "No template selected. Aborting."
		return 1
	fi

	# Accept name of target dir as first parameter, defaulting
	# to name of template if not supplied.
	target=${1:-$template}

	# Abort if target dir exists
	if [ -d "${target}" ]; then
		echo "Target dir '${target}' already exists. Aborting."
		return 1
	fi

	echo "Creating new project in '${target}' based on '${template}' template ..."

	mkdir ${target}

	# Unpack the template into the target dir (-C), removing the
	# top-level dir in the template archive.
	tar xzf ${templatedir}/${template}.tgz -C ${target} --strip-components=1

	cd ${target}

	ls

}

hsod_episode_topic_file=$HOME/Streaming/episodetopic.txt
hsod_episode_root_dir=$LP/livestream

# cdep - change dir to the current HandsOnSAPDev episode directory. If it doesn't
# already exist, create it too.
function cdep() {
	hsod_episode_current=$(
		head -1 ${hsod_episode_topic_file} | \
		cut -d ' ' -f 1 | \
		tr '[:upper:]' '[:lower:]' \
	)
	hsod_episode_dir="${hsod_episode_root_dir}/${hsod_episode_current}"
	if [ ! -d "${hsod_episode_dir}" ]; then
		mkdir "${hsod_episode_dir}"
	fi

	cd ${hsod_episode_dir}
}
