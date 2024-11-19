#' Radon Transform
#'
#' The Radon transform (sinogram) of an image.
#'
#' @inheritParams magick::image_extent
#' @param steps number of steps around a half circle to rotate the image
#' @param bg color with which to replace the background of the image
#' @param border color to paint the rotated image outside the central circle
#' @param progress print some verbose status output
#' @returns Magick image object.
#' @examples
#' (im <- magick::image_extent(magick::rose, "46x46"))
#' image_radon(im, progress = FALSE)
#' @export
image_radon <- function(image, steps = 90, bg = "white", border = "black", progress = TRUE) {
  colorspace <- magick::image_info(image)$colorspace
  stopifnot("image colorspace must be sRGB or Gray" = colorspace %in% c("sRGB", "Gray"))
  angles <- steps + 1
  angles <- seq.int(0, 180, length.out = angles)[-angles]
  if(progress) {
    cat("\r\033[0;35mRotating image...             \033[0m")
    image <- spin(image, angles, bg, border)
    cat("\r\033[0;35mGetting image data...         \033[0m")
    image <- lapply(image, magick::image_data)
    cat("\r\033[0;35mForming array of image data...\033[0m")
    image <- `dim<-`(do.call(c, image), c(dim(image[[1]]), steps))
    cat("\r\033[0;35mPermuting array...            \033[0m")
    image <- aperm(image, c(3,2,4,1))
    cat("\r\033[0;35mConverting array to integer...\033[0m")
    mode(image) <- "integer"
    cat("\r\033[0;35mCalculating column means...   \033[0m")
    image <- colMeans(image)
    cat("\r\033[0;35mReading array to image...     \033[0m")
    image <- magick::image_read(image / 255)
    cat("\r\033[0;35mDone!                         \033[0m\n")
  } else {
    image <- spin(image, angles, bg, border)
    image <- lapply(image, magick::image_data)
    image <- `dim<-`(do.call(c, image), c(dim(image[[1]]), steps))
    image <- aperm(image, c(3,2,4,1))
    mode(image) <- "integer"
    image <- colMeans(image)
    image <- magick::image_read(image / 255)
  }
  image
}
