#!/bin/bash

cat <<EOF
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- SPDX-License-Identifier: CERN-OHL-S-2.0 -->
<!-- SPDX-FileCopyrightText: 2026 Benedikt Spranger <b.spranger@linutronix.de> \
-->

<svg
    width="800"
    height="800"
    version="1.1"
    id="pixels-logo"
    xmlns="http://www.w3.org/2000/svg"
    xmlns:svg="http://www.w3.org/2000/svg">
  <defs id="defs1" />
  <rect
      x="0"
      y="0"
      width="800"
      height="800"
      fill="DimGray"
      id="base" />
  <path
    fill="url(#rg)"
    stroke="#000000"
    stroke-width="8"
    d="M 16,16 H 784 c 0,347 -34,606 -384,766 C 50,623 16,364 16,16 Z"
     id="blazon" />
  <g id="dot">
    <polyline points="2,2 22,2 22,17 17,22 0,22"
              style="fill:white;stroke:white;stroke-width:1" />
    <circle cx="12" cy="12" r="8" />
  </g>
  <use href="#dot" transform="translate(775,0)" />
EOF

for x in $(seq 0 31)
do
    xpos=$((160+x*15))
    for y in $(seq 0 31)
    do
	r=$((y*4 + y*4))
	g=$((y*8))
	b=$((x*8))
	ypos=$((100+y*15))
	printf "  <use href=\"#dot\" transform=\"translate(%d,%d)\"  style=\"fill:#%02x%02x%02x;stroke:white;stroke-width:1\" />\n" "$xpos" "$ypos" "$r" "$g" "$b"
    done
done

echo "</svg>"
