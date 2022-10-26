# GAP - Git Auto Push

## WORK IN PROGRESS

This tiny script allows you to define a list of git projects in `folders` array, that will be looped over to check if your working dir is "dirty".
If it is, it will commit all changes with "automatic commit" message and push to currently checked out branch.

### Why?

Because I lost some work by not pushing it before I finished work.

### Caution

This script will commit all modified and untracked files. There are no specific rules that would prevent any cases. So your repo might see "automatic commit" message.
Sometimes if your repo is left with the files you may not want to push, the script would so please:

- keep your `.gitignore` up to date,
- keep sensitive repositories out of the `folders` array.

### How to use

- Clone repository to some location `git clone https://github.com/caasi-dev/GAP.git`,
- Enter the directory `cd GAP`,
- Edit the `gap.sh` file to include your git repositories,
- Manually run the script `./gap.sh`

### Workflow?

I set a cron job to execute this script before I finish work. Runs every day! And when I see the "automatic commit" message in my repo, I know I should've pushed but didn't. Simple as that!

### Contributions

Thanks to [TechDufus](https://github.com/TechDufus) for providing symbol definitions!

### Issues/Ideas?

Since this project is WIP I am open to ideas and suggestions for future developments. Please file an issue.

### Planned features:

- Initial setup, so users don't have to manually edit the file: [#1](https://github.com/caasi-dev/GAP/issues/1),
- Action confirmation: [#2](https://github.com/caasi-dev/GAP/issues/2),
- End summary: [#3](https://github.com/caasi-dev/GAP/issues/3),
- ...
