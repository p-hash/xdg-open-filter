xdg-open-filter
===============

xdg-open-filter is a wrapper around xdg-open, the program used by many linux
applications to determine which program to use to open a certain filetype or to
open an URL.

It allows you to define the action to take for a file or URL based on regular
expressions and passes on all requests that don't have a matching regex to
xdg-open.

Installation
------------

To ensure that programs using xdg-open use the wrapper, place it in a folder
that comes before the location of the original xdg-open in $PATH. If your
xdg-open is located somewhere other than `/usr/bin/xdg-open`, change that path in
the wrapper.

Create a configuration file at `~/.config/xdg-rules`. An example configuration
is contained in the repository. If that file is missing, every call is simply
passed through to xdg-open, so nothing breaks for other users if they don't
create such a file.
