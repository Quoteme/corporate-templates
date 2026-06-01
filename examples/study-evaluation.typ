#import "../study-evaluation.template.typ": study-evaluation

#show: study-evaluation.with(
  title: "Wearable Biosensor Accuracy Study",
  subtitle: "Evaluation of continuous heart rate monitoring performance",
  company-name: "Corporate",
  authors: (
    ("Dr. Jane Smith", "Head of Clinical Affairs", "jane.smith@corporate.com"),
    ("Dr. Alan Chen", "Senior Clinical Researcher", "alan.chen@corporate.com"),
  ),
  recipients: (
    ("John Doe", "VP Regulatory Affairs", "john.doe@corporate.com"),
    ("Maria Lopez", "Chief Medical Officer", "maria.lopez@corporate.com"),
  ),
  abstract: [This evaluation assesses the accuracy and reliability of the wearable biosensor platform for continuous heart rate monitoring across a cohort of 120 participants. Results indicate strong concordance with reference ECG measurements across all activity levels.],
)

= Introduction

This document presents the findings of the clinical evaluation conducted between January and April 2026. The study was designed to assess device accuracy against gold-standard reference equipment.

= Methods

Participants wore the device continuously for 14 days while reference measurements were taken at standardised intervals under controlled and free-living conditions.

= Results

Mean absolute error in heart rate was 1.8 bpm across all conditions, with 97.3% of readings falling within the clinically accepted ±5 bpm threshold.

= Conclusion

The wearable biosensor platform demonstrates clinical-grade accuracy suitable for regulatory submission and further clinical integration.
