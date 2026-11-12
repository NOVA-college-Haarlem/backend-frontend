#!/usr/bin/env bash
# Commit-rapport voor de docent: per studentrepo de commits, kaarten en tags.
#
# Gebruik:
#   ./commit-rapport.sh repos.txt > rapport.md
#
# repos.txt: één repo per regel, als "eigenaar/repo" (GitHub) of als git-URL/pad.
#   Een naam erachter mag:  jdevries/solestore  Jan de Vries
#   Regels die met # beginnen worden overgeslagen.
#
# Repo's worden als mirror in ./.repos gecloned en bij een volgende run alleen bijgewerkt.
# Private repo's: log eerst in met `gh auth login` en draai `gh auth setup-git`.
#
# Instelbaar: GROOT=300 (regels toegevoegd vanaf wanneer een commit "groot" is).

set -euo pipefail

lijst=${1:?"Gebruik: $0 repos.txt"}
groot=${GROOT:-300}
cache=${CACHE:-.repos}
mkdir -p "$cache"

echo "# Commit-rapport — $(date '+%Y-%m-%d %H:%M')"
echo
echo "Grote commit = meer dan $groot regels toegevoegd. Geldige prefix: \`K<n>: \` of \`US<n>: \`."

grep -Ev '^[[:space:]]*(#|$)' "$lijst" | while read -r repo naam; do
  case $repo in
    *://* | /* | ./* | git@*) url=$repo ;;
    *) url="https://github.com/$repo.git" ;;
  esac
  dir="$cache/$(echo "$repo" | tr '/:' '__')"

  echo
  echo "## ${naam:-$repo}"
  echo
  echo "\`$repo\`"
  echo

  if [ -d "$dir" ]; then
    git -C "$dir" remote update --prune >/dev/null 2>&1 || { echo "⚠️ Bijwerken mislukt."; continue; }
  else
    git clone --quiet --mirror "$url" "$dir" 2>/dev/null || { echo "⚠️ Kan repo niet clonen (bestaat hij, en heb je toegang?)."; continue; }
  fi

  if ! git -C "$dir" rev-parse --verify --quiet HEAD >/dev/null; then
    echo "⚠️ Nog geen commits."
    continue
  fi

  git -C "$dir" log HEAD --no-merges --reverse --shortstat \
    --date=format:'%G-W%V %Y-%m-%d' --pretty=format:'@@%h|%ad|%an|%s' |
  awk -v groot="$groot" '
    function flush() {
      if (sha == "") return
      n++; laatste = dag
      week[wk]++; if (!(wk in wseen)) { wseen[wk] = 1; wvolg[++nw] = wk }
      if (match(msg, /^(K|US)[0-9]+: /)) {
        p = substr(msg, 1, RLENGTH - 2); pref[p]++
        if (!(p in pseen)) { pseen[p] = 1; pvolg[++np] = p }
      } else zonder[++nz] = "`" sha "` " dag " — " msg
      if (ins > groot) grote[++ng] = "`" sha "` " dag " — +" ins " regels — " msg
      if (!(auteur in aseen)) { aseen[auteur] = 1; auteurs = auteurs (auteurs == "" ? "" : ", ") auteur }
      sha = ""
    }
    /^@@/ {
      flush()
      split(substr($0, 3), f, "|")
      sha = f[1]; split(f[2], d, " "); wk = d[1]; dag = d[2]; auteur = f[3]
      msg = substr($0, length(f[1] f[2] f[3]) + 6)
      ins = 0; next
    }
    /insertion/ { if (match($0, /[0-9]+ insertion/)) ins = substr($0, RSTART, RLENGTH) + 0 }
    END {
      flush()
      printf "- **Commits:** %d (laatste: %s)\n", n, laatste
      printf "- **Auteurs:** %s\n", auteurs
      printf "- **Per week:**"; for (i = 1; i <= nw; i++) printf " %s: %d%s", wvolg[i], week[wvolg[i]], (i < nw ? " ·" : ""); print ""
      printf "- **Per kaart/userstory:**"; if (np == 0) printf " geen"
      for (i = 1; i <= np; i++) printf " %s: %d%s", pvolg[i], pref[pvolg[i]], (i < np ? " ·" : ""); print ""
      printf "- **Zonder prefix:** %d\n", nz; for (i = 1; i <= nz; i++) print "  - " zonder[i]
      printf "- **Grote commits:** %d\n", ng; for (i = 1; i <= ng; i++) print "  - " grote[i]
    }'

  tags=$(git -C "$dir" for-each-ref --sort=creatordate refs/tags \
    --format='%(refname:short) (%(creatordate:short), `%(if)%(*objectname)%(then)%(*objectname:short)%(else)%(objectname:short)%(end)`)' | paste -sd '|' - | sed 's/|/, /g')
  echo "- **Tags:** ${tags:-geen}"
done
