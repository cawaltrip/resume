// If date/location are set, then this needs to be a two column entry.
((* if date_and_location_column_template *))
#two-col-entry(
  left-content: [-
    <<main_column_first_row_template>>
    // If short_second_row is set, or if the date_and_location_column_template is longer than the main_column_first_row_template, or if the design.section_titles.type is "moderncv", then we need to add a second row.
    ((* if design.entries.short_second_row or date_and_location_column_template.count("\n\n") > main_column_first_row_template.count("\n\n") or design.section_titles.type=="moderncv" *))
    #v(-design-text-leading)
    <<main_column_second_row_template|replace("\n\n", "\n\n#v(design-highlights-top-margin - design-text-leading)")>>
    ((* endif *))
  ],
  right-content: [
    <<date_and_location_column_template>>
  ],
)
  // The opposite of the above check.
  ((* if not (design.entries.short_second_row or date_and_location_column_template.count("\n\n") > main_column_first_row_template.count("\n\n") or design.section_titles.type=="moderncv") *))
#one-col-entry(content:[-
  <<main_column_second_row_template|replace("\n\n", "\n\n#v(design-highlights-top-margin - design-text-leading)")>>
])
  ((* endif *))
((* else *))
  ((* if entry.bullet *))
#one-col-entry(content:[-
  <<main_column_first_row_template>>
  #v(-design-text-leading)
  <<main_column_second_row_template|replace("\n\n", "\n\n#v(design-highlights-top-margin - design-text-leading)")>>
])
  ((* else *))
#one-col-entry(
  content: [- <<entry.bullet>>],
)
  ((* endif *))
((* endif *))