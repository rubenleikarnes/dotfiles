function z --wraps zed --description 'alias z=zed'
  if test -n "$argv"
    zed $argv
  else
    zed .
  end
end
