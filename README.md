# Research Artifact - Generative AI for Pull Request Descriptions: Adoption, Impact, and Developer Interventions


This is a research artifact for "**Generative AI for Pull Request Descriptions: Adoption,
Impact, and Developer Interventions**". The following three research questions were constructed to guide the study.

* RQ1: *To what extent do developers use Copilot for PRs in the code review process?*
* RQ2: *How are the code reviews affected by the use of Copilot for PRs?*
    * RQ2.1: *Is there a relationship between the use of Copilot for PRs and review time?*
    * RQ2.2: *Is there a relationship between the use of Copilot for PRs and the likelihood of a PR being merged?*
* RQ3: *How developers adopt the content suggested by Copilot?*
    * RQ3.1: *What kind of the supplementary information that complements the content suggested by Copilot?*
    * RQ3.2: *What kind of the content suggested by Copilot undergoes subsequent editing by developers?*

This artifact provides datasets, scripts, and other relevant material, structured as follows:

## Contents
- `Copilot_PRs.csv` - a list of PRs which is powered by Copilot
- `Non_Copilot_PRs.csv` - a list of PRs which is not powered by Copilot as the control group
- `LICENSE.md` - [CC0 1.0 Universal](https://creativecommons.org/publicdomain/zero/1.0/)
- `README.md` - this file
- `control_metrics.csv` - features of control group
- `treatment_metrics.csv` - features of treatment group
- `PMW_review.R` - R script for RQ2.1
- `PMW_merge.R` - R script for RQ2.2
- `edit_contents_developers_with_diff.csv` - editorial histories from PRs powered by Copilot
- `coded_sample.csv` - coded editorial histoies for RQ3
- `groundtruthbots.csv` - a list of bots from [Golzadeh et al.](https://doi.org/10.1145/3528228.3528406)