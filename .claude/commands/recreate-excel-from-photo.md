# /recreate-excel-from-photo — Excel Recreation from Spreadsheet Photos

You are a multimodal document reconstruction agent. You read photographs of Excel spreadsheets, extract cell data using vision capabilities, and recreate faithful Excel files with values and inferred formulas. You process photos methodically — sorting, cross-validating, extracting, verifying with the user, and finally detecting formulas using the Opus 1M model.

---

## Progress Tracking

At every stage transition, print a **progress checklist** so the user always knows where things stand. Use this format:

```
─────────────────────────────────────────
 Spreadsheet Photo Organizer
─────────────────────────────────────────
 ✅  Stage 0 — Prerequisites
 ✅  Stage 1 — Photo Discovery & Sorting (N photos → M files)
 🔄  Stage 2 — Cross-Validation  [current]
 ⬜  Stage 3 — Row/Column Verification
 ⬜  Stage 4 — Cell Value Extraction
 ⬜  Stage 5 — Excel Creation & Verification
 ⬜  Stage 6 — Iterate All Files
 ⬜  Stage 7 — Present Final Product
 ⬜  Stage 8 — Formula Recreation (Opus 1M)
 ⬜  Stage 9 — Final Output
─────────────────────────────────────────
```

Legend: ✅ done  🔄 in progress  ⬜ not started  ❌ failed

**Rules:**
- Print the checklist **before starting** each stage and **after completing** each stage.
- During Stages 4–6, reprint before each file group so per-file progress is visible.
- After a rate-limit retry, reprint with `⚠️ rate limit — retrying (attempt N/3)` on the affected line.

---

## Stage 0 — Prerequisites

### 0a. Install openpyxl

Run via `Bash`:
```bash
python3 -c "import openpyxl" 2>/dev/null || pip install openpyxl
```

If installation fails, stop and tell the user: "openpyxl could not be installed. Please run `pip install openpyxl` manually and re-run this skill."

### 0b. Parse Input

Parse `$ARGUMENTS` to determine the input directory:

- **Directory path provided** (starts with `./`, `/`, or `~`): use it directly.
- **No argument**: use `AskUserQuestion` to ask: "Which directory contains the spreadsheet photos? Provide the full path."

Verify the directory exists using `Bash`: `ls <dir>`. If it does not exist, report the error and stop.

### 0c. Discover Images

Use `Glob` to find all image files in the input directory:
- Patterns: `*.jpg`, `*.jpeg`, `*.png`, `*.bmp`, `*.tiff`, `*.webp` (case-insensitive — also check uppercase extensions)

If no images found, tell the user: "No image files found in `<dir>`. Supported formats: JPG, PNG, BMP, TIFF, WEBP." and stop.

### 0d. Create Workspace

Use `Bash` to create the workspace directory structure:
```bash
mkdir -p "<input-dir>/_output/sorted"
mkdir -p "<input-dir>/_output/extraction"
mkdir -p "<input-dir>/_output/output"
```

Print the progress checklist (Stage 0 ✅, all others ⬜).

---

## Scaling Strategy

Photo count determines the extraction approach. **NEVER** spawn a single agent to handle more than 10 photos — agents time out on large batches and all intermediate work is lost.

| Photo count | Approach |
|---|---|
| **1–10** | Process directly in main conversation (no sub-agents needed) |
| **11–30** | Use 2–3 parallel agents, each handling 5–10 photos |
| **31–100** | Use batched parallel agents (3–5 photos each), 2–3 concurrent, multiple rounds |
| **100+** | Same as above, with checkpoint verification between rounds |

**Batch extraction loop** (used in Stages 4–6):
1. Divide photos for a file group into batches of 3–5 photos.
2. Launch 2–3 agents in parallel, each processing one batch.
3. After agents return, verify that `_cells.json` files were saved for each photo.
4. Repeat until all photos are processed.
5. If a batch fails, only 3–5 photos need re-processing.

**Checkpoint resume**: Before starting extraction, check which `_cells.json` files already exist in the extraction directory. Skip photos that already have extraction data. This allows resuming after interruptions.

---

## Stage 1 — Photo Discovery & Sorting

**Goal:** Read each photo, identify the Excel filename, and group photos into sub-folders.

### 1a. Identify Filenames

For each image file found in Stage 0c, use the `Read` tool to examine the photo. Claude's multimodal vision will analyze the image.

After reading each photo, determine:
1. **Excel filename** — visible in the title bar, window header, or any other indicator in the screenshot.
2. **All sheet tab names** — visible at the bottom of the spreadsheet window.
3. **Currently active sheet tab** — the highlighted/selected tab.

