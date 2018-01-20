# MitoGraph-Contrib-RScripts

R scripts created to assist you to analyze and plot the data produced by MitoGraph [1]. Example of plot:

<img src="doc/All_metrics.png" width="auto" height="512" title="All metrics">

## How to run

We recommend you to use <a href="https://www.rstudio.com/">R Studio</a> to run these scripts. Also, make sure you have the packages __igraph__, __ggplot2__, __reshape2__, __formattable__ and __RColorBrewer__ installed.

Run the script `CreateSummary.R` in R. Next add a column called _Condition_ in the file `output-summary.csv` and fill with the corresponding cell condition. Make sure to add this column in the 2nd column position. Finaly run the code `CreatePlots.R`.

## Examples

[1] - MitoGraph: https://github.com/vianamp/MitoGraph

[2] - Our paper
