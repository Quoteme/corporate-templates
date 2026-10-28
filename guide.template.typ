// guide.template.typ

#import "@preview/fletcher:0.5.8" as fletcher: edge

#let ink = rgb("#1d2733")
#let muted = rgb("#5d6875")
#let rule = rgb("#cfd6dd")
#let link-color = rgb("#1d4ed8")
#let accent = rgb("#1d4ed8")
#let accent-soft = rgb("#e8eefc")
#let surface = rgb("#f3f4f6")

#let metadata-row(label, value) = [
  #text(size: 9pt, weight: "semibold", fill: muted)[#label]
  #h(10pt)
  #text(size: 10pt, fill: ink)[#value]
]

#let display-date(date) = if type(date) == datetime {
  date.display("[year]-[month padding:zero]-[day padding:zero]")
} else {
  date
}

// ---------------------------------------------------------------------------
// Flowcharts (built on fletcher)
// ---------------------------------------------------------------------------

// A styled `fletcher.diagram`. Accepts every argument `diagram` accepts.
#let flowchart(caption: none, ..args) = {
  let chart = align(center, fletcher.diagram(
    node-stroke: (paint: ink, thickness: 0.8pt),
    edge-stroke: (paint: ink, thickness: 0.8pt),
    node-inset: 8pt,
    spacing: (16mm, 9mm),
    mark-scale: 80%,
    ..args,
  ))
  if caption == none { chart } else {
    figure(chart, caption: caption, kind: "flowchart", supplement: [Flowchart])
  }
}

// A process step: rounded rectangle.
#let step(pos, label, ..args) = fletcher.node(
  pos,
  text(size: 9pt)[#label],
  corner-radius: 3pt,
  fill: white,
  ..args,
)

// A yes/no decision: diamond.
#let decision(pos, label, ..args) = fletcher.node(
  pos,
  text(size: 9pt)[#label],
  shape: fletcher.shapes.diamond,
  fill: surface,
  ..args,
)

// Start or end of a process: stadium shape.
#let terminal(pos, label, ..args) = fletcher.node(
  pos,
  text(size: 9pt, weight: "semibold", fill: white)[#label],
  shape: fletcher.shapes.pill,
  fill: accent,
  stroke: none,
  ..args,
)

// ---------------------------------------------------------------------------
// Content blocks
// ---------------------------------------------------------------------------

#let callout-styles = (
  note: (label: "NOTE", color: rgb("#1d4ed8"), fill: rgb("#e8eefc")),
  tip: (label: "TIP", color: rgb("#15803d"), fill: rgb("#e7f5ec")),
  important: (label: "IMPORTANT", color: rgb("#7c3aed"), fill: rgb("#f1ebfd")),
  warning: (label: "WARNING", color: rgb("#b45309"), fill: rgb("#fdf3e3")),
)

// A highlighted box. `kind` is one of "note", "tip", "important", "warning".
#let callout(kind: "note", title: none, body) = {
  let style = callout-styles.at(kind)
  block(
    width: 100%,
    inset: (x: 12pt, y: 10pt),
    fill: style.fill,
    stroke: (left: (paint: style.color, thickness: 3pt)),
    breakable: false,
  )[
    #text(size: 8.5pt, weight: "bold", tracking: 0.12em, fill: style.color)[
      #style.label#if title != none [ · #upper(title)]
    ]
    #v(4pt, weak: true)
    #text(size: 9.5pt)[#body]
  ]
}

// A numbered procedure. Each item is content, or (title, description).
#let steps(..items) = {
  let items = items.pos()
  grid(
    columns: (22pt, 1fr),
    column-gutter: 10pt,
    row-gutter: 12pt,
    ..items.enumerate().map(((i, item)) => {
      let (title, description) = if type(item) == array {
        (item.at(0), item.at(1, default: none))
      } else {
        (item, none)
      }
      (
        circle(radius: 10pt, fill: accent, stroke: none)[
          #set align(center + horizon)
          #text(size: 9pt, weight: "bold", fill: white)[#(i + 1)]
        ],
        block(above: 0pt)[
          #v(3pt)
          #text(size: 10.5pt, weight: "semibold")[#title]
          #if description != none {
            v(3pt, weak: true)
            text(size: 9.5pt, fill: muted)[#description]
          }
        ],
      )
    }).flatten(),
  )
}

