pw() {
    set -o pipefail

    local -hr path="$1"

    ph show --field=password "$path" | pbcopy

    if [ $? -eq 0 ]; then
        echo "Password copied to clipboard"
    fi
}