Record this metadata for each photo as a structured note:
```
Photo: <photo_path>
Filename: <detected_filename>
Active Sheet: <active_sheet_name>
Visible Tabs: <tab1>, <tab2>, ...
```

### 1b. Handle Unidentified Photos

If the filename cannot be determined from a photo:
1. Try contextual clues — does the sheet content, column structure, or data match other identified photos?
2. If still unclear, collect into an `_unidentified` list.

At the end of this stage, if there are unidentified photos, use `AskUserQuestion` to present them:
- "I couldn't determine the Excel filename for these photos: `<list>`. Which file does each belong to?"
- Provide the option to skip them.

### 1c. Sort into Sub-folders

Use `Bash` to copy (never move) each photo into its sorted sub-folder:
```bash
mkdir -p "<input-dir>/_output/sorted/<sanitized-filename>/"
cp "<photo_path>" "<input-dir>/_output/sorted/<sanitized-filename>/"
```

Sanitize the filename for use as a directory name (remove special characters, keep it readable).

### 1d. Save Manifest

Use `Bash` to write a `manifest.json` to `<input-dir>/_output/manifest.json` via inline Python:

```python
import json
manifest = {
    "input_dir": "<input-dir>",
    "files": {
        "<filename>": {
            "sheets": [],
            "photos": [
                {"path": "<photo_path>", "active_sheet": "<sheet>", "visible_tabs": ["<tab1>", "<tab2>"]}
            ]
        }
    }
}
with open("<input-dir>/_output/manifest.json", "w") as f:
    json.dump(manifest, f, indent=2)
```

Print the progress checklist (Stage 1 ✅ with photo/file counts).

---

## Stage 2 — Cross-Validation

**Goal:** Verify that all photos in each sub-folder are consistent — same filename, same sheet names.

For each file group (sub-folder):

### 2a. Verify Filename Consistency

Re-check that every photo in the group shows the same Excel filename. If any photo shows a different filename, flag it with `AskUserQuestion`:
- "Photo `<name>` in the `<filename>` group appears to show a different file: `<detected>`. Should I move it to a different group, or keep it here?"

### 2b. Compile Sheet List

Across all photos in the group, compile a master list of all unique sheet tab names seen. This is the expected set of sheets for this Excel file.

### 2c. Check Tab Consistency

Verify that:
- Sheet tab names are spelled consistently across photos.
- The tab order (where visible) is consistent.

If inconsistencies are found, present them to the user via `AskUserQuestion` with specific details.

### 2d. Update Manifest

Update `manifest.json` with the validated sheet list for each file group.

Print the progress checklist (Stage 2 ✅).

---

## Stage 3 — Row/Column Verification

**Goal:** For each photo, identify the visible row/column range and build a coverage map.

For each photo in each file group:

### 3a. Identify Visible Range

Use `Read` to examine the photo and determine:
- **Visible row numbers** — from the left margin (e.g., rows 1–25).
- **Visible column letters** — from the top margin (e.g., columns A–H).
- **Active sheet** — which sheet tab is selected.

Record: `{photo, sheet, first_row, last_row, first_col, last_col}`

### 3b. Build Coverage Map

For each sheet, build a coverage map showing which regions are captured:
```
Sheet "Budget":
  Photo IMG_5435.jpg: A1:H25
  Photo IMG_5436.jpg: A26:H50
  Photo IMG_5437.jpg: I1:P25
  Coverage: A1:P50 (complete)
  Gaps: I26:P50 (not captured)
```

### 3c. Report Gaps

If any sheet has significant gaps (regions not captured in any photo), warn the user via `AskUserQuestion`:
- "Sheet `<name>` has uncaptured regions: `<gap ranges>`. The recreated Excel will only contain the captured cells. Proceed?"

### 3d. Update Manifest

Update `manifest.json` with coverage data per photo.

Print the progress checklist (Stage 3 ✅).

---

## Stage 4 — Cell Value Extraction

**Goal:** Extract every visible cell value from each photo with precise row/column positioning. This is the most critical stage — extracting actual numbers, not summaries.

### 4a. Checkpoint Resume

Before starting extraction, check which photos already have extraction data:

```bash
ls <input-dir>/_output/extraction/<filename>/*_cells.json 2>/dev/null | wc -l
```

Compare against the total photo count for this file group. Skip photos that already have `_cells.json` files. Print:
```
Checkpoint: N/M photos already extracted. Resuming from photo N+1.
```

### 4b. Batch Extraction Loop

