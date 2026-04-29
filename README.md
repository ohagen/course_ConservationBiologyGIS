# Conservation Biology GIS Course

A Quarto-based tutorial covering GIS methods used in a conservation biology course.
Topics include QGIS workflows for spatial data management and R-based spatial plotting
and visualization of biodiversity and habitat data.

## Contents

- **QGIS Tutorial** – step-by-step guide to common QGIS operations (loading layers,
  projections, spatial queries, map export).
- **R Spatial Tutorial** – reproducible R workflows for spatial data wrangling,
  mapping, and visualization using `sf`, `terra`, `ggplot2`, and `tmap`.

## Prerequisites

| Tool | Version |
|------|---------|
| [QGIS](https://qgis.org) | ≥ 3.28 LTR |
| [R](https://cran.r-project.org) | ≥ 4.2 |
| [Quarto](https://quarto.org) | ≥ 1.4 |

## Rendering the tutorials

```bash
quarto render
```

The rendered HTML site is placed in `_site/`.

## License

Content is released under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).
