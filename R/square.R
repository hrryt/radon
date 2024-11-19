#' Crop to Square
#'
#' @inheritParams magick::image_extent
#' @returns Magick image object.
#' @examples
#' image_square(magick::logo)
#' @export
image_square <- function(image, gravity = "center") {
  ii <- magick::image_info(image)
  ii_min <- min(ii$width, ii$height)
  magick::image_extent(image, sprintf("%1$dx%1$d", ii_min), gravity)
}