Divide remaining (un-extracted) photos into batches of **3–5 photos** each. For each round, launch **2–3 agents in parallel**, each processing one batch. Follow the Scaling Strategy section.

Create the extraction sub-directory first:
```bash
mkdir -p "<input-dir>/_output/extraction/<filename>/"
```

For each batch, spawn an Agent with **this exact prompt template** (fill in the placeholders):

```
You are extracting cell data from spreadsheet photographs into JSON files.

## Photos to process (do them IN ORDER):
{numbered list of 3-5 photo paths}

## Output directory:
{extraction_dir}

## Instructions

For EACH photo, do these steps in order:

1. **Read** the photo using the Read tool.
2. **Identify** the active sheet tab (visible at the bottom of the spreadsheet window).
3. **Identify** the visible row numbers (from the left margin) and column letters (from the top header).
4. **Extract EVERY non-empty cell** visible in the photo. For each cell, record:
   - "sheet": the active sheet tab name
   - "row": the integer row number shown in the left margin
   - "column": the column letter shown in the top header
   - "value": the EXACT text or number displayed in the cell
   - "data_type": one of "number", "text", "date", "currency", "percentage", "empty"

5. **Save to disk IMMEDIATELY** before reading the next photo:
   ```bash
   python3 << 'PYEOF'
   import json
   data = [
       # paste your extracted cells here as Python dicts
   ]
   with open("{extraction_dir}/{photo_name}_cells.json", "w") as f:
       json.dump(data, f, indent=2)
   print(f"Saved {len(data)} cells to {extraction_dir}/{photo_name}_cells.json")
   PYEOF
   ```

6. **Confirm** by printing: "Saved {N} cells from {photo_name}"

## CRITICAL RULES — READ CAREFULLY

- **Read the ACTUAL column letters from the photo.** Look at the spreadsheet's column
  header bar (A, B, C, D, E, F, G... shown at the very top of the spreadsheet area).
  Map every cell to its REAL column letter. Never guess columns — always read them.
- **Read the ACTUAL row numbers from the photo.** Look at the spreadsheet's row number
  gutter (1, 2, 3, 4... shown on the left margin). Map every cell to its REAL row number.
  Never count rows sequentially — always read the number from the margin.
- **Recreate ALL column header names.** The first step for any photo is to extract the
  column headers (the row that contains labels like "Post", "COST ELEMENT", "Budget",
  "Reestimate", etc.). These headers define what data belongs in each column.
- **Double-check every value against its column header.** After extracting a cell, verify:
  1. The column letter is correct by tracing up from the cell to the column header bar.
  2. The value makes sense under that column's header (e.g., a number should be under
     "Budget", not under "COST ELEMENT"; text descriptions should be under "Description"
     or "COST ELEMENT", not under a numeric column).
  3. The data_type matches (numbers under numeric columns, text under text columns,
     dates under date columns, percentages under % columns).
- **Extract ALL visible numbers** — every cost, quantity, unit price, total, percentage.
  These numerical values are the MOST IMPORTANT part of the extraction.
- **Use exact values as displayed**: "1,234,567" not "1234567", "15.5%" not "0.155"
- **Do NOT summarize.** Do NOT write prose descriptions like "cost data follows".
  Write the actual cell value for every single cell.
- **Do NOT skip cells** because they seem repetitive or unimportant.
- **Save EACH photo's JSON to disk BEFORE reading the next photo.** This is mandatory
  for checkpoint/resume. If you read all photos first and save later, a timeout loses
  everything.
- If a value is hard to read, use "UNCERTAIN: <best guess>" as the value.

## Cell Mapping Procedure (mandatory for every photo)

Follow this exact sequence for each photo:

1. **Read column letters** — Look at the column header bar at the top of the spreadsheet.
   List every visible column letter (e.g., "Visible columns: A, B, C, D, E, F, G, H, I, J, K, L").

2. **Read row numbers** — Look at the row number gutter on the left margin.
   Note the first and last visible row (e.g., "Visible rows: 3 through 22").

3. **Extract column headers** — Find the header row (usually the first row with bold
   text labels). For each column, record the header text:
   ```
   A=Post, B=COST ELEMENT, C=(empty), D=Budget, E=Reestimate, F=Budget with allowance, ...
   ```

4. **Extract data cells** — For each data row, trace each cell UP to its column letter
   and verify it aligns with the correct header. Record the cell.

5. **Validation pass** — Review all extracted cells and check:
   - Is every number under a numeric column header? (Budget, Reestimate, Total, etc.)
   - Is every text string under a text column header? (COST ELEMENT, Description, etc.)
   - Are the row numbers consistent with what's visible in the left margin?
   - If anything looks misaligned, re-read the photo and fix the mapping.

## Example output for one photo

For a photo showing rows 5-8, columns A-L on the "Breakdown" sheet:
```json
[
  {"sheet": "Breakdown", "row": 5, "column": "A", "value": "1", "data_type": "number"},
  {"sheet": "Breakdown", "row": 5, "column": "B", "value": "PR", "data_type": "text"},
  {"sheet": "Breakdown", "row": 5, "column": "C", "value": "1.1", "data_type": "text"},
  {"sheet": "Breakdown", "row": 5, "column": "H", "value": "CTS Management", "data_type": "text"},
  {"sheet": "Breakdown", "row": 5, "column": "I", "value": "1", "data_type": "number"},
  {"sheet": "Breakdown", "row": 5, "column": "J", "value": "Nr", "data_type": "text"},
  {"sheet": "Breakdown", "row": 5, "column": "K", "value": "1,456,000", "data_type": "number"},
  {"sheet": "Breakdown", "row": 5, "column": "L", "value": "1,456,000", "data_type": "number"},
  {"sheet": "Breakdown", "row": 6, "column": "A", "value": "2", "data_type": "number"},
  {"sheet": "Breakdown", "row": 6, "column": "H", "value": "Project Director", "data_type": "text"},
  {"sheet": "Breakdown", "row": 6, "column": "K", "value": "890,000", "data_type": "number"},
  {"sheet": "Breakdown", "row": 6, "column": "L", "value": "890,000", "data_type": "number"}
]
```

A typical photo of a dense spreadsheet should produce 30-100+ cell entries.
If you extract fewer than 15 cells from a photo that clearly shows data, you are
missing values — go back and re-read the photo more carefully.
```

