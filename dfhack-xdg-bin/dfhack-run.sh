#!/usr/bin/env bash

dfname="dwarffortress"
old_user_df_dir="$HOME/.$dfname"
if [[ -d "$old_user_df_dir" ]]; then
	user_df_dir="$old_user_df_dir"
else
	user_df_dir="${XDG_DATA_HOME:-$HOME/.local/share}/$dfname"
fi
user_config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/$dfname"
root_df_dir="/opt/$dfname"

if [[ ! -d "$user_config_dir" ]]; then
	mkdir -p "$user_config_dir"
	cp -r "$root_df_dir/data/init" "$user_config_dir/init"
fi

if [[ ! -d "$user_df_dir" ]]; then
	mkdir -p "$user_df_dir/data"
	ln -s "$root_df_dir/"{raw,libs} "$user_df_dir/"
	cp -r "$root_df_dir/data/"{announcement,dipscript,help,art,index,movies} "$user_df_dir/data/"
	ln -s "$user_config_dir/init" "$user_df_dir/data/"
	ln -s "$root_df_dir/data/"{initial_movies,shader.fs,shader.vs,sound,speech} "$user_df_dir/data/"
fi

if [[ ! -d "$user_df_dir/hack" ]]; then
	ln -s "$root_df_dir/"{hack,stonesense,dfhack,dfhack-run,dfhack.init-example,onload.init-example} \
		"$user_df_dir/"
	cp -r "$root_df_dir/dfhack-config" "$user_df_dir/"
	cp -n "$root_df_dir/dfhack.init-example" "$user_config_dir/dfhack.init"
	ln -s "$user_config_dir/dfhack.init" "$user_df_dir/"
fi

# workaround for bug in Debian/Ubuntu SDL patch
export SDL_DISABLE_LOCK_KEYS=1

cd "$user_df_dir" || exit 1
exec ./dfhack-run "$@"
