function cn --argument-names 'folder'
  if test -n "$folder"
    cd ~/code/nep-gpe/$folder
  else
    cd ~/code/nep-gpe/
  end
end