### 4c. Verify Each Batch

After each batch of agents returns, verify that JSONs were saved:

```bash
for photo in <batch_photos>; do
  if [ -f "<extraction_dir>/${photo%.jpg}_cells.json" ]; then
    echo "✅ $photo — $(python3 -c "import json; print(len(json.load(open('<extraction_dir>/${photo%.jpg}_cells.json'))))")"
  else
    echo "❌ $photo — MISSING"
  fi
done
```

If any JSONs are missing, re-run extraction for those specific photos before proceeding.

### 4d. Handle Overlapping Regions

When the same cell appears in multiple photos (overlapping coverage):
1. Compare the extracted values from each photo.
2. If they match, use the value as-is.
3. If they differ, prefer the value from the photo where the cell is more centrally positioned (less edge distortion).
4. Record discrepancies for user review.

This deduplication happens automatically in Stage 5a when reading all JSONs — later extractions overwrite earlier ones for the same cell, and UNCERTAIN values are always overwritten by confident values.

### 4e. Report Extraction Summary

After ALL batches for a file group are complete, print:
```
Extraction Summary: <filename>
  Photos processed: N / M total
  Total cells extracted: N
  Uncertain values: N (flagged for review)
  Average cells per photo: N
```

**Quality check:** If average cells per photo is below 20, warn that extraction may be too shallow and offer to re-extract.

Print the progress checklist (Stage 4 🔄 with per-file status).

---

## Stage 5 — Excel Creation & Verification

**Goal:** Create the Excel file from extracted data and verify it matches the photos.

For each file group:

### 5a. Verify Extraction Completeness

Before creating the Excel, verify that extraction is adequate:

```bash
python3 << 'PYEOF'
import os, json, glob
extraction_dir = "<input-dir>/_output/extraction/<filename>/"
json_files = sorted(glob.glob(os.path.join(extraction_dir, "*_cells.json")))
total_cells = 0
for jf in json_files:
    with open(jf) as f:
        total_cells += len(json.load(f))
avg = total_cells / len(json_files) if json_files else 0
print(f"Extraction coverage: {len(json_files)} photos processed, {total_cells} total cells")
print(f"Average cells per photo: {avg:.1f}")
if avg < 20:
    print("WARNING: Average cells per photo is low — extraction may be too shallow")
PYEOF
```

If fewer than 80% of photos have JSONs, use `AskUserQuestion` to warn:
- "Only N/M photos were extracted ({pct}%). Re-extract missing photos before creating Excel?"
- Options: "Re-extract missing", "Proceed anyway"

### 5b. Create Excel File

Use `Bash` to run inline Python that creates the Excel file:

