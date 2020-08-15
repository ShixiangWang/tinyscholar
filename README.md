
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tinyscholar

<!-- badges: start -->

<!-- badges: end -->

The goal of tinyscholar is to provide a simple way to get and show
Google scholar profile.

## Installation

You can install the released version of tinyscholar from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("tinyscholar")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("ShixiangWang/tinyscholar")
```

## Usage

Here I will use my profile as an example.

### Get Personal Profile

Firstly, you need to get your Google scholar ID from URL of your Google
scholar profile.

Then you can use function `tinyscholar()` to get the tidy data, which is
a list of two `data.frame` with added `profile` class.

``` r
library(tinyscholar)
profile <- tinyscholar("FvNp0NkAAAAJ")
str(profile, max.level = 1)
#> List of 2
#>  $ publications:'data.frame':    12 obs. of  5 variables:
#>  $ citations   :'data.frame':    4 obs. of  2 variables:
#>  - attr(*, "class")= chr [1:2] "ScholarProfile" "list"
```

You can use this data in your way. The following parts provide two
simple ways to show the profile.

### Show Table

Table is the best way to show the scholar profile. Tinyscholar uses
[gt](https://gt.rstudio.com/index.html) package to generate tables which
can be easily modified.

``` r
tb <- scholar_table(profile)
tb$citations
```

<!--html_preserve-->

<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#vjpxvijhzx .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#vjpxvijhzx .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#vjpxvijhzx .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#vjpxvijhzx .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#vjpxvijhzx .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#vjpxvijhzx .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#vjpxvijhzx .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#vjpxvijhzx .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#vjpxvijhzx .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#vjpxvijhzx .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#vjpxvijhzx .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#vjpxvijhzx .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#vjpxvijhzx .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#vjpxvijhzx .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#vjpxvijhzx .gt_from_md > :first-child {
  margin-top: 0;
}

#vjpxvijhzx .gt_from_md > :last-child {
  margin-bottom: 0;
}

#vjpxvijhzx .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#vjpxvijhzx .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#vjpxvijhzx .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#vjpxvijhzx .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#vjpxvijhzx .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#vjpxvijhzx .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#vjpxvijhzx .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#vjpxvijhzx .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#vjpxvijhzx .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#vjpxvijhzx .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#vjpxvijhzx .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#vjpxvijhzx .gt_left {
  text-align: left;
}

#vjpxvijhzx .gt_center {
  text-align: center;
}

#vjpxvijhzx .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#vjpxvijhzx .gt_font_normal {
  font-weight: normal;
}

#vjpxvijhzx .gt_font_bold {
  font-weight: bold;
}

#vjpxvijhzx .gt_font_italic {
  font-style: italic;
}

#vjpxvijhzx .gt_super {
  font-size: 65%;
}

#vjpxvijhzx .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>

<div id="vjpxvijhzx" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">

<table class="gt_table">

<thead class="gt_header">

<tr>

<th colspan="2" class="gt_heading gt_title gt_font_normal" style>

Citations

</th>

</tr>

<tr>

<th colspan="2" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>

</th>

</tr>

</thead>

<thead class="gt_col_headings">

<tr>

<th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">

when

</th>

<th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">

count

</th>

</tr>

</thead>

<tbody class="gt_table_body">

<tr>

<td class="gt_row gt_left">

total

</td>

<td class="gt_row gt_center">

113

</td>

</tr>

<tr>

<td class="gt_row gt_left">

2018

</td>

<td class="gt_row gt_center">

1

</td>

</tr>

<tr>

<td class="gt_row gt_left">

2019

</td>

<td class="gt_row gt_center">

33

</td>

</tr>

<tr>

<td class="gt_row gt_left">

2020

</td>

<td class="gt_row gt_center">

77

</td>

</tr>

</tbody>

<tfoot class="gt_sourcenotes">

<tr>

<td class="gt_sourcenote" colspan="2">

<strong>Update</strong>: 2020-08-15

</td>

</tr>

</tfoot>

</table>

</div>

<!--/html_preserve-->

``` r
tb$publications
```

<!--html_preserve-->

<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#uypbpdvuve .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#uypbpdvuve .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#uypbpdvuve .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#uypbpdvuve .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#uypbpdvuve .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#uypbpdvuve .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#uypbpdvuve .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#uypbpdvuve .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#uypbpdvuve .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#uypbpdvuve .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#uypbpdvuve .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#uypbpdvuve .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#uypbpdvuve .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#uypbpdvuve .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#uypbpdvuve .gt_from_md > :first-child {
  margin-top: 0;
}

#uypbpdvuve .gt_from_md > :last-child {
  margin-bottom: 0;
}

#uypbpdvuve .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#uypbpdvuve .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#uypbpdvuve .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#uypbpdvuve .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#uypbpdvuve .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#uypbpdvuve .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#uypbpdvuve .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#uypbpdvuve .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#uypbpdvuve .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#uypbpdvuve .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#uypbpdvuve .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#uypbpdvuve .gt_left {
  text-align: left;
}

#uypbpdvuve .gt_center {
  text-align: center;
}

#uypbpdvuve .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#uypbpdvuve .gt_font_normal {
  font-weight: normal;
}

#uypbpdvuve .gt_font_bold {
  font-weight: bold;
}

#uypbpdvuve .gt_font_italic {
  font-style: italic;
}

#uypbpdvuve .gt_super {
  font-size: 65%;
}

#uypbpdvuve .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>

<div id="uypbpdvuve" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">

<table class="gt_table">

<thead class="gt_header">

<tr>

<th colspan="5" class="gt_heading gt_title gt_font_normal" style>

Publications

</th>

</tr>

<tr>

<th colspan="5" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>

</th>

</tr>

</thead>

<thead class="gt_col_headings">

<tr>

<th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">

title

</th>

<th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">

authors

</th>

<th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">

venue

</th>

<th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">

citations

</th>

<th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">

year

</th>

</tr>

</thead>

<tbody class="gt_table_body">

<tr>

<td class="gt_row gt_left">

APOBEC3B and APOBEC mutational signature as potential predictive markers
for immunotherapy response in non-small cell lung cancer

</td>

<td class="gt_row gt_left">

S Wang, M Jia, Z He, XS Liu

</td>

<td class="gt_row gt_left">

Oncogene 37 (29), 3924-3936, 2018

</td>

<td class="gt_row gt_left">

55

</td>

<td class="gt_row gt_left">

2018

</td>

</tr>

<tr>

<td class="gt_row gt_left">

Sex Differences in Cancer Immunotherapy Efficacy, Biomarkers, and
Therapeutic Strategy

</td>

<td class="gt_row gt_left">

S Wang, LA Cowley, XS Liu

</td>

<td class="gt_row gt_left">

Molecules 24 (18), 3214, 2019

</td>

<td class="gt_row gt_left">

19

</td>

<td class="gt_row gt_left">

2019

</td>

</tr>

<tr>

<td class="gt_row gt_left">

Antigen presentation and tumor immunogenicity in cancer immunotherapy
response prediction

</td>

<td class="gt_row gt_left">

S Wang, Z He, X Wang, H Li, XS Liu

</td>

<td class="gt_row gt_left">

eLife, 2019

</td>

<td class="gt_row gt_left">

17

</td>

<td class="gt_row gt_left">

2019

</td>

</tr>

<tr>

<td class="gt_row gt_left">

The predictive power of tumor mutational burden in lung cancer
immunotherapy response is influenced by patients’ sex

</td>

<td class="gt_row gt_left">

S Wang, J Zhang, Z He, K Wu, XS Liu

</td>

<td class="gt_row gt_left">

International journal of cancer 145 (10), 2840-2849, 2019

</td>

<td class="gt_row gt_left">

17

</td>

<td class="gt_row gt_left">

2019

</td>

</tr>

<tr>

<td class="gt_row gt_left">

The UCSCXenaTools R package: a toolkit for accessing genomics data from
UCSC Xena platform, from cancer multi-omics to single-cell RNA-seq

</td>

<td class="gt_row gt_left">

S Wang, XS Liu

</td>

<td class="gt_row gt_left">

Journal of Open Source Software 4 (40), 1627, 2019

</td>

<td class="gt_row gt_left">

4

</td>

<td class="gt_row gt_left">

2019

</td>

</tr>

<tr>

<td class="gt_row gt_left">

Can tumor mutational burden determine the most effective treatment for
lung cancer patients?

</td>

<td class="gt_row gt_left">

S Wang, Z He, X Wang, H Li, T Wu, X Sun, K Wu, XS Liu

</td>

<td class="gt_row gt_left">

Lung Cancer Management 8 (4), LMT21, 2020

</td>

<td class="gt_row gt_left">

1

</td>

<td class="gt_row gt_left">

2020

</td>

</tr>

<tr>

<td class="gt_row gt_left">

UCSCXenaShiny: an R package for exploring and analyzing UCSC Xena public
datasets in web browser

</td>

<td class="gt_row gt_left">

S Wang, Y Xiong, K Gu, L Zhao, Y Li, F Zhao, X Li, XS Liu

</td>

<td class="gt_row gt_left">

Preprints, 2020

</td>

<td class="gt_row gt_left">

0

</td>

<td class="gt_row gt_left">

2020

</td>

</tr>

<tr>

<td class="gt_row gt_left">

Copy number signature analyses in prostate cancer reveal distinct
etiologies and clinical outcomes

</td>

<td class="gt_row gt_left">

S Wang, H Li, M Song, Z He, T Wu, X Wang, Z Tao, K Wu, XS Liu

</td>

<td class="gt_row gt_left">

medRxiv, 2020

</td>

<td class="gt_row gt_left">

0

</td>

<td class="gt_row gt_left">

2020

</td>

</tr>

<tr>

<td class="gt_row gt_left">

Revisiting neoantigen depletion signal in the untreated cancer genome

</td>

<td class="gt_row gt_left">

S Wang, X Wang, T Wu, Z He, H Li, X Sun, XS Liu

</td>

<td class="gt_row gt_left">

BioRxiv, 2020

</td>

<td class="gt_row gt_left">

0

</td>

<td class="gt_row gt_left">

2020

</td>

</tr>

<tr>

<td class="gt_row gt_left">

Ras Downstream Effector GGCT Alleviates Oncogenic Stress

</td>

<td class="gt_row gt_left">

Z He, S Wang, Y Shao, J Zhang, X Wu, Y Chen, J Hu, F Zhang, XS Liu

</td>

<td class="gt_row gt_left">

iScience 19, 256-266, 2019

</td>

<td class="gt_row gt_left">

0

</td>

<td class="gt_row gt_left">

2019

</td>

</tr>

<tr>

<td class="gt_row gt_left">

sigminer v1. 0.0

</td>

<td class="gt_row gt_left">

S Wang

</td>

<td class="gt_row gt_left">

</td>

<td class="gt_row gt_left">

0

</td>

<td class="gt_row gt_left">

0

</td>

</tr>

<tr>

<td class="gt_row gt_left">

sigminer: an easy-to-use and scalable toolkit for genomic alteration
signature analysis and visualization in R logo

</td>

<td class="gt_row gt_left">

S Wang

</td>

<td class="gt_row gt_left">

</td>

<td class="gt_row gt_left">

0

</td>

<td class="gt_row gt_left">

0

</td>

</tr>

</tbody>

<tfoot class="gt_sourcenotes">

<tr>

<td class="gt_sourcenote" colspan="5">

<strong>Update</strong>: 2020-08-15

</td>

</tr>

</tfoot>

</table>

</div>

<!--/html_preserve-->

### Show Plot

Similarly, you can show numeric data with ggplot2 package.

``` r
pl <- scholar_plot(profile)
pl$citations
```

<img src="man/figures/README-unnamed-chunk-4-1.png" width="100%" style="display: block; margin: auto;" />

``` r
pl$publications
```

<img src="man/figures/README-unnamed-chunk-4-2.png" width="100%" style="display: block; margin: auto;" />

## Similar R package

R package [scholar](https://cran.r-project.org/package=scholar) is a
more comprehensive package to get and visualize the Google scholar
profile. However, tinyscholar is lightweight and not limited in China.
