# Orbital Commons

**Catalog / orbit / ground relation.**

Orbital Commons is an independent GeoGeek Observatory deployment of the production orbital instrument. It renders the active orbital field in 3D, propagates OMM elements with SGP4/SDP4, supports time control and orbital-class filtering, and relates selected objects to an observer on Earth.

## Public instrument

https://geogeeklab.github.io/orbital-commons/

## Runtime

The production runtime is pinned to a specific commit of `GeoGeekLab/GeoGeekLab.github.io`. See `PRODUCTION.md` for the exact baseline, data contract, interpretation limits, and deployment policy.

## Local shell

```bash
python -m http.server 8000
```

Open `http://localhost:8000`.

The instrument requires network access for its pinned runtime and declared upstream data sources.

## Deployment

Pushes to `main` deploy through `.github/workflows/pages.yml`. Static production-contract checks run before the Pages artifact is uploaded.

Third-party software and data remain subject to their respective terms and licenses. This repository does not introduce a project license that is absent from the source project.
