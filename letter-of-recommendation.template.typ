// letter-of-recommendation.typ

#let ink = rgb("#1d2733")
#let muted = rgb("#5d6875")
#let rule = rgb("#cfd6dd")
#let link-color = rgb("#1d4ed8")

#let letter-of-recommendation(
  company-name: "ACME Corp",
  company-logo: none,
  sender-name: "Sender Name",
  sender-title: "Position",
  sender-email: none,
  sender-phone: none,
  candidate-name: "Candidate Name",
  recipient-name: none,
  recipient-title: none,
  recipient-org: none,
  issued-at: datetime.today(),
  subject: none,
  body,
) = {
  set page(
    paper: "a4",
    margin: (top: 1.6cm, bottom: 1.8cm, x: 2.2cm),
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
  set par(justify: true, leading: 0.75em, spacing: 1.2em)

  show link: it => underline(text(fill: link-color)[#it.body])

  // Letterhead
  grid(
    columns: (1fr, auto),
    align: (left + top, right + top),
    [
      #if company-logo != none {
        company-logo
      } else {
        rect(
          height: 12mm, width: 36mm,
          fill: rgb("#f3f4f6"),
          stroke: (paint: rule, thickness: 0.8pt),
        )[#align(center + horizon)[#text(size: 7.5pt, fill: muted)[LOGO]]]
      }
    ],
    [
      #text(size: 9pt, weight: "semibold", fill: ink)[#sender-name]
      #linebreak()
      #text(size: 8.5pt, fill: muted)[#sender-title]
      #if sender-email != none {
        linebreak()
        text(size: 8.5pt, fill: muted)[#sender-email]
      }
      #if sender-phone != none {
        linebreak()
        text(size: 8.5pt, fill: muted)[#sender-phone]
      }
    ],
  )

  v(22pt)
  line(length: 100%, stroke: (paint: rule, thickness: 0.8pt))
  v(18pt)

  // Date
  text(size: 10pt, fill: ink)[#issued-at.display("[day padding:none] [month repr:long] [year]")]
  v(18pt)

  // Recipient block
  if recipient-name != none {
    text(size: 10pt, weight: "semibold", fill: ink)[#recipient-name]
    if recipient-title != none {
      linebreak()
      text(size: 10pt, fill: muted)[#recipient-title]
    }
    if recipient-org != none {
      linebreak()
      text(size: 10pt, fill: muted)[#recipient-org]
    }
    v(18pt)
  }

  // Subject line
  let subject-text = if subject != none { subject } else { "Letter of Recommendation – " + candidate-name }
  text(size: 10pt, weight: "semibold", fill: ink)[Re: #subject-text]
  v(14pt)

  // Salutation
  if recipient-name != none {
    text(size: 10.5pt)[Dear #recipient-name,]
  } else {
    text(size: 10.5pt)[To Whom It May Concern,]
  }
  v(10pt)

  // Body
  body

  v(28pt)

  // Closing
  text(size: 10.5pt)[Sincerely,]
  v(32pt)

  line(length: 44mm, stroke: (paint: rule, thickness: 0.8pt))
  v(4pt)
  text(size: 10pt, weight: "semibold", fill: ink)[#sender-name]
  linebreak()
  text(size: 9.5pt, fill: muted)[#sender-title]
  if sender-email != none {
    linebreak()
    text(size: 9pt, fill: muted)[#sender-email]
  }
}
