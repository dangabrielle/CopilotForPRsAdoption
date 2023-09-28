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
| term                     | estimate       | std.error      | p.value        |
|--------------------------|----------------|----------------|----------------|
| treatment                | 0.0532         | 0.00289        | 3.08e-75       |
| reviewersTotalCount      | -0.00294       | 0.00203        | 1.48e-1        |
| reviewersComments        | 0.0139         | 0.00107        | 1.50e-38       |
| authorComments           | -0.0475        | 0.00161        | 4.48e-190      |
| commentsTotalCount       | NA             | NA             | NA             |
| additions                | -0.0000000625  | 0.0000000253   | 1.34e-2        |
| deletions                | 0.000000205    | 0.0000000527   | 9.96e-5        |
| prSize                   | NA             | NA             | NA             |
| commitsTotalCount        | -0.000532      | 0.0000551      | 4.25e-22       |
| changedFiles             | -0.000108      | 0.0000112      | 4.56e-22       |
| prExperience             | 0.0000609      | 0.00000368     | 1.71e-61       |
| bodyLength               | -0.00000301    | 0.000000102    | 2.03e-189      |
| purposeDocument          | 0.00139        | 0.00330        | 6.74e-1        |
| purposeFeature           | -0.0329        | 0.00369        | 4.88e-19       |
| repoLanguageC++          | 0.0541         | 0.0111         | 1.14e-6        |
| repoLanguageGo           | -0.00713       | 0.00786        | 3.64e-1        |
| repoLanguageJava         | 0.00374        | 0.0102         | 7.13e-1        |
| repoLanguageJavaScript   | 0.0430         | 0.00874        | 8.75e-7        |
| repoLanguageOther        | 0.0509         | 0.00795        | 1.59e-10       |
| repoLanguagePHP          | -0.0804        | 0.0115         | 2.89e-12       |
| repoLanguagePython       | -0.166         | 0.00847        | 1.73e-85       |
| repoLanguageRust         | 0.0511         | 0.00939        | 5.13e-8        |
| repoLanguageTypeScript   | 0.0231         | 0.00710        | 1.15e-3        |
| repoLanguageVue          | -0.0745        | 0.00996        | 8.00e-14       |
| forkCount                | 0.00000593     | 0.000000352    | 1.99e-63       |
| stargazerCount           | -0.00000533    | 0.000000150    | 6.16e-273      |
| repoAge                  | 0.0000149      | 0.00000150     | 3.51e-23       |
| isMember                 | 0.0755         | 0.00290        | 6.34e-149      |

