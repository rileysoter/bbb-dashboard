#!/bin/bash
cd /Users/rileysoter/repos/bbb-dashboard
git add index.html
git diff --cached --quiet && exit 0  # nothing changed, skip push
git commit -m "auto: update $(date '+%Y-%m-%d %H:%M')"
git push origin main
