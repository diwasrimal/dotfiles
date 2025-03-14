#!/bin/sh

# This script extracts the symbol from a go doc line
# Example:
# func ServeTLS(l net.Listener, handler Handler, certFile, keyFile string) error - ServeTLS
# type CookieJar interface{ ... }                                                - CookieJar

echo $@ | awk '{ print $2 }' | sed 's/[(\[].*$//'