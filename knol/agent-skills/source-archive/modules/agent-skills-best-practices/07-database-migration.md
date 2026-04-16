---
domain_id: "agent-skills"
source_id: "agent-skills-best-practices"
section_index: "7"
section_title: "Database migration"
source_url: "https://agentskills.io/skill-creation/best-practices"
reader_url: "https://r.jina.ai/http://agentskills.io/skill-creation/best-practices"
captured_at: "2026-04-16T03:40:47+00:00"
---
## Database migration

Run exactly this sequence:

```bash
python scripts/migrate.py --verify --backup
```

Do not modify the command or add additional flags.
```

Most skills have a mix. Calibrate each part independently.

When multiple tools or approaches could work, pick a default and mention alternatives briefly rather than presenting them as equal options.

```
<!-- Too many options -->
You can use pypdf, pdfplumber, PyMuPDF, or pdf2image...

<!-- Clear default with escape hatch -->
Use pdfplumber for text extraction:

```python
import pdfplumber
```

For scanned PDFs requiring OCR, use pdf2image with pytesseract instead.
```

### Favor procedures over declarations

A skill should teach the agent _how to approach_ a class of problems, not _what to produce_ for a specific instance. Compare:

```
<!-- Specific answer — only useful for this exact task -->
Join the `orders` table to `customers` on `customer_id`, filter where
`region = 'EMEA'`, and sum the `amount` column.

<!-- Reusable method — works for any analytical query -->
1. Read the schema from `references/schema.yaml` to find relevant tables
2. Join tables using the `_id` foreign key convention
3. Apply any filters from the user's request as WHERE clauses
4. Aggregate numeric columns as needed and format as a markdown table
```

This doesn’t mean skills can’t include specific details — output format templates (see [Templates for output format](http://agentskills.io/skill-creation/best-practices#templates-for-output-format)), constraints like “never output PII,” and tool-specific instructions are all valuable. The point is that the _approach_ should generalize even when individual details are specific.
