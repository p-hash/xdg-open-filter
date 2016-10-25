# first regex that matches is used
match %r{https?://(www\.)?youtube\.[a-z]{2,4}/\w+}, "urxvtc -e mpsyt url"
match %r{https?://(www\.)?youtu\.be/\w+}, "urxvtc -e mpsyt url"

# instead of a program, you can pass a block of ruby code which takes one
# parameter (the input filename)
match %r{^[^/].exe$} do |input| puts "Ignoring windows executable" end

# if a program and a block is given, the filename is passed to the block and the
# result is given to the program
match %r{file://.*}, "/usr/bin/xdg-open" do |input| input.sub "file://", "" end


# vim:ft=ruby
