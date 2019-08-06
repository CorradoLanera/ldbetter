setup_params <- function(combined, somesthingesle, eb, ex, ea) {

    stopifnot(is.logical(combined))
    stopifnot(is.logical(somesthingesle))
    stopifnot(is.logical(eb))
    stopifnot(is.logical(ex))
    stopifnot(is.logical(ea))

    tf <- c(TRUE, FALSE)
    selector <- expand.grid(
        combined = tf,
        somesthingesle = tf,
        eb = tf,
        ex = tf,
        ea = tf,
        KEEP.OUT.ATTRS = FALSE,
        stringsAsFactors = FALSE
    )
    selector["s"] <- seq_len(nrow(selector))

    res <- selector %>%
        dplyr::filter(
            combined == combined,
            somesthingesle == somesthingesle,
            eb == eb,
            ex == ex,
            ea == ea
        )

    if (nrow(res) > 1L) {
        warning("
            More than one possible params results.
            Only the first will be cosidered
        ")
    }

    list(# use a list to permit different class of object inside
        s = res[["s"]][[1L]]
        # ... other possible parameters
    )
}
