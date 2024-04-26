# General rules

 * Lakka focuses on stability rather than bleeding edge
 * We try to maintain all the supported platforms, but we know that 95% of our users are using PC and RPi
 * You are responsible for your own changes, if you break something, you need to fix it
 * Everybody has to test their own changes
 * Testing means manual testing on real hardware
 * If you are unsure how to contribute code, meet us on IRC (#lakkatv on Libera Chat) or Discord (libretro server)
 * Our users want the latest working versions of RetroArch and the libretro cores. They don't want non working / half working versions.

# Team members

Project leader: natinusala

Team members: kivutar, Ntemis, gouchi, ToKe79, RobLoach, natinusala, plaidman

# The development branch

Development happens on the branch `devel`. This branch follows LibreELEC.tv `master`.

We consider this branch as a rolling release, and we ensure that:

 * All the projects build fine at least on Ubuntu LTS
 * All the projects boot
 * All the projects boot to RetroArch

We don't have a stable branch + unstable branches. We follow LibreELEC.tv release branches, for each major LibreELEC.tv version a separate branch for Lakka is created, for example `Lakka-v4.x˛` (based on LibreELEC.tv `libreelec-10.0` branch), `Lakka-v5.x` (based on LibreELEC.tv `libreelec-11.0`), etc. All branches should be as stable as possible.
 
# Pull requests

All the code contributions are submitted in the form of Pull Requests. Team members should also use Pull Requests except in case of emergency.

A good PR is:

 * Atomic, changes as less things as possible
 * Well named
 * Well described
 * Tested locally by the sender (on real hardware)
 * Doesn't break other projects (you have to build all of them locally)
 * Idealy doesn't contain merge messages (you can pull --rebase if necessary)
 * Doesn't mix important changes with massive reindentation (send two separate PRs)
 * Doesn't introduce too much changes that would make merging upstream difficult

PRs will be reviewed by the core team. The project leader have the final word on merging a PR or not, but all the core team members are invited to do code reviews.

PRs should be merged using the *Squash and merge* button only.

If a PR is not in a mergeable state, mark the title with [WIP] or open it as a draft.

Commit messages should be formatted like the [LibreELEC](https://github.com/LibreELEC/LibreELEC.tv)'s upstream, in the following format:
```
package-name: update something on the package
```

# Merging upstream

The corresponding upstream branch will be merged on a regular basis by the maintainers. Merging upstream should be discussed and announced on IRC/Discord in presence of the project leader.

It should be done once every release cycle, at the beginning of the cycle.

# RetroArch and libretro cores updates

Updating RetroArch requires a lot of manual testing. So leave this task to the core team.

# Release cycle

We try to release images to the public following the releases of RetroArch.

Before every release or release candidate, we have a one week code freeze that is announced on IRC or Discord by the team leader.

During the code freeze:

 * Everybody tests the images on real hardware
 * We merge only critical fixes
 * We don't merge upstream
 * We don't update RetroArch or cores for no reasons
 * If we update RetroArch or a core, it better be done by adding a build time patch than updating the commit ID

# Good practices guide

All pull requests should be aimed to the `devel` branch and backported by the team to the current release branch.

After you fork and clone to your local development environment, fetch and switch to branch `devel` and add the upstream repository:

```
git fetch origin devel:devel
git checkout devel
git remote add upstream https://github.com/libretro/Lakka-LibreELEC
git fetch upstream
git branch devel --set-upstream-to=upstream/devel
```

To update your local branch from upstream (do this every time before you create a new branch which you mean to PR):
```
git checkout devel
git pull
git push origin devel
```

Do not commit anything into `devel` branch but create branches for each PR, otherwise you will have merge commits when updating from upstream:
```
git checkout devel
git pull
git checkout -b <name_of_branch>
```

To rebase your branch (you might need to resovle some conflicts - do this only when your PR has conflicts with the base):
```
git checkout devel
git pull
git checkout <name_of_branch>
git rebase devel
```

If you are asked to make changes to your pull request, do them in your branch and push the changes to your fork. The pull request will be then updated with your changes.

## Add LibreELEC repository

To merge commits from the base, LibreELEC.tv repository has to be added:
```
git remote add libreelec https://github.com/LibreELEC/LibreELEC.tv
```

`devel` is based on the LibreELEC.tv `master` branch, so fetch it and set the upstream:
```
git fetch libreelec master:le-master
git branch le-master --set-upstream-to=libreelec/master
```

To update the base branch later:
```
git checkout le-master
git pull
```

List of new commits in base branch:
```
git log devel..le-master
```

If you want to merge up to a specific commit hash or tag:
```
git checkout -b le-update <commit|tag>
```

Create a new branch for the merge and merge LibreELEC branch into it:
```
git checkout -b devel-update devel
git merge le-update
```

Now resolve any conflicts by fixing them, adding fixed files (`git add path/to/fixed/file`) and continuing with the merge (`git merge --continue`) until all commits are merged.

Push the changes to your remote repository (and open pull request on GitHub):
```
git push origin devel-update
```

For a Lakka release branch instead of `devel` use for example˛`Lakka-v5.x` and instead of LibreELEC.tv `master` use corresponding branch Lakka follows, for example `libreelec-11.0` and follow the same steps:
```
git fetch libreelec libreelec-11.0:le-11
git branch le-11 --set-upstream-to=libreelec/libreelec-11.0
git log Lakka-v5.x..le-11
git checkout -b Lakka-v5.x-update Lakka-v5.x
git merge le-11
git push origin Lakka-v5.x-update
```

