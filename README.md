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
- `Copilot_PRs.csv` - a list of PRs which is powered by Copilot for PRs
- `Non_Copilot_PRs.csv` - a list of PRs which is not powered by Copilot for PRs
- `LICENSE.md` - [CC0 1.0 Universal](https://creativecommons.org/publicdomain/zero/1.0/)
- `README.md` - this file
- `control_metrics.csv` - features of control group
- `treatment_metrics.csv` - features of treatment group
- `PMW_review.R` - R script for RQ2.1
- `PMW_merge.R` - R script for RQ2.2
- `edit_contents_developers_with_diff.csv` - revisions from PRs powered by Copilot for PRs
- `coded_sample.csv` - coded revisions for RQ3
- `groundtruthbots.csv` - a list of bots from [Golzadeh et al.](https://doi.org/10.1145/3528228.3528406)

## Appendix
Summaries of causal inference estimating the effect of Copilot for PRs for the likelihood of
a Pull Request being merged (RQ2.2)
| Term                   | Estimate       | Std.Error         | P.Value         |
|------------------------|----------------|-------------------|-----------------|
| treatment              | 0.0531         | 0.00289           | 3.80e-75        |
| reviewersTotalCount    | -0.00293       | 0.00203           | 1.49e-1         |
| reviewersComments      | 0.0139         | 0.00107           | 1.60e-38        |
| authorComments         | -0.0475        | 0.00161           | 6.01e-190       |
| commentsTotalCount     | NA             | NA                | NA              |
| additions              | -0.0000000630  | 0.0000000254      | 1.30e-2         |
| deletions              | 0.000000205    | 0.0000000527      | 1.02e-4         |
| prSize                 | NA             | NA                | NA              |
| commitsTotalCount      | -0.000532      | 0.0000550         | 4.03e-22        |
| changedFiles           | -0.000108      | 0.0000112         | 4.52e-22        |
| prExperience           | 0.0000610      | 0.00000368        | 1.67e-61        |
| bodyLength             | -0.00000301    | 0.000000102       | 1.31e-189       |
| purposeDocument        | 0.00136        | 0.00330           | 6.80e-1         |
| purposeFeature         | -0.0329        | 0.00369           | 4.71e-19        |
| repoLanguageC++        | 0.0541         | 0.0111            | 1.15e-6         |
| repoLanguageGo         | -0.00715       | 0.00786           | 3.63e-1         |
| repoLanguageJava       | 0.00366        | 0.0102            | 7.20e-1         |
| repoLanguageJavaScript | 0.0429         | 0.00874           | 9.04e-7         |
| repoLanguageOther      | 0.0509         | 0.00796           | 1.66e-10        |
| repoLanguagePHP        | -0.0804        | 0.0115            | 2.81e-12        |
| repoLanguagePython     | -0.166         | 0.00847           | 2.76e-85        |
| repoLanguageRust       | 0.0511         | 0.00939           | 5.23e-8         |
| repoLanguageTypeScript | 0.0231         | 0.00711           | 1.17e-3         |
| repoLanguageVue        | -0.0745        | 0.00997           | 7.89e-14        |
| forkCount              | 0.00000594     | 0.000000353       | 1.76e-63        |
| stargazerCount         | -0.00000533    | 0.000000150       | 5.37e-273       |
| repoAge                | 0.0000149      | 0.00000150        | 3.09e-23        |
| isMember               | 0.0755         | 0.00290           | 7.78e-149       |
