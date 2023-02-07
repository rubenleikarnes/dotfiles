function o --wraps=open --description 'alias o=open'
  if test -n "$argv"
    open $argv
  else
   open .
  end
end
