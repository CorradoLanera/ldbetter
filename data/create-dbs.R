first_db <- data.frame(mm(depvar,
    choice ~ somesthing +  somesthingelse ,
    id = ~uid,
    design = conjoint_design,
    baselines = baselines_base
))

second_db <- data.frame(mm(df_conj, depvar,
    choice ~ somesthing +  somesthingelse
    id = ~uid,
    design = conjoint_design,
    baselines = baselines_base
))

combined_db <- data.frame(
    bind_rows(first_model, second_model, .id = "idies")
)

saveRDS(first_db, "data/first_db.rds")
saveRDS(second_db, "data/second_db.rds")
saveRDS(combined_db, "data/combined_db.rds")
