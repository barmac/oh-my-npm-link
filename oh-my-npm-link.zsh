#compdef

function autocomplete() {
    local curcontext="$curcontext" state line  ret=1

    local -a _1st_arguments
    _1st_arguments=(
    'link:Link dependency'
    )

    _arguments -C \
    '1: :->cmds' \
    '*: :->args' && ret=0

    __deps() {
    cat ./package.json &> /dev/null | jq -r ".dependencies | keys[]" 2> /dev/null
    }

    case $state in
    cmds)
        compadd 'link' && ret=0
        ;;

    args)
        case $words[2] in
        (link)

            compadd $(__deps) && ret=0
            ;;
        *)
            ret=0
            # (( ret )) && _message 'no more arguments'
            ;;

        esac
        ;;
    esac

    return ret
}

compdef autocomplete npm
compdef autocomplete yarn
