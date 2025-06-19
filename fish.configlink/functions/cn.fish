function cn --argument-names 'folder'
  if test -n "$folder"
    cd ~/code/nep-gpe/$folder
  else
    cd ~/code/nep-gpe/
  end
end

function __cn_complete
    set arg (commandline -ct)
    set saved_pwd $PWD

    builtin cd ~/code/nep-gpe
    and complete -C "cd $arg"

    builtin cd $saved_pwd
end

complete --command cn --arguments '(__cn_complete)'
