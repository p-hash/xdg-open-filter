declare -A XDG_RULES=(
    ["https?://(www\.)?youtube\.[a-z]{2,4}/\w+"]="urxvtc -e mpsyt url"
    ["https?://(www\.)?youtu\.be/\w+"]="urxvtc -e mpsyt url"
)
