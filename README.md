# Neorg Bookmark Manager
**This project is not complete, not even started, I'm only capturing some ideas for reference and to allow other people to give ideas**

This module for [Neorg](https://github.com/nvim-neorg/neorg) is to make your bookmarking life easier, the [Neorg](https://github.com/nvim-neorg/neorg) way.

## Features
**Still a work in progress, these are only planned features**

### Create bookmarks with tags
Bookmarks are simple [Neorg](https://github.com/nvim-neorg/neorg) links using contexts as tags.
```
#contexts tags, tags and more tags
{url}[linktext]
```

### Compile bookmarks 
Compile bookmarks into a bookmark.norg file for easy reference and search ability using telescope and other programs apart from neovim such as fzf or dmenu, I plan on writing a qutebrowser user script ;)
`:Neorg bookmark compile`

### Similar interface to Neorg gtd
To be consistent and probably so I can copy a bunch of code :p it will probably be similar in design to Neorg gtd `: Neorg bookmark capture|edit|views`


### Search bookmarks using telescope
Probably using the [Telescope](https://github.com/nvim-telescope/telescope.nvim) module find bookmarks both locally and using the compiled bookmark file, I want to be able to search by tags as well.
