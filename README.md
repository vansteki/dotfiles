# dotfiles

my env files

# Requirements

1. Node.js & npm

# Usage
 
1. put or copy all your dotfiles into `dotfiles/macos/` folder.

2. install this helper tool.
    ```
    npm run setup
    ```

3. Every time when you modified any dotfiles in your user home folder, just use `dotfiles` command to update your dotfiles to remote repository. 
   By default, `dotfiles` will execute in dry-run mode, you can check result before updating dotfiles.
    ``` 
    dotfiles # just dry-run
   
    dotfiles save # update to remote repository
    ``` 
