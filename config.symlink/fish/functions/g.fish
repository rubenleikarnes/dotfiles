function g --wraps=git --description 'alias g=git'
  if test -n "$argv"
    git $argv
  else
   git status -s
  end
end
