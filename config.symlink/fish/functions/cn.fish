function cn --argument-names 'folder'
  if test -n "$folder"
    cd ~/code/nep-no/$folder
  else
    cd ~/code/nep-no/
  end
end
