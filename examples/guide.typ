#import "../guide.template.typ": guide, flowchart, step, decision, terminal, edge, callout, steps, checklist, responsibilities

#show: guide.with(
  title: "Employee Onboarding",
  subtitle: "From signed contract to fully productive team member",
  guide-id: "GD-HR-004",
  version: "2.1",
  status: "Approved",
  owner: "People & Culture",
  audience: "New employees, hiring managers, IT",
  issued-at: datetime(year: 2026, month: 9, day: 1),
  review-at: datetime(year: 2027, month: 3, day: 1),
  company-name: "Corporate",
  summary: [This guide describes how a new employee is onboarded at Corporate: who does what before the first day, what happens during the first week, and how the probation period is concluded. It is binding for hiring managers and serves as a reference for new employees.],
  contacts: (
    ("Sarah Becker", "People & Culture Partner", "sarah.becker@corporate.com"),
    ("Tom Wagner", "IT Service Desk Lead", "it-support@corporate.com"),
  ),
  revisions: (
    ("2.1", datetime(year: 2026, month: 9, day: 1), "S. Becker", [Added buddy programme and 30-day check-in.]),
    ("2.0", datetime(year: 2026, month: 2, day: 15), "S. Becker", [Process redesigned for hybrid work.]),
    ("1.0", datetime(year: 2025, month: 4, day: 1), "M. Kraus", [Initial version.]),
  ),
)

= Scope

This guide applies to all permanent and fixed-term employees joining Corporate in Germany. Interns and external contractors follow the shortened process in GD-HR-005.

#callout(kind: "note")[
  If you are a new employee, start with @first-week. Everything before that is handled for you.
]

= Roles and Responsibilities

#responsibilities(
  ("Hiring manager", [Owns the onboarding plan, assigns a buddy, runs the 30-day and probation reviews.]),
  ("People & Culture", [Prepares the contract, personnel file and payroll registration; sends the welcome pack.]),
  ("IT Service Desk", [Provisions hardware, accounts and access rights before day one.]),
  ("Buddy", [Peer contact for informal questions during the first three months.]),
  ("New employee", [Completes mandatory trainings and the onboarding checklist.]),
)

= Process Overview

#flowchart(
  caption: [Onboarding process from signed contract to end of probation.],
  terminal((0, 0), [Contract signed]),
  edge("-|>"),
  step((0, 1), [Create personnel file \ & payroll entry]),
  edge("-|>"),
  step((0, 2), [Order hardware \ & create accounts]),
  edge("-|>"),
  decision((0, 3), [Ready by \ day one?]),
  edge("r", "-|>", [no]),
  step((1, 3), [Escalate to \ IT lead]),
  edge((1, 3), (1, 2), (0, 2), "-|>"),
  edge((0, 3), (0, 4), "-|>", [yes]),
  step((0, 4), [First day & \ welcome session]),
  edge("-|>"),
  step((0, 5), [30-day check-in]),
  edge("-|>"),
  decision((0, 6), [Probation \ passed?]),
  edge("r", "-|>", [no]),
  terminal((1, 6), [Offboarding \ (GD-HR-007)]),
  edge((0, 6), (0, 7), "-|>", [yes]),
  terminal((0, 7), [Onboarding complete]),
)

= Before the First Day

== People & Culture

#steps(
  ([Create personnel file], [Collect tax ID, social security number and bank details via the HR portal.]),
  ([Register for payroll], [Submit the payroll entry no later than the 10th of the month of entry.]),
  ([Send welcome pack], [One week before the start date: welcome letter, first-day agenda and buddy contact.]),
)

== IT Service Desk

#steps(
  ([Order hardware], [Standard laptop kit as defined in the IT catalogue; special requests need manager approval.]),
  ([Create accounts], [E-mail, SSO, chat and the role-specific tools listed in the hiring ticket.]),
  ([Confirm readiness], [Close the hiring ticket at least two working days before the start date.]),
)

#callout(kind: "warning", title: "Lead time")[
  Hardware orders need at least *10 working days*. Hiring managers must open the hiring ticket immediately after the contract is signed.
]

= The First Week <first-week>

#checklist(
  ([Collect laptop and badge at reception], true),
  ([Attend the welcome session (Monday, 10:00)], true),
  [Meet your buddy for lunch],
  [Complete data protection and information security trainings],
  [Set up multi-factor authentication],
  [Review your onboarding plan with your manager],
)

#callout(kind: "tip")[
  Bookmark the internal wiki's _New here?_ page: it links every tool, policy and contact mentioned in this guide.
]

= Probation Period

The probation period lasts six months. The hiring manager holds a structured check-in after 30 days and a probation review no later than four weeks before the probation period ends. Both conversations are documented in the HR portal.

#callout(kind: "important")[
  If the probation review is not documented in time, the probation period ends automatically. Set calendar reminders on the first day.
]
