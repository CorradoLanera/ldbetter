produce_plot <- function(
    modeldata,
    eb = FALSE,
    ex = FALSE,
    ea = FALSE,
    combined = FALSE,
    save_plot = FALSE,
    filename = "p_modeldata.pdf"
) {
    # Setup -----------------------------------------------------------


    stopifnot(all(
        names(modeldata) %in%
        c("estimate", "std.error", "something", "somesthingelse")
    ))

    title <- "our cool plot"
    if (combined) {
        title <- paste(title, "(combined!)")
    }
    subtitle <- glue::glue(
        "ex is: {ex}; ea is: {ea}; obs are: {nrow(modeldata)}."
    )

    ## setup_params() is defined in R/setup_params.R
    params <- setup_params(
        somesthingelse = modeldata[["somesthingelse"]] ,
        combined = combined, eb = eb, ex = ex, ea = ea
    )


    # GG plot ---------------------------------------------------------


    p <- modeldata %>%
        ggplot(aes(x = level, y = estimate, color = somesthingelse)) +
        geom_pointrange(
            aes(
                min = estimate - 1.95 * std.error,
                max = estimate + 1.95 * std.error
            ),
            shape = params[["s"]]
        ) +
        geom_hline(yintercept = 0.5, lty = "dashed") +
        facet_wrap(something ~ .,
            scales = "free_y",
            nrow = 5,
            strip.position = "left"
        ) +
        coord_flip() +
        xlab("Always the same for x") +
        ylab("Always the same for y") +
        ggtitle(title, subtitle = subtitle) +
        theme_bw()

    if (!ex) {
        # colors_from_data() is defined in R/colors_from_data.R
        current_colour <- colors_from_data(modeldata)
        p <- p + scale_color_manual(current_colour)
    }

    if (save_plot) ggsave(filename = filename, plot = p)

    p
}
