#!/usr/bin/env bash
set -euo pipefail

PIN="d949bd75870bfd49f6d12b297e6cca02de107f9c"
RAW="https://raw.githubusercontent.com/GeoGeekLab/GeoGeekLab.github.io/${PIN}/site"

rm -rf _site
mkdir -p _site/runtime/orbital _site/runtime/vendor
cp index.html README.md PRODUCTION.md _site/
touch _site/.nojekyll

curl --fail --silent --show-error --location --retry 3 "${RAW}/orbital/orbital-engine.js" --output _site/runtime/orbital/orbital-engine.js
curl --fail --silent --show-error --location --retry 3 "${RAW}/orbital/orbit-worker.js" --output _site/runtime/orbital/orbit-worker.js
curl --fail --silent --show-error --location --retry 3 "${RAW}/orbital/orbital-lab.css" --output _site/runtime/orbital/orbital-lab.css
curl --fail --silent --show-error --location --retry 3 "https://cdn.jsdelivr.net/npm/three@0.186.0/+esm" --output _site/runtime/vendor/three.module.js
curl --fail --silent --show-error --location --retry 3 "https://cdn.jsdelivr.net/npm/satellite.js@6.0.2/+esm" --output _site/runtime/vendor/satellite.esm.js

python - <<'PY'
from pathlib import Path
engine = Path('_site/runtime/orbital/orbital-engine.js')
s = engine.read_text()
s = s.replace("https://cdn.jsdelivr.net/npm/three@0.186.0/+esm", "../vendor/three.module.js")
engine.write_text(s)
worker = Path('_site/runtime/orbital/orbit-worker.js')
s = worker.read_text()
s = s.replace("https://cdn.jsdelivr.net/npm/satellite.js@6.0.2/+esm", "../vendor/satellite.esm.js")
worker.write_text(s)
PY

test -s _site/runtime/orbital/orbital-engine.js
test -s _site/runtime/orbital/orbit-worker.js
test -s _site/runtime/orbital/orbital-lab.css
test -s _site/runtime/vendor/three.module.js
test -s _site/runtime/vendor/satellite.esm.js
grep -q 'mountOrbitalLab' _site/runtime/orbital/orbital-engine.js
grep -q "../vendor/satellite.esm.js" _site/runtime/orbital/orbit-worker.js
! grep -R -q 'cdn.jsdelivr.net/gh/GeoGeekLab/GeoGeekLab.github.io' _site
! grep -R -q 'cdn.jsdelivr.net/npm' _site/runtime/orbital

(
  cd _site
  find runtime -type f -print0 | sort -z | xargs -0 sha256sum > runtime-manifest.sha256
)
