rotate <- function(image, degrees, geometry) {
  image |>
    magick::image_rotate(degrees) |>
    magick::image_extent(geometry) |>
    magick::image_repage()
}

spin <- function(image, angles, bg, border){
  ii <- magick::image_info(image)
  width <- ii$width
  stopifnot("image must be square" = width == ii$height)
  half <- width/2
  tryCatch({
    fig <- magick::image_draw(magick::image_blank(width, width))
    graphics::symbols(half, half, circles=half, bg=bg, fg=NA, inches=FALSE, add=TRUE)
  }, finally = grDevices::dev.off())
  image <- image |>
    magick::image_composite(fig, "DstAtop") |>
    magick::image_background(border)
  lapply(angles, rotate, image = image, geometry = sprintf("%1$dx%1$d", width))
}