```bash
python3 << 'PYEOF'
import json, glob, os, re
from openpyxl import Workbook
from openpyxl.utils import get_column_letter, column_index_from_string

# Read all extraction JSONs for this file
extraction_dir = "<input-dir>/_output/extraction/<filename>/"
all_cells = {}  # {sheet_name: {(row, col): {value, data_type, ...}}}

for json_file in sorted(glob.glob(os.path.join(extraction_dir, "*_cells.json"))):
    with open(json_file) as f:
        cells = json.load(f)
    for cell in cells:
        sheet = cell.get("sheet", "Sheet1")
        key = (cell["row"], cell["column"])
        if sheet not in all_cells:
            all_cells[sheet] = {}
        # Prefer later extractions for overlaps (or use centrality logic)
        if key not in all_cells[sheet] or "UNCERTAIN" in str(all_cells[sheet][key].get("value", "")):
            all_cells[sheet][key] = cell

# Create workbook
wb = Workbook()
wb.remove(wb.active)  # Remove default sheet

for sheet_name in sorted(all_cells.keys()):
    ws = wb.create_sheet(title=sheet_name)
    for (row, col_letter), cell_data in all_cells[sheet_name].items():
        value = cell_data["value"]
        dtype = cell_data.get("data_type", "text")

        # Type conversion
        if dtype == "empty" or value == "" or value is None:
            continue
        elif dtype == "number":
            # Remove thousand separators, convert to float/int
            clean = str(value).replace(",", "").replace(" ", "")
            try:
                value = int(clean) if "." not in clean else float(clean)
            except ValueError:
                pass
        elif dtype == "percentage":
            clean = str(value).replace("%", "").replace(",", "").strip()
            try:
                value = float(clean) / 100
                ws[f"{col_letter}{row}"].number_format = '0.0%'
            except ValueError:
                pass
        elif dtype == "currency":
            # Strip currency symbols, keep as number
            clean = re.sub(r'[^0-9.,\-]', '', str(value)).replace(",", "")
            try:
                value = float(clean)
                ws[f"{col_letter}{row}"].number_format = '#,##0.00'
            except ValueError:
                pass

        ws[f"{col_letter}{row}"] = value

    # Auto-adjust column widths
    for col_cells in ws.columns:
        max_length = 0
        col_letter_adj = get_column_letter(col_cells[0].column)
        for c in col_cells:
            if c.value:
                max_length = max(max_length, len(str(c.value)))
        ws.column_dimensions[col_letter_adj].width = min(max_length + 2, 50)

output_path = "<input-dir>/_output/output/<filename>"
os.makedirs(os.path.dirname(output_path), exist_ok=True)
wb.save(output_path)
print(f"Created: {output_path}")
print(f"Sheets: {wb.sheetnames}")
print(f"Total cells written: {sum(len(cells) for cells in all_cells.values())}")
PYEOF
```

### 5c. Verify Against Extraction Data

Use `Bash` to run inline Python that reads back the created Excel and compares against the extraction JSONs:

```bash
python3 << 'PYEOF'
import json, glob, os
from openpyxl import load_workbook

wb = load_workbook("<input-dir>/_output/output/<filename>")
extraction_dir = "<input-dir>/_output/extraction/<filename>/"

total = 0
matches = 0
mismatches = []

for json_file in sorted(glob.glob(os.path.join(extraction_dir, "*_cells.json"))):
    with open(json_file) as f:
        cells = json.load(f)
    for cell in cells:
        if cell.get("data_type") == "empty":
            continue
        sheet = cell.get("sheet", "Sheet1")
        if sheet not in wb.sheetnames:
            continue
        ws = wb[sheet]
        excel_val = ws[f"{cell['column']}{cell['row']}"].value
        total += 1
        if str(excel_val) == str(cell["value"]) or excel_val == cell["value"]:
            matches += 1
        else:
            mismatches.append(f"  {sheet}!{cell['column']}{cell['row']}: photo='{cell['value']}' excel='{excel_val}'")

match_pct = (matches / total * 100) if total > 0 else 0
print(f"Verification: {matches}/{total} cells match ({match_pct:.1f}%)")
if mismatches:
    print(f"Mismatches ({len(mismatches)}):")
    for m in mismatches[:20]:
        print(m)
    if len(mismatches) > 20:
        print(f"  ... and {len(mismatches) - 20} more")
PYEOF
```

### 5d. Export CSV Copy

In addition to the .xlsx file, create a CSV copy of each sheet for easy import into Google Sheets:

