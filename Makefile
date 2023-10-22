.DEFAULT_GOAL := help

.PHONY: remove-git-configs
remove-git-configs: ## Remove Git Configs
	echo "remove-git-configs"

.PHONY: add-git-configs
add-git-configs: remove-git-configs ## Add Git Configs
	git config --global advice.skippedCherryPicks false
	git config --global branch.autosetuprebase always
	git config --global color.branch true
	git config --global color.diff true
	git config --global color.interactive true
	git config --global color.status true
	git config --global color.ui true
	git config --global commit.gpgsign true
	git config --global core.autocrlf input
	git config --global core.editor 'code --wait'
	git config --global diff.tool code
	git config --global difftool.code.cmd 'code --diff $$LOCAL $$REMOTE --wait'
	git config --global gpg.program gpg
	git config --global before.defaultbranch main
	git config --global log.date relative
	git config --global merge.tool code
	git config --global mergetool.code.cmd 'code --wait $$MERGED'
	git config --global pull.default current
	git config --global pull.rebase true
	git config --global push.autoSetupRemote true
	git config --global push.default current
	git config --global rebase.autostash true
	git config --global rerere.enabled true
	git config --global stash.showpatch true
	git config --global tag.gpgsign true

.PHONY: remove-git-hooks
remove-git-hooks: ## Remove Git Hooks
	rm -fr $(GIT_HOOKS)

.PHONY: add-git-hooks
add-git-hooks: remove-git-hooks $(GIT_HOOKS) ## Add Git Hooks

.PHONY: remove-git
remove-git: remove-git-configs remove-git-hooks ## Remove Git Configs & Hooks

.PHONY: add-git
add-git: add-git-configs add-git-hooks ## Add Git Configs & Hooks

.PHONY: help
help: ## Help
	@grep --extended-regexp "^[a-zA-Z_-]+:.*?## .*$$" $(MAKEFILE_LIST) \
| sort \
| awk 'BEGIN { FS = ":.*?## " }; { printf "\033[36m%-33s\033[0m %s\n", $$1, $$2 }'