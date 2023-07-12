function s --wraps subl --description 'alias s=subl'
  if test -n "$argv"
    subl $argv
  else
    subl .
  end
end
