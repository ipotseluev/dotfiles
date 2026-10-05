# dotfiles

The repo stores personal configuration files. The [install.sh](install.sh) script links the files into place.

## Usage

```sh
./install.sh
```

Run `./install.sh -h` for options.

## Conventions

- **Do not use dot directories in the repo.** Use plain names, like `claude/` or `git/`. Do not use `.claude/` or `.git/` (the real `.git/` directory holds Git metadata, not dotfiles). `install.sh` links each directory to its dotted target in `$HOME`. For example, the script links `claude/` to `~/.claude`.
- **Put each tool in its own folder.** Store the files for one tool or app in one top-level directory. For example, `git/` holds `.gitignore`. Do not mix files from different tools in one folder.
- **Let install.sh find its own location.** The script resolves `DOTFILES_DIR` from its own path. Do not hardcode a path like `~/dotfiles`.
- **Keep install.sh brief.** The script must only link files and run minimal OS or container setup. Move heavier tasks, like package installs, to a separate script or file. For example, use a `Brewfile` for package installs.
