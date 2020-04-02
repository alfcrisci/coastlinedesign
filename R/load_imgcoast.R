#' load_imgcoast
#' Read and performs pre-processing of image
#'
#' @param r character Path of coastal image to be processed.
#' @param target_ex Extent* raster object [ xmin ymin xmax ymax] .
#' @param resolution numeric Final resolution of raster object. default is 0.5 meter
#' @param crs character proj4 definition.
#' @importFrom magrittr  %>%
#' @importFrom raster raster
#' @importFrom imager load.image
#' @export
#'
#'

load_imgcoast=function(x,target_ex,resolution=0.5,crs="+init=epsg:32632") {

r <- raster::raster(xmn=xmin, xmx=xmax, ymn=ymin, ymx=ymax, crs="+init=epsg:32632", resolution=resolution)
m_im <- imager::load.image(x) %>% isoblur(1) %>% as.matrix(im) # il blur  in raster ma con la matrice deve essere trasposta

return(setValues(r, t(m_im)))
}

