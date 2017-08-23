# My personal .emacs

This is now in a 'tangled' org file so that everything is in a collapsible list and easy to find.

## Separate .emacs file 

I have different requirements from the command line as a general purpose quicky editor vs a full blown dev environment on OSX.

The `.emacs` file does all the basic stuff like nice keyboard bindings then it call `.emacs.d/init.el` if it exists. This means it will load quickly in an enviroment where you just want to edit a single file quickly.

I `wget` it from [Github](https://raw.githubusercontent.com/ianjs/emacs/master/.emacs) into any machine I want to edit files on.

In the GUI environment I just link the `.emacs` file into the home directory so it starts up then loads whatever is in `.emacs.d/init.el`

# TODO: Faster load times

This might all become moot if I can get faster load times. It has already been reduced to <10 seconds with deferred package loads in `use-package`. If it is under 5s it can probably all be loaded everywhere.
