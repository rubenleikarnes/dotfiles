# https://stackoverflow.com/questions/223678/which-commit-has-this-blob
#!/bin/sh
obj_name="$1"
shift
git log "$@" --pretty=tformat:'%T %h %s' \
| while read tree commit subject ; do
    if git ls-tree -r $tree | grep -q "$obj_name" ; then
        echo $commit "$subject"
    fi
done

