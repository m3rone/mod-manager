init:
	@git init -b main
	@mkdir .safemode
	@echo -e "mods.tar\nmods.zip" > .gitignore
	@git config advice.detachedHead false
	@git add .
	@git commit --allow-empty -m "initialized repo"

save:
	@git add .
	@echo "Give a description:"
	@read DESC; git commit -m "$$DESC"

back:
	@git checkout HEAD~1

current:
	@git checkout main

RESETHASH := $(shell git rev-parse HEAD)
export RESETHASH
forceback:
	@git checkout main && git reset --hard $$RESETHASH

states:
	@git log --oneline

safemode:
	@find . -maxdepth 1 -mindepth 1 ! -name ".git" ! -name ".safemode" ! -name "Makefile" -exec mv -t .safemode -- {} +
	@git add .
	@git commit -m "init safe mode"

revertsafemode:
	@mv .safemode/* .
	@git add .
	@git commit -m "reverted safe mode"

tar:
	@tar cf mods.tar --exclude "Makefile" --exclude ".git" --exclude ".gitignore" --exclude ".safemode" --exclude "mods.tar" .

zip:
	@zip -r -9 mods.zip . --exclude "Makefile" --exclude ".git" --exclude ".gitignore" --exclude ".safemode" --exclude "mods.zip"

untrack:
	@if [ -d .git ] && [ -f .gitignore ]; then\
		rm -rf .git .gitignore;\
	fi
	@if [ -d .safemode ] && [ "$(ls -A .safemode)" = "" ]; then\
		rmdir .safemode;\
	fi

reinit: untrack init
