# Vansteki's dotfiles
---

My dotfiles and automation for deadbeats.🍤

# Requirements

1. Node.js & npm

# Usage
 
1. Put or copy all your dotfiles into `dotfiles/macos/` folder.

2. Install this helper tool.
    ```
    npm i
    ```

3. Every time when you modified any dotfiles in your user home folder, just use `dotfiles save` command to update your dotfiles to remote repository. 
   By default, `dotfiles` will execute in `dry-run mode`, you can check result before updating dotfiles.
    
    default dry-run mode 
    ```
    dotfiles
    ``` 
    
    push to remote repository
    ```
    dotfiles push
    ```
   
    push to all remote repositories
    ```
    dotfiles push --all
    ```

# Add new dotfiles

Add new dotfiles in user home folder and this repo's dotfiles folder. Then `dotfile push`.

```
touch ~/.testfile ./dotfiles/macos/.testfile
dotfiles push
```
