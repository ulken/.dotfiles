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
    set -o pipefail

    local -hr path="$1"

    ph show --field=password "$path" | pbcopy

    if [ $? -eq 0 ]; then
        echo "Password copied to clipboard"
    fi
}
