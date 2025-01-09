if status is-interactive
    # Commands to run in interactive sessions can go here
end


function fif
    set -x RG_PREFIX rga --files-with-matches
    set -l file
    set -f unescaped_exp_token (string unescape -- $expanded_token)
    set --prepend fzf_arguments --prompt="Directory> " --query="$unescaped_exp_token" --preview='_fzf_preview_file {}'
    set file (
        FZF_DEFAULT_COMMAND="$RG_PREFIX '$argv'" \
            fzf --sort --preview="[ ! -z {} ] && rga --pretty --context 5 {q} {}" \
                --phony -q "$argv" \
                --bind "change:reload:$RG_PREFIX {q}" \
                --preview-window="70%:wrap"
    ) &&
    lv "$file"
end
bind ctrl-alt-e 'fif'
test -f ~/.kubectl_aliases.fish && source \
     (cat ~/.kubectl_aliases.fish | sed -r 's/(kubectl.*) --watch/watch \1/g' | psub)



function my-clear
    for i in (seq 3 (tput lines))
        echo ""
    end
    clear
end

bind \cl 'my-clear'
