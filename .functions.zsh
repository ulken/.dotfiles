# make directory and navigate to it
md() {
    local -hr path="$1"

    mkdir -p "$path"
    cd "$_"
}

# contents hash
cash() {
    local -hr path="$1"
    
    md5 -q "$path" | cut -c -10    
}

# passcode password
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

# compress video
cv() {
    local -r file_path="$1"

    local -r full_filename="$(basename "$file_path")"
    local -r extension="${full_filename##*.}"
    local -r filename="${full_filename%.*}"

    ffmpeg -i "$file_path" -vcodec libx265 -acodec copy -crf 28 -vtag hvc1 -preset fast "${filename}_compressed.$extension"
}

redock() {
 local -r service="$1"

 docker compose stop "$service"
 docker compose rm -f "$_"
 docker compose build "$_"
 docker compose up -d "$_"
}

# punch in
pi() {
    local -r time="$1"

    local -a options=()

    if [ -n "$time" ]; then
        options+=(--time "$time")
    fi

    klog start "${options[@]}"
}

# punch break
pb() {
    local -r time="$1"
    local -r summary="${2-}" # can include #tags

    if [ -z "$time" ]; then
        echo "<start-time> required"
        return 1
    fi

    klog track "$time - $time $summary"
}

# punch lunch
pl() {
    pb "$1" "#lunch"
}

# punch out
po() {
    local -r time="$1"

    local -a options=()

    if [ -n "$time" ]; then
        options+=(--time "$time")
    fi

    klog stop "${options[@]}"
}
