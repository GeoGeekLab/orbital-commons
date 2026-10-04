# Production contract

## Runtime baseline

This repository deploys the Orbital Commons production instrument from `GeoGeekLab/GeoGeekLab.github.io` pinned to commit `d949bd75870bfd49f6d12b297e6cca02de107f9c`.

The standalone shell mounts `site/orbital/orbital-engine.js`. The engine uses Three.js and a module Web Worker running satellite.js 6.0.2.

## Data contract

- Upstream catalog: CelesTrak active GP elements in CCSDS OMM JSON.
- Propagation: SGP4 / SDP4 through satellite.js.
- Browser cache: the production engine can reuse a recent or stale cached catalog when the upstream catalog is unavailable.
- Time: user-controlled UTC propagation time.

## Interpretation limits

Displayed positions are model-propagated positions from general perturbation elements. They are not precision ephemerides or authoritative space-surveillance positions. Element age and catalog quality vary by object.

## Deployment contract

`main` deploys through GitHub Pages Actions. The workflow rejects an empty or non-production `index.html` before upload.

The production runtime is version-pinned. Updating the source baseline requires an explicit change to the pinned commit SHA in `index.html`.
