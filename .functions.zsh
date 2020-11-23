streamshell() {
    local command
    local arguments
    local seashells_options=()

    if [[ "$*" == *"--"* ]]; then
        while [[ $1 != "--" ]] || [[ $# == 0 ]]; do
            seashells_options+=$1
            shift
        done

        if [[ $1 == "--" ]]; then
            shift
        fi
    fi

    command=$1
    shift

    $command "$@" 2>&1 | seashells $seashells_options
}

pw() {
    local -hr path="$1"

    ph show --field=password "$path" | pbcopy

    echo "Password copied to clipboard"
}
