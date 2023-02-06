md() {
    local -hr path="$1"

    mkdir -p "$path" && cd "$_"
}

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

cv() {
    local -r file_path="$1"

    local -r full_filename="$(basename "$file_path")"
    local -r extension="${full_filename##*.}"
    local -r filename="${full_filename%.*}"

    ffmpeg -i "$file_path" -vcodec libx265 -acodec copy -crf 28 -vtag hvc1 -preset fast "${filename}_compressed.$extension"
}

# punch in
pi() {
    local -r time="$1"

    local -a options=(
        --round=5m
    )

    if [ -n "$time" ]; then
        options+=(--time "$time")
    fi

    klog start "${options[@]}"
}

# punch out
po() {
    local -r time="$1"

    local -a options=(
        --round=5m
    )

    if [ -n "$time" ]; then
        options+=(--time "$time")
    fi

    klog stop "${options[@]}"
}
