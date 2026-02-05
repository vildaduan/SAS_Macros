# Clinical Data Analysis: Subject Demographics (Safety Population)

## Project Overview
This repository contains a SAS-based clinical reporting program designed to generate a **Subject Demographics Table** (Sex and Race) using the **Safety Population**. This project simulates a standard clinical trial deliverable for the study drug **Xanomeline**.

## Technical Skills Demonstrated
* **CDISC Standards:** Implementation of ADaM (Analysis Data Model) standards using `ADSL` datasets.
* **SAS Macro Language:** Dynamic generation of population counts (Big N) using `PROC SQL` into macro variables.
* **Advanced Data Manipulation:** * Data cleaning and transformation using DATA steps.
    * Frequency analysis via `PROC FREQ`.
    * Data restructuring using `PROC TRANSPOSE`.
    * Iterative processing with `ARRAY` and `DO` loops for missing value imputation.
* **Professional Reporting:** Production of industry-standard RTF outputs using `PROC REPORT` and ODS (Output Delivery System).

---

## Program Logic Flow



1.  **Population Setup:** Filters the `ADSL` dataset for the Safety Population (`SAFFL="Y"`) and creates an "ALL" treatment group for comparative analysis.
2.  **Big N Calculation:** Calculates total subjects per treatment arm and stores them in macro variables (`&BIGN1` - `&BIGN4`) for use in table headers.
3.  **Statistical Calculation:** * Calculates frequency (n) and percentage (%) for Gender and Race.
    * Applies custom ordering (`MAINOD`, `OD`) to ensure the table follows a logical clinical structure.
4.  **Data Transposition:** Converts the data from a "long" format to a "wide" format to align treatment groups as columns.
5.  **Final Reporting:** Uses `PROC REPORT` with custom ODS styles to generate a submission-ready `.rtf` file with headers, footnotes, and proper alignment.

---

## File Structure
* `Table Generation_Safety Population.sas`: The primary SAS script containing the analysis and reporting logic.
* `rtf.sas`: A supporting macro for RTF styling and formatting.
* `ADSL.sas7bdat`: (Assumed) Input ADaM dataset.


## Example Output Header
The program produces a report with the following structure:

| Category | Statistic | Placebo (N=XXX) | Drug Low (N=XXX) | Drug High (N=XXX) | All (N=XXX) |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Gender** | Male | n (%) | n (%) | n (%) | n (%) |
| | Female | n (%) | n (%) | n (%) | n (%) |
| **Race** | White | n (%) | n (%) | n (%) | n (%) |

---
## Author
**Vilda** *Clinical Data Programmer*
