# Vansteki's dotfiles
---

My dotfiles and automation for lazy people

# Requirements

1. Node.js & npm

# Usage
 
1. Put or copy all your dotfiles into `dotfiles/macos/` folder.

2. Install this helper tool.
    ```
    npm run setup
    ```

3. Every time when you modified any dotfiles in your user home folder, just use `dotfiles save` command to update your dotfiles to remote repository. 
   By default, `dotfiles` will execute in dry-run mode, you can check result before updating dotfiles.
    ```
    # dry-run
    dotfiles 
    
    # update to remote repository
    dotfiles save
    ``` 
