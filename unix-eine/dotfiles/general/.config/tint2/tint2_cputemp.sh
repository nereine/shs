#!/usr/bin/env bash
temp=$(sensors | grep -i 'Core 0' | head -n1 | sed -r 's/.*:\s+[\+-]?(.*C)\s+.*/\1/')
rpm=$(sensors | grep -i fan | head -n1 | sed -r 's/.*?:\s+(.*?)\s+RPM/\1/')
printf '%8s\n%8s' "$temp" "$rpm"