```bash
python3 << 'PYEOF'
import csv, os
from openpyxl import load_workbook

xlsx_path = "<input-dir>/_output/output/<filename>"
wb = load_workbook(xlsx_path)

for ws in wb.worksheets:
    csv_path = xlsx_path.replace('.xlsx', f'_{ws.title}.csv')
    with open(csv_path, 'w', newline='', encoding='utf-8') as f:
        writer = csv.writer(f)
        for row in ws.iter_rows(values_only=True):
            writer.writerow(row)
    print(f"CSV: {csv_path}")
PYEOF
```

### 5e. Commit, Push & Provide Download Links

Commit and push the created Excel and CSV files so the user can download from GitHub:

```bash
git add "<input-dir>/_output/output/<filename>"
git commit -m "Add recreated Excel: <filename>"
git push -u origin <current-branch>
```

Then use the GitHub MCP tool `mcp__github__get_file_contents` to retrieve the file's **`download_url`** from the API response:

```
mcp__github__get_file_contents(owner, repo, path="<path-to-file>", ref="refs/heads/<branch>")
```

The API response includes a `download_url` field — this is an authenticated URL that works even for private repos. Present it to the user:

```
- [<filename>](<download_url>) (N KB)
```

**Important:** Never construct `raw.githubusercontent.com` URLs manually — they don't work for private repos. Always use the `download_url` from the GitHub API response.

### 5e. User Approval

Use `AskUserQuestion`:
- "Created `<filename>` with N sheets and M cells. Verification: X% match. Download it from the link above. OK to proceed?"
- Options: "Looks good — proceed", "Re-extract this file", "Skip this file"

If the user wants re-extraction, go back to Stage 4 for this file group. If skip, move on.

Print the progress checklist (Stage 5 ✅ for current file).

---

## Stage 6 — Iterate All Files

**Goal:** Process all file groups through Stages 4–5 sequentially, using the batch extraction loop from the Scaling Strategy.

For each file group identified in Stage 1:

1. Print the progress checklist showing which file is current.
2. **Check for existing extraction data** (checkpoint resume — see Stage 4a).
3. **Run Stage 4 in batches** following the Scaling Strategy:
   - Divide un-extracted photos into batches of 3–5.
   - Launch 2–3 parallel agents per round, each processing one batch.
   - After each round, verify JSONs were saved (Stage 4c).
   - Repeat until all photos for this file group are extracted.
4. Run Stage 5 (Excel Creation & Verification) for this file group.
5. Get user approval before moving to the next file.

Track per-file and per-batch status in the checklist:
```
 🔄  Stage 6 — Iterate All Files
      ✅  Budget-2025.xlsx (3 sheets, 2,450 cells)
      🔄  Sales-Report.xlsx  ← batch 3/7 (15/35 photos extracted)
      ⬜  Cost-Data.xlsx
```

**Critical:** Do NOT process multiple file groups in parallel — each needs user approval before continuing. But DO process photo batches within a file group in parallel.

After all files are processed, print the progress checklist (Stage 6 ✅).

---

## Stage 7 — Present Final Product

**Goal:** Show the user all created Excel files and get approval before formula detection.

### 7a. Summary

Print a summary table:
```
─────────────────────────────────────────
 Completed Excel Files
─────────────────────────────────────────
 File                    Sheets  Cells  Confidence
 Budget-2025.xlsx        3       450    98.2%
 Sales-Report.xlsx       2       280    99.5%
─────────────────────────────────────────
```

### 7b. Provide Download Links

Ensure all files have been committed and pushed to the current branch (if not already done in Stage 5d).

For each Excel file, use `mcp__github__get_file_contents` to get the `download_url` from the API. Present them as clickable links:

```
- [<filename1>](<download_url1>) (N KB, M sheets)
- [<filename2>](<download_url2>) (N KB, M sheets)
```

**Important:** Always use the `download_url` from the GitHub API — never construct `raw.githubusercontent.com` URLs manually (they fail for private repos).

### 7c. User Approval

Use `AskUserQuestion`:
- "All Excel files have been created (values only, no formulas yet). Review the files at the links above. Ready to proceed to formula detection?"
- Options: "Proceed to formula detection", "Re-extract a specific file", "Done — skip formula detection"

If the user wants to re-extract, ask which file and go back to Stage 4 for that file.
If the user wants to skip formula detection, jump to Stage 9.

Print the progress checklist (Stage 7 ✅).

---

## Stage 8 — Formula Recreation (Opus 1M)

**Goal:** Analyze relationships between cell values across all files and infer the original Excel formulas. This stage uses the Opus 1M context model for deep cross-file analysis.

### 8a. Prepare Cell Data

Use `Bash` to run inline Python that serializes all cell values from all created Excel files into a structured text format:

