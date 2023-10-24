#!/usr/bin/env ruby
arg=ARGV[0]
cmd="sbcl --noinform --eval '(progn (print #{arg}) (sb-ext:quit))'"
system(cmd)
puts
