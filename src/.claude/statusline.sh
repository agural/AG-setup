#!/bin/bash
# Claude Code status line.
# Subscription sessions: 5-hour and 7-day limit usage.
# API sessions (launched via `cc`): estimated session cost plus workspace name.
input=$(cat)

IFS=$'\x1f' read -r MODEL EFFORT CTX COST H5 H5_IN D7 ADDED REMOVED SID DIR <<<"$(jq -r '
  def pct: if . == null then "" else floor end;
  def mins_until: if . == null then "" else ((. - now) / 60 | floor | if . < 0 then 0 else . end) end;
  [ .model.display_name // "?",
    .effort.level // "",
    (.context_window.used_percentage | pct),
    (.cost.total_cost_usd // 0),
    (.rate_limits.five_hour.used_percentage | pct),
    (.rate_limits.five_hour.resets_at | mins_until),
    (.rate_limits.seven_day.used_percentage | pct),
    (.cost.total_lines_added // 0),
    (.cost.total_lines_removed // 0),
    .session_id // "",
    .workspace.current_dir // ""
  ] | map(tostring) | join("\u001f")' <<<"$input")"

RED=$'\033[31m'; YEL=$'\033[33m'; GRN=$'\033[32m'; DIM=$'\033[2m'; RST=$'\033[0m'

# Green under 50%, yellow 50-79%, red 80%+
color() {
  if [ "${1:-0}" -ge 80 ]; then printf '%s' "$RED"
  elif [ "${1:-0}" -ge 50 ]; then printf '%s' "$YEL"
  else printf '%s' "$GRN"; fi
}

fmt_mins() {
  [ -z "$1" ] && return
  if [ "$1" -ge 60 ]; then printf '%dh%02dm' $(($1 / 60)) $(($1 % 60)); else printf '%dm' "$1"; fi
}

# Context bar
CTX=${CTX:-0}
FILLED=$((CTX / 10)); [ "$FILLED" -gt 10 ] && FILLED=10
printf -v FILL "%${FILLED}s"; printf -v PAD "%$((10 - FILLED))s"
BAR="${FILL// /█}${PAD// /░}"

# Usage: API key in the environment means this is an API session
if [ -n "$ANTHROPIC_API_KEY" ]; then
  MODE="🔒 API${CC_WORKSPACE:+:$CC_WORKSPACE}"
  USAGE="$(printf '$%.2f' "$COST") ${DIM}session est.${RST}"
else
  MODE="Sub"
  if [ -n "$H5" ]; then
    USAGE="5h $(color "$H5")${H5}%${RST}"
    [ -n "$H5_IN" ] && USAGE+=" ${DIM}↻$(fmt_mins "$H5_IN")${RST}"
    [ -n "$D7" ] && USAGE+=" · 7d $(color "$D7")${D7}%${RST}"
  else
    USAGE="${DIM}limits after first reply${RST}"
  fi
fi

BRANCH=$(git -C "$DIR" branch --show-current 2>/dev/null)

LINES=""
if [ "${ADDED:-0}" -gt 0 ] || [ "${REMOVED:-0}" -gt 0 ]; then
  LINES="  ${GRN}+${ADDED}${RST} ${RED}−${REMOVED}${RST}"
fi

printf '%s\n' "$MODE │ $MODEL${EFFORT:+ ($EFFORT)} │ $(color "$CTX")$BAR ${CTX}%${RST} │ $USAGE"
printf '%s\n' "${DIM}📁 ${DIR##*/}${BRANCH:+  🌿 $BRANCH}${RST}${LINES}${SID:+  ${DIM}🆔 $SID${RST}}"
