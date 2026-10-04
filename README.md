# Orbital Commons

**Orbital catalog · propagation · observer geometry**

Orbital Commons is a geospatial instrument for examining the active artificial-satellite population as a time-dependent spatial field. It couples a catalog of general perturbation elements with SGP4/SDP4 propagation so that orbital state, epoch, orbital regime, and ground-relative geometry can be explored within one analytical view.

![Orbital Commons instrument](https://geogeeklab.github.io/orbital-commons/assets/instrument.png)

## Scientific focus

The instrument addresses a basic problem in orbital geography: how a catalog record becomes a spatial relation at a specified time. Users can inspect the distribution of active objects, filter by orbital regime, propagate the catalog through UTC, and examine the relation between a selected object and an observer on Earth.

The resulting view is useful for exploratory analysis of orbital population structure, temporal change in propagated state, and the geometry connecting spaceborne objects with terrestrial locations.

## Data and methods

| Component | Method |
| --- | --- |
| Orbital catalog | CelesTrak active GP elements in CCSDS OMM JSON |
| Propagation | SGP4 / SDP4 through `satellite.js` |
| Temporal reference | User-selected UTC epoch |
| Visualization | Three-dimensional orbital field with class filtering and object inspection |
| Ground relation | Observer-based geometric relation for the selected object |

The displayed positions are model-derived states propagated from general perturbation elements. Their scientific meaning therefore depends on element epoch, catalog maintenance, and propagation time.

## Instrument access

**Live instrument:** https://geogeeklab.github.io/orbital-commons/

Orbital Commons is an entrypoint repository. The production runtime is maintained in `GeoGeekLab/GeoGeekLab.github.io` and pinned here to an explicit source commit. `SOURCE.json` records that upstream version in machine-readable form; `PRODUCTION.md` documents the runtime and data contract.

*GeoGeek note — an orbit is a relation among state, epoch, and observer.*
