# Orbital Commons

**Orbital catalog · SGP4/SDP4 propagation · observer geometry**

*Orbital Commons* presents the active satellite population as an interactive Earth-orbit field. CelesTrak mean elements, UTC propagation time, orbital regime, and ground-based observation geometry meet in a single workspace.

<p align="center">
  <a href="https://geogeeklab.github.io/orbital-commons/">
    <img src="https://geogeeklab.github.io/orbital-commons/assets/instrument.png?v=20261012ready1" alt="Orbital Commons: active satellites around Earth, UTC controls, and orbital catalog sidebar" width="760">
  </a>
</p>

## Explore the orbital field

- **Orbital population:** navigate active catalog objects in a three-dimensional Earth-orbit view.
- **Regime filters:** examine LEO, MEO, GEO, and higher-altitude populations.
- **UTC propagation:** adjust the epoch and propagation speed using SGP4/SDP4.
- **Spacecraft inspection:** read catalog ID, element epoch, propagated position, velocity, altitude, inclination, period, and eccentricity.
- **Orbit and ground traces:** connect the selected spacecraft to its trajectory and Earth footprint.
- **Observer geometry:** place a terrestrial observer and inspect azimuth, elevation, range, and pass geometry.
- **Display controls:** compare physical and compressed radial scales, switch viewing direction, and manage graticules and orbit shells.
- **Catalog search:** locate spacecraft by name or NORAD identifier.

## Orbital model

| Component | Specification |
| --- | --- |
| Catalog | [CelesTrak active GP data](https://celestrak.org/NORAD/elements/) |
| Exchange format | [CCSDS OMM](https://ccsds.org/Pubs/502x0b3e1.pdf) in JSON |
| Elements | Mean motion, inclination, eccentricity, right ascension of ascending node, argument of pericenter, mean anomaly, epoch, and perturbation terms |
| Propagation | [satellite.js](https://github.com/shashwatak/satellite-js) · SGP4/SDP4 · Web Worker |
| Time | UTC propagation epoch |
| Position | Geocentric propagated state and observer-relative geometry |
| Rendering | Three.js · instanced 3D orbital field |

The instrument uses a CelesTrak OMM catalog distributed through GeoGeek's `orbit-active` data snapshot. The propagated state depends on the selected UTC epoch and each object's element epoch.

## Source and access

The [GeoGeek Observatory source](https://github.com/GeoGeekLab/GeoGeekLab.github.io) contains the [orbital engine](https://github.com/GeoGeekLab/GeoGeekLab.github.io/blob/main/site/orbital/orbital-engine.js), [propagation worker](https://github.com/GeoGeekLab/GeoGeekLab.github.io/blob/main/site/orbital/orbit-worker.js), and [orbital controls](https://github.com/GeoGeekLab/GeoGeekLab.github.io/tree/main/site/orbital).

**Instrument:** https://geogeeklab.github.io/orbital-commons/  
**Lab:** https://geogeeklab.github.io/lab.html  
**Instrument record:** https://geogeeklab.github.io/records/lab-l04.html

*GeoGeek note — an orbit is a relation among state, epoch, reference frame, and observer.*

**“星汉灿烂，若出其里” -- 曹操《观沧海》**
