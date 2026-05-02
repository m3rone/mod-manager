# mod-manager

Makefile that lets you manage mods with git. Put it in your mods folder and all that

`make init`: initializes the repo, run this first for every new mods directory

`make save`: manually save the state (commit)

`make back`: peek back one state, while keeping the history

`make current`: go back to the last known state (revert from peeking)

`make forceback`: permanently roll back to the peeking state

`make states`: lists all the states

`make safemode`: disables all your mods (saves the state)

`make revertsafemode`: restores all your mods (saves the state)

`make tar`: creates a tar archive of your mods

`make zip`: creates a zip of your mods

`make untrack`: deletes the git repo

`make reinit`: deletes and reinitializes the repo (no need to untrack manually first)

---

Download the Makefile via [releases](https://github.com/m3rone/mod-manager/releases) or just [get the raw file](https://raw.githubusercontent.com/m3rone/mod-manager/refs/heads/main/Makefile)
