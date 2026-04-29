# Script to generate synthetic sample data for the tutorials
# Run once: source("data/create_sample_data.R")

library(sf)
library(terra)

# ------------------------------------------------------------------
# 1. Study-area polygon
# ------------------------------------------------------------------
# A simple rectangular polygon roughly covering a Central-European study region
study_area_coords <- matrix(
  c(14.0, 47.9,
    14.6, 47.9,
    14.6, 48.4,
    14.0, 48.4,
    14.0, 47.9),   # close the ring
  ncol  = 2,
  byrow = TRUE
)

study_area <- sf::st_sf(
  name     = "Study Area",
  geometry = sf::st_sfc(
    sf::st_polygon(list(study_area_coords)),
    crs = 4326
  )
)

sf::st_write(study_area, "data/study_area.gpkg", delete_dsn = TRUE, quiet = TRUE)
message("Written: data/study_area.gpkg")

# ------------------------------------------------------------------
# 2. Synthetic land-cover raster (4 classes, 0.01° resolution)
# ------------------------------------------------------------------
# Classes:
#   1 = agricultural land
#   2 = forest
#   3 = shrubland / grassland
#   4 = urban / built-up

r <- terra::rast(
  xmin = 14.0, xmax = 14.6,
  ymin = 47.9, ymax = 48.4,
  resolution = 0.01,
  crs        = "EPSG:4326"
)

set.seed(42)
land_cover_values <- sample(1:4, size = terra::ncell(r), replace = TRUE,
                            prob = c(0.25, 0.40, 0.25, 0.10))

terra::values(r)   <- land_cover_values
names(r)           <- "land_cover"
terra::coltab(r)   <- data.frame(
  value  = 1:4,
  col    = c("#FFD700", "#228B22", "#8FBC8F", "#A9A9A9"),
  label  = c("Agricultural", "Forest", "Shrubland", "Urban")
)

terra::writeRaster(r, "data/land_cover.tif", overwrite = TRUE)
message("Written: data/land_cover.tif")

message("Sample data creation complete.")
