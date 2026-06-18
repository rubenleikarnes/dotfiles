# force tmux to use user path instead of login path
function tmux --wraps=tmux --description 'fix tmux fish path'
  if test -n "$argv"
    command tmux $argv
  else
    command tmux new-session fish
  end
end
