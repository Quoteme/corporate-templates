// study.template.typ

#let ink = rgb("#1d2733")
#let muted = rgb("#5d6875")
#let rule = rgb("#cfd6dd")
#let link-color = rgb("#1d4ed8")

#let metadata-row(label, value) = [
  #text(size: 9pt, weight: "semibold", fill: muted)[#label]
  #h(10pt)
  #text(size: 10pt, fill: ink)[#value]
]

#let study(
  title: "Clinical Study",
  subtitle: none,
  study-id: none,
  phase: none,
  issued-at: datetime.today(),
  company-name: "ACME Corp",
  recipients: (),
  abstract: none,
  company-logo: none,
  authors: (),
  body,
) = {
  let subtitle = if subtitle == none or subtitle == "" { none } else { subtitle }
  let recipients = if recipients == none { () } else { recipients }

  set page(
    paper: "a4",
    margin: (top: 1.6cm, bottom: 1.8cm, x: 1.8cm),
    footer: context align(right)[
      #text(size: 8.5pt, fill: muted)[
        #company-name       #counter(page).display("1 / 1", both: true)
      ]
    ],
  )
  set text(
    font: ("Avenir Next", "Helvetica Neue", "Arial"),
    fill: ink,
    size: 10.5pt,
  )
  set par(justify: true, leading: 0.7em)
  set heading(numbering: none)

  show link: it => underline(text(fill: link-color)[#it.body])

  show heading.where(level: 1): it => block(above: 18pt, below: 12pt)[
    #text(size: 15pt, weight: "bold", fill: ink)[#it.body]
    #v(6pt)
    #line(length: 100%, stroke: (paint: rule, thickness: 0.8pt))
  ]

  show heading.where(level: 2): it => block(above: 14pt, below: 8pt)[
    #text(size: 11.5pt, weight: "semibold", fill: ink)[#it.body]
  ]

  align(left)[
    #if company-logo != none {
      company-logo
    } else {
      rect(
        height: 12mm, width: 36mm,
        fill: rgb("#f3f4f6"),
        stroke: (paint: rule, thickness: 0.8pt),
      )[#align(center + horizon)[#text(size: 7.5pt, fill: muted)[LOGO]]]
    }
  ]
  v(18pt)

  text(size: 8.5pt, tracking: 0.16em, fill: muted)[CLINICAL STUDY]
  v(10pt)
  text(size: 24pt, weight: "bold", fill: ink)[#title]
  if subtitle != none {
    v(6pt)
    text(size: 12pt, fill: muted)[#subtitle]
  }
  v(8pt)
  text(size: 11pt, fill: muted)[Conducted by #company-name]
  if recipients.len() > 0 {
    v(10pt)
    text(size: 9pt, weight: "semibold", fill: muted)[RECIPIENTS]
    v(6pt)
    grid(
      columns: (1fr, 1fr),
      column-gutter: 18pt,
      row-gutter: 8pt,
      ..recipients.map(recipient => {
        let name = recipient.at(0)
        let role = recipient.at(1)
        let email = if recipient.len() > 2 { recipient.at(2) } else { none }
        [
          #text(name, size: 10.5pt, weight: "semibold", fill: ink)
          #linebreak()
          #text(role, size: 9.5pt, fill: muted)
          #if email != none {
            linebreak()
            text(email, size: 9pt, fill: muted)
          }
        ]
      }),
    )
  }
  if abstract != none {
    v(14pt)
    text(size: 9pt, weight: "semibold", fill: muted)[ABSTRACT]
    v(6pt)
    block(inset: (x: 10pt, y: 8pt), stroke: (paint: rule, thickness: 0.8pt))[
      #text(size: 9.5pt, fill: ink)[#abstract]
    ]
  }
  v(16pt)
  line(length: 100%, stroke: (paint: rule, thickness: 1pt))
  v(14pt)

  grid(
    columns: (1fr, 1fr),
    column-gutter: 18pt,
    row-gutter: 8pt,
    metadata-row("Issued", [#issued-at.display("[year]-[month padding:zero]-[day padding:zero]")]),
    metadata-row("Document Type", [Clinical study]),
    if study-id != none { metadata-row("Study ID", [#study-id]) },
    if phase != none { metadata-row("Phase", [#phase]) },
    metadata-row("Status", [Draft]),
    metadata-row("Audience", [Study investigators and sponsors]),
    metadata-row("Format", [Print-ready report]),
  )

  if authors.len() > 0 {
    v(18pt)
    text(size: 9pt, weight: "semibold", fill: muted)[AUTHORS]
    v(8pt)
    for author in authors {
      let name = author.at(0)
      let position = author.at(1)
      let email = if author.len() > 2 { author.at(2) } else { none }
      text(name, size: 10.5pt, weight: "semibold", fill: ink)
      linebreak()
      text(position, size: 9.5pt, fill: muted)
      if email != none {
        linebreak()
        text(email, size: 9pt, fill: muted)
      }
      v(8pt)
    }
  }

  pagebreak()

  body
}
