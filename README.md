# Orbital Commons

**Catalog / orbit / ground relation**

Orbital Commons is an observing instrument for reading the active artificial-satellite population as a changing spatial system. It combines a public orbital catalog with time-dependent propagation so users can compare orbital regimes, inspect individual objects, and relate motion in space to a viewpoint on Earth.

> **GeoGeek principle:** An orbit is not a dot. It is a model, a time, and a viewpoint.

## Mission

The project is designed to make three things visible at the same time: what objects are in the catalog, how their modeled positions change with time, and how that geometry relates to the ground.

The instrument is not intended to reproduce a space-surveillance display. Its purpose is comparative observation: seeing structure in the catalog, testing orbital intuition, and keeping the distinction between source elements and propagated position explicit.

## Observation system

| Element | Operational definition |
| --- | --- |
| Catalog | CelesTrak active GP elements in CCSDS OMM JSON |
| Propagation | SGP4 / SDP4 through `satellite.js` |
| Time | User-controlled UTC propagation time |
| View | Interactive 3D orbital field with object inspection and class filtering |
| Ground relation | Selected-object geometry interpreted from an Earth observer frame |

The production engine can reuse a recent or stale browser-cached catalog when the upstream catalog is unavailable. The interface identifies that state rather than presenting cached data as current.

## What this instrument helps answer

- How do low, medium, geosynchronous, and higher orbital regimes separate spatially?
- How does the visible configuration change when the propagation time changes?
- Which properties belong to the catalog record, and which are derived by the propagation model?
- How does an object’s orbital geometry change when viewed in relation to a point on Earth?

## Interpretation

Displayed positions are propagated from general perturbation elements. They are not precision ephemerides and are not authoritative space-surveillance positions. Element age, source quality, and model limits vary by object.

This distinction is part of the instrument, not a footnote: **catalog state and modeled state are related, but they are not the same evidence.**

## Operations

**Public instrument**  
https://geogeeklab.github.io/orbital-commons/

The entry repository mounts the production runtime from `GeoGeekLab/GeoGeekLab.github.io`, pinned to commit `d949bd75870bfd49f6d12b297e6cca02de107f9c`. Runtime upgrades are deliberate; they do not follow the source repository automatically.

See [`PRODUCTION.md`](./PRODUCTION.md) for the runtime baseline, data contract, interpretation limits, and deployment policy.

For a local entry shell:

```bash
python -m http.server 8000
```

Then open `http://localhost:8000`.

---

Part of the **GeoGeek Observatory** — *Geo to see. Geek to build.*
