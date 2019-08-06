setup_datamodel <- function(x) {

    stopifnot(checkfunction(x))
    x_dt <- setDT(model1data)

    stopifnot(is.data.table(x_dt))
    preparefunction(x_dt)

}
