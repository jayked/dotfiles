# Jayked dotfiles
For quick configuration of preferences I put the configuration in these dotfiles to sync them over all my environments.

## Configuration
Clone the repository in some location (preferrable your use root `~`):
```
git clone https://github.com/jayked/dotfiles.git .dotfiles
```

Add the following line to your `.bashrc`:
```
source ~/.dotfiles/bootstrap
```
this will refer to the `bootstrap` file in the cloned repository, so when you didn't clone the repo in `~` you will have to point it to the correct location.

