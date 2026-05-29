function sesh
  if test (count $argv) -ne 1
    echo "Usage: sesh PATH"
    return 1
  end

  if not test -d "$argv[1]"
    echo "Error: Directory '$argv[1]' does not exist"
    return 1
  end

  set -l real_path (realpath "$argv[1]")

  set -l session (
    tmux ls -F "#{session_name}|#{session_path}" 2>/dev/null |
    while read -l line
      set -l parts (string split "|" -- "$line")
      if test "$parts[2]" = "$real_path"
        echo "$parts[1]"
        break
      end
    end
  )

  if test -z "$session"
    set -l raw_name (path basename -- "$real_path")

    set -l base_name (
      string replace -ar '[^A-Za-z0-9_-]+' '-' -- "$raw_name" |
      string trim -c -
    )

    if test -z "$base_name"
      set base_name root
    end

    set session "$base_name"

    set -l counter 1
    while tmux has-session -t "=$session" 2>/dev/null
      set session "$base_name-$counter"
      set counter (math $counter + 1)
    end

    set -l editor_window (
      tmux new-session -d -s "$session" -c "$real_path" -P -F "#{window_id}"
    )
    tmux send-keys -t "$editor_window" nvim C-m

    tmux new-window -t "=$session" -c "$real_path"

    if command git -C "$real_path" rev-parse --is-inside-work-tree >/dev/null 2>&1
      set -l git_window (
        tmux new-window -t "=$session" -c "$real_path" -P -F "#{window_id}"
      )
      tmux send-keys -t "$git_window" lazygit C-m
    end

    tmux select-window -t "$editor_window"
  end

  if set -q TMUX
    tmux switch-client -t "=$session"
  else
    tmux attach-session -t "=$session"
  end
end
