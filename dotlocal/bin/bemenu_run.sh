#!/usr/bin/env bash
BEMENU_ARGS=(-n -i -p " " --bdr "#cba6f7" --center \
    --scrollbar autohide -l 10 --border 1 --border-radius 10 --width-factor 0.5 \
    --fn JetBrainsMonoNerdFont:10 --fb "#1e1e2e" \
    --ff "#cdd6f4" --nb "#1e1e2e" --nf "#cdd6f4" --tb "#1e1e2e" --hb "#1e1e2e" \
    --tf "#f38ba8" --hf "#f9e2af" --af "#cdd6f4" --ab "#1e1e2e" --no-exec "$@")
if [ "$1" = 'dmenu' ]; then
  bemenu-run "${BEMENU_ARGS[@]}"
else
  bemenu "${BEMENU_ARGS[@]}"
fi