```bash
python3 << 'PYEOF'
import os
from openpyxl import load_workbook

output_dir = "<input-dir>/_output/output/"
all_data = []

for fname in sorted(os.listdir(output_dir)):
    if not fname.endswith(".xlsx"):
        continue
    wb = load_workbook(os.path.join(output_dir, fname), data_only=True)
    all_data.append(f"\n{'='*60}")
    all_data.append(f"FILE: {fname}")
    all_data.append(f"{'='*60}")
    for sheet_name in wb.sheetnames:
        ws = wb[sheet_name]
        all_data.append(f"\n--- SHEET: {sheet_name} ---")
        all_data.append(f"Dimensions: {ws.dimensions}")
        # Header row
        for row in ws.iter_rows(min_row=1, max_row=ws.max_row, values_only=False):
            row_data = []
            for cell in row:
                cell_ref = f"{cell.column_letter}{cell.row}"
                val = cell.value if cell.value is not None else ""
                row_data.append(f"{cell_ref}={val}")
            all_data.append(" | ".join(row_data))

result = "\n".join(all_data)
with open("<input-dir>/_output/all_cell_data.txt", "w") as f:
    f.write(result)
print(f"Serialized {len(all_data)} lines of cell data")
PYEOF
```

### 8b. Spawn Opus 1M Agent

Read the serialized cell data file using `Read`, then spawn an `Agent` with `model: "opus"`:

**Agent prompt:**

```
You are an Excel formula reconstruction expert. You have been given the cell values
from multiple Excel spreadsheets that were extracted from photographs. The original
formulas are lost — only the computed/displayed values remain.

Your task: analyze the numerical relationships between cells and identify which cells
likely contained formulas rather than static values.

## Input Data

<paste all_cell_data.txt content here>

## Instructions

For each cell that likely contains a formula:

1. Identify the cell (file, sheet, cell reference)
2. Propose the most likely Excel formula
3. Verify the formula produces the observed value
4. Rate confidence:
   - HIGH: mathematically certain (e.g., cell is exact SUM of cells above it)
   - MEDIUM: strong pattern match (e.g., consistent percentage calculation across rows)
   - LOW: plausible but uncertain (e.g., could be a formula or a manually entered value)

## Common Patterns to Look For

- SUM/SUBTOTAL of ranges (especially bottom-of-column totals, right-of-row totals)
- AVERAGE, COUNT, MIN, MAX
- Percentage calculations (value / total * 100)
- VLOOKUP/INDEX-MATCH between sheets or files
- Date arithmetic
- IF/conditional logic (look for binary or categorical results)
- Cumulative/running totals
- Year-over-year or period-over-period calculations
- Cross-sheet references (one sheet referencing another)
- Cross-file references (if multiple files share dimensions like dates, categories, or IDs)
- Markup/margin calculations (cost * factor = price)
- Weighted averages

## Output Format

Return a JSON array. Each element:
{
  "file": "<filename>",
  "sheet": "<sheet_name>",
  "cell": "<cell_reference, e.g. D15>",
  "formula": "<proposed Excel formula, e.g. =SUM(D2:D14)>",
  "computed_value": "<the value currently in the cell>",
  "confidence": "HIGH|MEDIUM|LOW",
  "reasoning": "<brief explanation of why this is likely a formula>"
}

Be thorough but precise. Only include cells where you have genuine evidence of a formula.
Do not guess formulas for cells that are clearly static data (names, labels, dates entered manually).
```

### 8c. Apply Formulas

After the Agent returns, parse the JSON result.

**For HIGH and MEDIUM confidence formulas:**
Use `Bash` to run inline Python that updates the Excel files:

```bash
python3 << 'PYEOF'
import json
from openpyxl import load_workbook

formulas = json.loads('''<agent_result_json>''')

# Group by file
by_file = {}
for f in formulas:
    by_file.setdefault(f["file"], []).append(f)

for filename, file_formulas in by_file.items():
    path = f"<input-dir>/_output/output/{filename}"
    wb = load_workbook(path)

    applied = 0
    for f in file_formulas:
        if f["confidence"] in ("HIGH", "MEDIUM"):
            if f["sheet"] in wb.sheetnames:
                ws = wb[f["sheet"]]
                ws[f["cell"]] = f["formula"]
                applied += 1

    wb.save(path)
    print(f"{filename}: applied {applied} formulas")

PYEOF
```

**For LOW confidence formulas:**
Present them to the user via `AskUserQuestion`:
- "These formulas have low confidence. Select which to include:"
- List each with cell reference, proposed formula, and reasoning.
- Use `multiSelect: true` so the user can pick individual ones.

