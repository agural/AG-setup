#!/bin/bash
# Claude Code hook: ring the terminal bell (sets tmux's "!" flag on the window).
# Rings in the tmux pane when inside tmux, otherwise in the terminal.
# On Stop: stay quiet for short progress updates while background tasks are running.
input=$(cat)

if jq -e '.hook_event_name == "Stop"
    and ([.background_tasks[]? | select(.status == "running")] | length > 0)
    and ((.last_assistant_message // "") | length < 300)' <<<"$input" >/dev/null 2>&1; then
  exit 0
fi

if [ -n "$TMUX_PANE" ]; then
  t=$(tmux display -p -t "$TMUX_PANE" '#{pane_tty}' 2>/dev/null)
fi
{ printf '\a' > "${t:-/dev/tty}"; } 2>/dev/null
exit 0
