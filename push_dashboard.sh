#!/bin/bash
set -e
cd /Users/rileysoter/repos/bbb-dashboard

# Syntax-check JS before pushing — prevents shipping broken dashboards
python3 -c "
content = open('index.html').read()
s = content[content.rfind('<script>')+8:content.rfind('</script>')]
open('/tmp/_dash_check.js','w').write(s)
"
node --check /tmp/_dash_check.js || { echo "JS syntax error — aborting push"; exit 1; }

git add index.html
git diff --cached --quiet && exit 0  # nothing changed, skip push
git commit -m "auto: update $(date '+%Y-%m-%d %H:%M')"
git push origin main
