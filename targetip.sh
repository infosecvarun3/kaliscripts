#!/bin/sh

# Path to the file containing the IP address
ip_file="target.txt"

# Read the IP address from the file
ip="$(cat "${ip_file}" 2>/dev/null)"

# Validate the IP address format (simple check)
if [[ ! $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  ip=""
fi

if [ "${ip}" != "" ]; then
  printf "<icon>network-cell-symbolic</icon>"
  printf "<txt>${ip}</txt>"
  if command -v xclip; then
    printf "<iconclick>sh -c 'printf ${ip} | xclip -selection clipboard'</iconclick>"
    printf "<txtclick>sh -c 'printf ${ip} | xclip -selection clipboard'</txtclick>"
    printf "<tool>Target IP (click to copy)</tool>"
  else
    printf "<tool>Target IP (install xclip to copy to clipboard)</tool>"
  fi
else
  printf "<txt></txt>"
fi
