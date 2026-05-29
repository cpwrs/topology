function fish_prompt
    set -l last_status $status
    set -l parts

    if contains -- --final-rendering $argv
        set -a parts (set_color --bold)(path basename $PWD)(set_color --reset)
    else
        if test $last_status -ne 0
            set -a parts (set_color red)$last_status(set_color --reset)
        end

        set -a parts (set_color --bold)(prompt_pwd --dir-length=0)(set_color --reset)

        set -l git (fish_git_prompt '%s')

        if test -n "$git"
          set -l git_part (set_color green)'('$git')'(set_color --reset)
          set -a parts $git_part
        end

        if set -q IN_NIX_SHELL
          set -l nix_part (set_color blue)'('nix')'(set_color --reset)
          set -a parts $nix_part
        end
    end

    set -a parts (set_color yellow)"> "(set_color --reset)

    string join ' ' $parts
end
