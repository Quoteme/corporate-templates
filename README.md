# corporate-templates

Typst document templates for internal corporate use.

| Template | Function | Example |
|---|---|---|
| `day-recap.template.typ` | `day-recap` | [PDF](https://happel.ai/corporate-templates/day-recap.pdf) |
| `study-evaluation.template.typ` | `study-evaluation` | [PDF](https://happel.ai/corporate-templates/study-evaluation.pdf) |
| `study.template.typ` | `study` | [PDF](https://happel.ai/corporate-templates/study.pdf) |

> Example PDFs are generated automatically by GitHub Actions on every push to `main`. They are not stored in the repository.

---

## Local installation (macOS)

Typst loads local packages from:

```
~/Library/Application Support/typst/packages/local/<name>/<version>/
```

### Option A – clone directly into the packages directory

```sh
mkdir -p ~/Library/Application\ Support/typst/packages/local/corporate-templates
git clone https://github.com/Quoteme/corporate-templates \
  ~/Library/Application\ Support/typst/packages/local/corporate-templates/0.1.0
```

### Option B – symlink a local checkout

```sh
mkdir -p ~/Library/Application\ Support/typst/packages/local/corporate-templates
ln -s /path/to/your/checkout \
  ~/Library/Application\ Support/typst/packages/local/corporate-templates/0.1.0
```

---

## Usage

After installation, import any template at the top of your `.typ` file:

### `day-recap`

```typ
#import "@local/corporate-templates:0.1.0": day-recap, todo-item

#show: day-recap.with(
  date: datetime(year: 2026, month: 6, day: 1),
  todos: (
    ("Review protocol v3", true),
    ("Send summary to team"),
  ),
  notes: [Short notes here.],
)

= My Section

Body text goes here.
```

### `study-evaluation`

```typ
#import "@local/corporate-templates:0.1.0": study-evaluation

#show: study-evaluation.with(
  title: "Study Title",
  subtitle: "Phase II",
  company-name: "Corporate",
  company-logo: image("logo.svg", height: 12mm),
  authors: (("Jane Smith", "Clinical Affairs", "jane@corporate.com"),),
  recipients: (("John Doe", "Regulatory", "john@corporate.com"),),
  abstract: [Brief abstract text.],
)

= Introduction

Body text goes here.
```

### `study`

```typ
#import "@local/corporate-templates:0.1.0": study

#show: study.with(
  title: "Wearable Biosensor Accuracy Study",
  subtitle: "Continuous heart rate monitoring in free-living conditions",
  study-id: "CS-2026-001",
  phase: "Phase II",
  company-name: "Corporate",
  company-logo: image("logo.svg", height: 12mm),
  authors: (("Jane Smith", "Principal Investigator", "jane@corporate.com"),),
  recipients: (("John Doe", "Regulatory", "john@corporate.com"),),
  abstract: [Brief abstract text.],
)

= Background

Body text goes here.
```

---

## Available exports

| Symbol | Template file |
|---|---|
| `day-recap` | `day-recap.template.typ` |
| `todo-item` | `day-recap.template.typ` |
| `study-evaluation` | `study-evaluation.template.typ` |
| `metadata-row` | `study-evaluation.template.typ` |
| `study` | `study.template.typ` |