// A tick-box list. Each item is content, or (content, done).
#let checklist(..items) = {
  let box-mark(done) = box(
    width: 9pt, height: 9pt, baseline: 1pt,
    radius: 1.5pt,
    stroke: (paint: if done { accent } else { muted }, thickness: 0.8pt),
    fill: if done { accent } else { none },
    if done { align(center + horizon, text(size: 7pt, fill: white)[✓]) },
  )
  block(
    for item in items.pos() {
      let (label, done) = if type(item) == array {
        (item.at(0), item.at(1, default: false))
      } else {
        (item, false)
      }
      block(above: 7pt, below: 7pt)[#box-mark(done) #h(6pt) #label]
    },
  )
}

// A table of roles and what they are responsible for: ((role, duty), ...).
#let responsibilities(..rows) = table(
  columns: (auto, 1fr),
  inset: (x: 8pt, y: 6pt),
  stroke: (x, y) => (
    bottom: (paint: rule, thickness: 0.6pt),
    top: if y == 0 { (paint: ink, thickness: 0.8pt) },
  ),
  fill: (_, y) => if y == 0 { surface },
  table.header(
    text(size: 9pt, weight: "semibold")[Role],
    text(size: 9pt, weight: "semibold")[Responsibility],
  ),
  ..rows.pos().map(((role, duty)) => (
    text(size: 9.5pt, weight: "semibold")[#role],
    text(size: 9.5pt)[#duty],
  )).flatten(),
)

// ---------------------------------------------------------------------------
// Document
// ---------------------------------------------------------------------------

#let guide(
  title: "Process Guide",
  subtitle: none,
  guide-id: none,
  version: "1.0",
  status: "Draft",
  owner: none,
  audience: none,
  issued-at: datetime.today(),
  review-at: none,
  company-name: "ACME Corp",
  company-logo: none,
  summary: none,
  contacts: (),
  revisions: (),
  outline-depth: 2,
  body,
) = {
  let subtitle = if subtitle == "" { none } else { subtitle }
  let contacts = if contacts == none { () } else { contacts }
  let revisions = if revisions == none { () } else { revisions }

  set document(title: title)
  set page(
    paper: "a4",
    margin: (top: 1.6cm, bottom: 1.8cm, x: 1.8cm),
    header: context if counter(page).get().first() > 1 [
      #text(size: 8.5pt, fill: muted)[
        #title
        #h(1fr)
        #if guide-id != none [#guide-id · ]v#version
      ]
      #v(-4pt)
      #line(length: 100%, stroke: (paint: rule, thickness: 0.6pt))
    ],
    footer: context align(right)[
      #text(size: 8.5pt, fill: muted)[
        #company-name #h(12pt) #counter(page).display("1 / 1", both: true)
      ]
    ],
  )
  set text(
    font: ("Avenir Next", "Helvetica Neue", "Arial"),
    fill: ink,
    size: 10.5pt,
  )
  set par(justify: true, leading: 0.7em)
  set heading(numbering: "1.1")
  set list(marker: text(fill: accent)[•])
  set enum(numbering: n => text(fill: accent, weight: "semibold")[#n.])

  show link: it => underline(text(fill: link-color)[#it.body])

  show heading.where(level: 1): it => block(above: 18pt, below: 12pt)[
    #text(size: 15pt, weight: "bold", fill: ink)[
      #if it.numbering != none {
        text(fill: accent)[#counter(heading).display(it.numbering)]
        h(8pt)
      }
      #it.body
    ]
    #v(6pt)
    #line(length: 100%, stroke: (paint: rule, thickness: 0.8pt))
  ]

  show heading.where(level: 2): it => block(above: 14pt, below: 8pt)[
    #text(size: 11.5pt, weight: "semibold", fill: ink)[
      #if it.numbering != none {
        text(fill: muted)[#counter(heading).display(it.numbering)]
        h(6pt)
      }
      #it.body
    ]
  ]

  show figure.caption: it => text(size: 9pt, fill: muted)[
    #text(weight: "semibold")[#it.supplement #context it.counter.display(it.numbering)]#it.separator#it.body
  ]

  // Cover page
  align(left)[
    #if company-logo != none {
      company-logo
    } else {
      rect(
        height: 12mm, width: 36mm,
        fill: surface,
        stroke: (paint: rule, thickness: 0.8pt),
      )[#align(center + horizon)[#text(size: 7.5pt, fill: muted)[LOGO]]]
    }
  ]
  v(18pt)

  text(size: 8.5pt, tracking: 0.16em, fill: muted)[INTERNAL GUIDE]
  v(10pt)
  text(size: 24pt, weight: "bold", fill: ink)[#title]
  if subtitle != none {
    v(6pt)
    text(size: 12pt, fill: muted)[#subtitle]
  }
  if owner != none {
    v(8pt)
    text(size: 11pt, fill: muted)[Maintained by #owner]
  }

  if summary != none {
    v(14pt)
    block(
      width: 100%,
      inset: (x: 12pt, y: 10pt),
      fill: accent-soft,
      stroke: (left: (paint: accent, thickness: 3pt)),
    )[
      #text(size: 8.5pt, weight: "bold", tracking: 0.12em, fill: accent)[PURPOSE]
      #v(4pt, weak: true)
      #text(size: 9.5pt)[#summary]
    ]
  }

  v(16pt)
  line(length: 100%, stroke: (paint: rule, thickness: 1pt))
  v(14pt)

  grid(
    columns: (1fr, 1fr),
    column-gutter: 18pt,
    row-gutter: 8pt,
    metadata-row("Document Type", [Process guide]),
    if guide-id != none { metadata-row("Guide ID", [#guide-id]) },
    metadata-row("Version", [#version]),
    metadata-row("Status", [#status]),
    metadata-row("Effective", [#display-date(issued-at)]),
    if review-at != none { metadata-row("Next Review", [#display-date(review-at)]) },
    if audience != none { metadata-row("Audience", [#audience]) },
  )

  if contacts.len() > 0 {
    v(18pt)
    text(size: 9pt, weight: "semibold", fill: muted)[CONTACTS]
    v(6pt)
    grid(
      columns: (1fr, 1fr),
      column-gutter: 18pt,
      row-gutter: 8pt,
      ..contacts.map(contact => {
        let name = contact.at(0)
        let role = contact.at(1)
        let email = contact.at(2, default: none)
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

  if revisions.len() > 0 {
    v(18pt)
    text(size: 9pt, weight: "semibold", fill: muted)[REVISION HISTORY]
    v(6pt)
    table(
      columns: (auto, auto, auto, 1fr),
      inset: (x: 8pt, y: 5pt),
      stroke: (x, y) => (bottom: (paint: rule, thickness: 0.6pt)),
      table.header(
        ..("Version", "Date", "Author", "Changes").map(h => text(size: 8.5pt, weight: "semibold", fill: muted)[#h]),
      ),
      ..revisions.map(((ver, date, author, changes)) => (
        text(size: 9pt)[#ver],
        text(size: 9pt)[#display-date(date)],
        text(size: 9pt)[#author],
        text(size: 9pt)[#changes],
      )).flatten(),
    )
  }

  pagebreak()

  // Table of contents
  if outline-depth != none and outline-depth > 0 {
    show outline.entry.where(level: 1): it => {
      v(4pt)
      strong(it)
    }
    outline(title: [Contents], depth: outline-depth, indent: auto)
    pagebreak()
  }

  body
}
