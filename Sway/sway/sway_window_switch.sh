#!/bin/bash

swaymsg -t get_tree |
    jq -r ’.nodes[].nodes[] | if .nodes then [recurse(.nodes[])] else [] end + .float‐
    ing_nodes | .[] | select(.nodes==[]) | ((.id | tostring) + " " + .name)’ |
        wofi --show dmenu | {
        read -r id name
            swaymsg "[con_id=$id]" focus
        }