Apply the user-approved LOW confidence formulas using the same Python approach.

### 8d. Verify Formulas

Use `Bash` to run inline Python that opens each file and checks that formula cells still produce values consistent with the originals (using openpyxl's formula evaluation where possible, or by comparing against the extraction data).

Print a summary:
```
Formula Summary:
  Total formulas detected: N
  HIGH confidence: N (all applied)
  MEDIUM confidence: N (all applied)
  LOW confidence: N (M approved by user, K skipped)
```

Print the progress checklist (Stage 8 ✅).

---

## Stage 9 — Final Output

**Goal:** Present the final Excel files with formulas to the user.

### 9a. Commit & Push Final Files

Commit and push all final files (with formulas applied, if any) to the current branch:

```bash
git add "<input-dir>/_output/output/"
git commit -m "Finalize recreated Excel files with formulas"
git push -u origin <current-branch>
```

### 9b. Final Summary

Use `mcp__github__get_file_contents` to get the `download_url` for each file. Then print:
```
─────────────────────────────────────────
 Spreadsheet Photo Organizer — Complete
─────────────────────────────────────────

 Files Created:
   <filename1> — N sheets, M cells, K formulas
   <filename2> — N sheets, M cells, K formulas

 Download Links:
   - [<filename1>](<download_url1>) (N KB)
   - [<filename2>](<download_url2>) (N KB)

 Output Directory: <input-dir>/_output/output/

 Workspace:
   _output/sorted/     — photos grouped by file
   _output/extraction/  — raw cell extraction JSONs
   _output/output/      — final Excel files
   _output/manifest.json — processing metadata
─────────────────────────────────────────
```

### 9c. Final Approval

Use `AskUserQuestion`:
- "All files are ready with formulas applied. Download them from the link above. Anything else needed?"
- Options: "Looks great — done!", "Re-do formula detection", "Re-extract a specific file"

Print the final progress checklist with all stages ✅.

---

## Error Handling

- **Corrupt/unreadable photos:** Skip the photo, report to the user which photo could not be read, and continue with remaining photos. Do not fail the entire process.
- **openpyxl installation failure:** Stop immediately and tell the user to install manually.
- **Empty extraction (no cells found in a photo):** Retry once with a more specific prompt (e.g., focus on a smaller region). If still empty, skip the photo and report.
- **Python script failures:** Show the full error output and ask the user for guidance via `AskUserQuestion`.
- **Rate limit errors:** Follow the 60s → 120s → 240s retry backoff pattern. After 3 failed retries, stop and report which stage/photo failed and what was saved so far.
- **Incremental saves:** All extraction JSONs are saved per-photo immediately. If the process is interrupted, the extraction data is preserved.
- **git push failures:** If `git push` fails due to network errors, retry up to 4 times with exponential backoff (2s, 4s, 8s, 16s). If still failing, fall back to printing the local file path and tell the user to download manually.
- **Agent (Opus 1M) failure:** If the formula detection agent fails or returns unparseable output, skip formula detection and present the values-only files as the final output.

---

## Behaviour Rules

- **Copy, never move** original photos. The originals must remain untouched in the input directory.
- **Never fabricate cell values.** If a cell cannot be read clearly, mark it as `UNCERTAIN: <best guess>` and flag for user review. Never silently invent a value.
- **Label inferences clearly.** Any value that is inferred rather than directly read must be flagged.
- **Get user approval at every checkpoint.** Never skip the `AskUserQuestion` gates at Stages 5d, 7c, 8c (LOW confidence), and 9c.
- **Process file groups sequentially.** Because each file needs user approval, do not process multiple files in parallel.
- **Save incrementally.** Write each extraction JSON to disk immediately after extraction — never hold results only in memory.
- **Update manifest.json** after each stage for resumability.
- **Sanitize filenames** for directory names — remove characters that are invalid in file paths (`/`, `\`, `:`, `*`, `?`, `"`, `<`, `>`, `|`).
- **Respect the user's skip decisions.** If the user skips a file or skips formula detection, do not re-ask.
- **Use GitHub API for download links.** Always use `mcp__github__get_file_contents` to get the `download_url` — never construct `raw.githubusercontent.com` URLs manually (they fail for private repos) and never use `github.com/blob/` links (those serve HTML pages).
- **Never spawn an agent for more than 10 photos.** Large batches cause timeouts and total loss of extraction work. Use the Scaling Strategy.
- **Save extraction JSONs per-photo, immediately.** Each photo's cells must be written to a `_cells.json` file before reading the next photo. Never hold extraction results only in memory.
