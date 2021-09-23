#compdef

function autocomplete() {
    package=$(cat ./package.json 2> /dev/null)

    if [[ $package != '' ]]
    then
        deps=$(echo $package | jq -r '.dependencies | keys[]' 2> /dev/null)
        compadd -- ${=deps}
    fi
}

compdef autocomplete npm link
compdef autocomplete yarn link
