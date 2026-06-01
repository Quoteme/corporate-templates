#import "../study.template.typ": study

#show: study.with(
  title: "Wearable Biosensor Accuracy Study",
  subtitle: "Continuous heart rate monitoring in free-living conditions",
  study-id: "CS-2026-001",
  phase: "Phase II",
  company-name: "Corporate",
  authors: (
    ("Dr. Jane Smith", "Principal Investigator", "jane.smith@corporate.com"),
    ("Dr. Alan Chen", "Co-Investigator", "alan.chen@corporate.com"),
  ),
  recipients: (
    ("John Doe", "VP Regulatory Affairs", "john.doe@corporate.com"),
    ("Maria Lopez", "Chief Medical Officer", "maria.lopez@corporate.com"),
  ),
  abstract: [A prospective observational study assessing the accuracy and reliability of a wearable biosensor platform for continuous heart rate monitoring across 120 participants over 14 days. The primary endpoint is concordance with reference ECG measurements across activity levels.],
)

= Background and Rationale

Continuous heart rate monitoring via wearable devices offers significant potential for remote patient monitoring and early detection of cardiac irregularities. Establishing clinical-grade accuracy is a prerequisite for regulatory clearance and clinical adoption.

= Objectives

- Primary: Demonstrate mean absolute error ≤ 2 bpm against reference ECG across all activity levels.
- Secondary: Characterise performance across age groups, BMI ranges, and skin tones.

= Study Design

Prospective, single-arm, observational study conducted across three clinical sites. Participants wore the device continuously for 14 days under free-living conditions, with supervised reference measurements at day 1, 7, and 14.

= Participants

*Inclusion criteria:* Adults aged 18–75, no implanted cardiac devices, capable of providing informed consent.

*Exclusion criteria:* Known arrhythmia, active skin condition at the sensor site, participation in a concurrent interventional study.

= Endpoints and Outcomes

The primary endpoint will be assessed using Bland-Altman analysis. Secondary endpoints will be analysed using linear mixed-effects models to account for repeated measurements within participants.

= Timeline

| Milestone | Target Date |
|---|---|
| Site activation | 2026-07-01 |
| First participant enrolled | 2026-08-01 |
| Last participant completed | 2026-11-30 |
| Data lock | 2026-12-15 |
| Final report | 2027-01-31 |
