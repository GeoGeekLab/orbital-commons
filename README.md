# Orbital Commons

**Orbital catalog · mean elements · SGP4/SDP4 propagation · observer geometry**

*ORBITAL COMMONS* is a geospatial instrument for examining the active artificial-satellite population as a time-dependent orbital field. It connects standardized mean-element records, propagation epoch, orbital regime, and terrestrial observer geometry within one analytical view.

<p align="center">
  <a href="https://geogeeklab.github.io/orbital-commons/">
    <img src="https://geogeeklab.github.io/orbital-commons/assets/instrument.png" alt="Orbital Commons instrument" width="720">
  </a>
</p>

## Instrument capabilities

- **Explore the orbital population.** Display active catalog objects in a three-dimensional Earth-orbit reference view.
- **Filter by orbital regime.** Isolate low-, medium-, geosynchronous-, and higher-altitude populations.
- **Propagate through UTC.** Advance or offset the analysis epoch and recompute positions with SGP4/SDP4.
- **Inspect individual spacecraft.** Read identity, element epoch, orbital parameters, propagated position, and regime classification.
- **Examine orbit and ground relation.** Trace the selected orbit and evaluate its geometry relative to Earth and a terrestrial observer.
- **Search and navigate.** Search the catalog, select objects, rotate and zoom the field, and change propagation time.

## Orbital data model

| Component | Specification |
| --- | --- |
| Catalog source | [CelesTrak General Perturbations (GP) data](https://celestrak.org/NORAD/elements/) |
| Exchange format | [CCSDS Orbit Mean-Elements Message (OMM), CCSDS 502.0-B-3](https://ccsds.org/Pubs/502x0b3e1.pdf), delivered as JSON |
| Mean-element state | Epoch, mean motion, eccentricity, inclination, right ascension of ascending node, argument of pericenter, mean anomaly, and perturbation terms |
| Propagation | SGP4 / SDP4 via [`satellite.js`](https://github.com/shashwatak/satellite-js) |
| Temporal reference | User-selected UTC propagation epoch |
| Spatial interpretation | Propagated geocentric state, orbital-regime classification, and observer-relative geometry |

[CelesTrak's OMM/GP interface](https://celestrak.org/NORAD/documentation/gp-data-formats.php) supplies the mean-element records used by the propagation workflow. Catalog epoch and selected propagation time determine the computed state.

## Geographic variables

The instrument combines four variables in one view:

- catalog object and mean-element state;
- UTC propagation epoch;
- orbital regime and propagated position;
- terrestrial observer location and relative geometry.

These variables support analysis of orbital-population structure, altitude-regime occupancy, ground relation, and observer-relative satellite geometry.

## Instrument access

**Live instrument:** https://geogeeklab.github.io/orbital-commons/

Source runtime: [`GeoGeekLab/GeoGeekLab.github.io`](https://github.com/GeoGeekLab/GeoGeekLab.github.io)  
Pinned revision: [`SOURCE.json`](./SOURCE.json)  
Production contract: [`PRODUCTION.md`](./PRODUCTION.md)

*GeoGeek note — an orbit is a relation among state, epoch, reference frame, and observer.*
