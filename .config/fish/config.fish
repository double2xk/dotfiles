# Fix PATH so Homebrew binaries are always visible
if status --is-login
    set -gx PATH /usr/local/bin /opt/homebrew/bin $PATH
end
if status is-interactive
# Commands to run in interactive sessions can go here
end
