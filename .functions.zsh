pw() {
    set -o pipefail

    local -hr path="$1"

    local password
    password="$(ph show --field=password "$path")"
    local -r exit_code=$?
    readonly password

    if [ $exit_code -eq 0 ]; then
        echo -n "$password" | pbcopy
        echo "Password copied to clipboard"
    fi
}
