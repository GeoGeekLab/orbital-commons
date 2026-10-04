# Production contract

`orbital-commons` is the public entrypoint for the production *ORBITAL COMMONS* instrument.

## Runtime

- Source repository: `GeoGeekLab/GeoGeekLab.github.io`
- Tested source revision: `064ce2c718499fc26a744a9e58cad09d97a323fb`
- Production channel: `https://geogeeklab.github.io/`
- Shared bootstrap: `/core/observatory-entry.js`
- Orbital runtime: `/orbital/orbital-engine.js`
- Propagation worker: `/orbital/orbit-worker.js`
- Provider control: `/core/provider-stability.js` + `/core/data-supply.js`

The entrypoint loads the runtime from the same GitHub Pages origin as the main Observatory. The worker, runtime modules, catalog snapshot, metadata, and supporting assets therefore share one production origin.

## Orbital data supply

CelesTrak active GP/OMM data is refreshed by the main-site scheduled data-supply workflow and published as the same-origin `orbit-active` snapshot. Snapshot metadata records retrieval time, record count, and content digest. The production browser consumes that snapshot through the unified Data Supply adapter.

`unified-supply-v2` clears the legacy `geogeek-orbit-v2` browser catalog cache when the source contract changes, then aligns browser cache age with the deployed snapshot metadata.

## Release checks

The repository validates the source revision, shared bootstrap reference, Chromium instrument mount, absence of `.instrument-error`, provider/Data Supply installation, instrument screenshot, Pages deployment, and the deployed public endpoint.
