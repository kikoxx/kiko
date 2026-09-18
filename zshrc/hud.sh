#!/bin/sh

# Grab Target IP
target="NONE"
[ -f /tmp/target ] && target="$(cat /tmp/target 2>/dev/null)"

if [ "${target}" != "" ] && [ "${target}" != "NONE" ]; then
  printf "<txt>≧ ${target} ≦</txt>"
  
  if command -v xclip >/dev/null 2>&1; then
    printf "<txtclick>sh -c 'printf ${target} | xclip -selection clipboard'</txtclick>"
    printf "<tool>Target IP (click to copy)</tool>"
  else
    printf "<tool>Target IP (install xclip to copy to clipboard)</tool>"
  fi
else
  printf "<txt>≧◔◡◔≦</txt>"
fi
