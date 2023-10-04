#!/usr/bin/env fish

set ALIASES_DIR $HOME/.config/shell-aliases
if set -q XDG_CONFIG_HOME
    set ALIASES_DIR $XDG_CONFIG_HOME/shell-aliases
end

if test -d $ALIASES_DIR
    for FILE in $ALIASES_DIR/*
        if test -f $FILE -a -r $FILE
            source $FILE
        end
    end
end

