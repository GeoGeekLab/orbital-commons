# Orbital Commons

**Orbital catalog · mean elements · SGP4/SDP4 propagation · observer geometry**

*ORBITAL COMMONS* is a geospatial instrument for examining the active artificial-satellite population as a time-dependent orbital field. It connects standardized mean-element records, propagation epoch, orbital regime, and terrestrial observer geometry within one analytical view. The current GeoGeek Lab presents it as a continuous interactive workspace with an orbital field and a consolidated control rail.

**In the Lab:** [Orbital Commons](https://geogeeklab.github.io/lab.html?release=20261011v107watercache1) · [Instrument record](https://geogeeklab.github.io/records/lab-l04.html).

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
- **Change the radial representation.** Compare compressed and physical radial scale without changing the propagated orbital state.
- **Use the consolidated workspace.** Navigate catalog search, view settings, observer controls, selection, and source provenance from one control rail. Lab enhancements supply the compact sidebar and keyboard interaction.

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

## Lab implementation and parity

The instrument uses browser-side SGP4/SDP4 propagation in a Web Worker and instanced 3D rendering. The standalone entrypoint loads the same-origin Observatory bootstrap, then applies the Lab's optional orbital enhancements. If an optional enhancement fails, the base orbital instrument remains available.

| Responsibility | Main-site source |
| --- | --- |
| Orbital renderer and interaction | [`site/orbital/orbital-engine.js`](https://github.com/GeoGeekLab/GeoGeekLab.github.io/blob/main/site/orbital/orbital-engine.js) |
| Propagation worker | [`site/orbital/orbit-worker.js`](https://github.com/GeoGeekLab/GeoGeekLab.github.io/blob/main/site/orbital/orbit-worker.js) |
| Same-origin catalog adapter | [`site/orbital/orbit-catalog-source.js`](https://github.com/GeoGeekLab/GeoGeekLab.github.io/blob/main/site/orbital/orbit-catalog-source.js) |
| Orbital interaction enhancement | [`site/orbital/orbital-enhancements-v3.js`](https://github.com/GeoGeekLab/GeoGeekLab.github.io/blob/main/site/orbital/orbital-enhancements-v3.js) |
| Lab sidebar refinement | [`site/orbital/orbit-round2.js`](https://github.com/GeoGeekLab/GeoGeekLab.github.io/blob/main/site/orbital/orbit-round2.js) |
| Standalone page and release metadata | [`index.html`](./index.html), [`SOURCE.json`](./SOURCE.json) |

The active CelesTrak catalog is delivered through GeoGeek's same-origin `orbit-active` snapshot. A stale snapshot is historical last-known-good data, not a live catalog refresh. SGP4/SDP4 positions depend on mean-element quality and time from the element epoch. They are not precision ephemerides or collision predictions.

The Lab query parameter `release=20261011v107watercache1` identifies the Lab HTML/cache release. It does **not** pin an immutable Git commit or the standalone entrypoint's runtime assets.

## Instrument access

**Live instrument:** https://geogeeklab.github.io/orbital-commons/

Source runtime: [`GeoGeekLab/GeoGeekLab.github.io`](https://github.com/GeoGeekLab/GeoGeekLab.github.io)  
Pinned revision: [`SOURCE.json`](./SOURCE.json)  
Production contract: [`PRODUCTION.md`](./PRODUCTION.md)

*GeoGeek note — an orbit is a relation among state, epoch, reference frame, and observer.*
