# Production contract

`orbital-commons` is the public entrypoint for the production *ORBITAL COMMONS* instrument.

## Runtime

- Source repository: `GeoGeekLab/GeoGeekLab.github.io`
- Verified source reference (PR and deployed Pages Chromium QA on 2026-10-12): `12743de0f7d0e900031ec2cbbe17551255e271a5`
- Bootstrap asset release: `20261004b` (shared loader constant; distinct from the Lab HTML release)
- Production channel: `https://geogeeklab.github.io/`
- Shared bootstrap: `/core/observatory-entry.js`
- Orbital runtime: `/orbital/orbital-engine.js`
- Optional Lab enhancements: `/orbital/orbital-enhancements-v3.js`, `/orbital/orbit-round2.js` and their CSS
- Propagation worker: `/orbital/orbit-worker.js`
- Provider control: `/core/provider-stability.js` + `/core/data-supply.js`

The entrypoint loads the runtime from the same GitHub Pages origin as the main Observatory. The worker, runtime modules, catalog snapshot, metadata, and supporting assets therefore share one production origin.

## Orbital data supply

CelesTrak active GP/OMM data is refreshed by the main-site scheduled data-supply workflow and published as the same-origin `orbit-active` snapshot. Snapshot metadata records retrieval time, record count, and content digest. The production browser consumes that snapshot through the unified Data Supply adapter.

`unified-supply-v2` clears the legacy `geogeek-orbit-v2` browser catalog cache when the source contract changes, then aligns browser cache age with the deployed snapshot metadata.

## Release checks

The repository validates the source revision, shared bootstrap reference, Chromium instrument mount, absence of `.instrument-error`, provider/Data Supply installation, `same-origin-snapshot` transport, instrument screenshot, Pages deployment, and the deployed public endpoint.

## Lab synchronization (20261011v107watercache1)

The standalone entrypoint loads the optional Lab orbital controls before mounting the common production bootstrap. This reconciles the standalone controls with the updated Lab workspace; failure of an enhancement must not block the base instrument. The referenced source SHA records the examined main-site tree, **not** a guarantee that an origin-served asset remains immutable. GitHub Pages serves the current deployed bytes from the shared origin.

Lab reference: https://geogeeklab.github.io/lab.html?release=20261011v107watercache1

## Deployment verification (2026-10-12)

- PR-only Chromium smoke: **passed** before merge.
- Production Pages deploy: **passed**.
- Deployed public instrument Chromium check: **passed**.
- Evidence: [GitHub Actions deployment run](https://github.com/GeoGeekLab/orbital-commons/actions/runs/38198057100).

These checks validate the deployed entrypoint and its current shared-origin dependencies. They do not make external data feeds, source assets, or orbit/earthquake conditions immutable.
