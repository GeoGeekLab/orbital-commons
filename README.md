# Orbital Commons

**Orbital catalog · mean elements · SGP4/SDP4 propagation · observer geometry**

*ORBITAL COMMONS* is a geospatial instrument for examining the active artificial-satellite population as a time-dependent orbital field. It connects standardized mean-element records, propagation epoch, orbital regime, and terrestrial observer geometry within one analytical view.

<p align="center">
  <a href="https://geogeeklab.github.io/orbital-commons/">
    <img src="https://geogeeklab.github.io/orbital-commons/assets/instrument.png" alt="Orbital Commons instrument" width="720">
  </a>
</p>

## Scientific focus

The instrument addresses a core problem in orbital geography: how a catalogued orbital state becomes a spatial relation at a specified epoch. Users can inspect the distribution of active objects, stratify the population by orbital regime, propagate the catalog through UTC, and examine the geometric relation between a selected spacecraft and an observer on Earth.

The analytical object is therefore not a static point cloud. It is a population of mean-element states whose positions change as a function of propagation time. This supports exploratory analysis of orbital-population structure, altitude-regime occupancy, time-dependent ground relation, and the spatial organization of Earth-orbiting infrastructure.

## Orbital data model

| Component | Specification |
| --- | --- |
| Catalog source | [CelesTrak General Perturbations (GP) data](https://celestrak.org/NORAD/elements/) |
| Exchange format | [CCSDS Orbit Mean-Elements Message (OMM), CCSDS 502.0-B-3](https://ccsds.org/Pubs/502x0b3e1.pdf), delivered as JSON |
| Mean-element state | Epoch, mean motion, eccentricity, inclination, right ascension of ascending node, argument of pericenter, mean anomaly, and associated perturbation terms |
| Propagation | SGP4 / SDP4 via [`satellite.js`](https://github.com/shashwatak/satellite-js) |
| Temporal reference | User-selected UTC propagation epoch |
| Spatial interpretation | Propagated geocentric state combined with orbital-regime classification and observer-relative geometry |

[CelesTrak's OMM/GP interface](https://celestrak.org/NORAD/documentation/gp-data-formats.php) exposes GP data in a standards-oriented format that preserves the mean-element semantics required by SGP4/SDP4. The propagated state is evaluated relative to the element epoch, so catalog recency and propagation interval are part of the analytical context.

## Geospatial interpretation

The instrument links orbital mechanics with geographic reference. A selected object can be examined as a propagated Earth-orbiting state and as a relation to a terrestrial observer, connecting orbital elements to ground-relative geometry. This makes epoch, reference frame, orbital regime, and observer location explicit analytical variables rather than hidden display parameters.

## Instrument access

**Live instrument:** https://geogeeklab.github.io/orbital-commons/

*ORBITAL COMMONS* is a public entrypoint to the production runtime maintained in [`GeoGeekLab/GeoGeekLab.github.io`](https://github.com/GeoGeekLab/GeoGeekLab.github.io). [`SOURCE.json`](./SOURCE.json) records the pinned upstream revision, and [`PRODUCTION.md`](./PRODUCTION.md) documents the runtime and orbital-data contract.

*GeoGeek note — an orbit is a relation among state, epoch, reference frame, and observer.*
