((* if entry.date *))
#two-col-entry(
  /* left column : the actual bullet */
  left-content: [- <<entry.bullet>>],

  /* right column : the date, only if provided */
  right-content: [#align(right)[<<entry.date>>]],
)
((* else *))
#one-col-entry(
  content: [- <<entry.bullet>>],
)
((* endif *))
