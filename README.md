# MitoGraph-Contrib-RScripts

R scripts created to assist you to analyze and plot the data produced by MitoGraph [1]. Example of plot:

<img src="doc/All_metrics.png" width="auto" height="512" title="All metrics">

## How to run

Before running our scripts, make sure you have the R packages __igraph__, __ggplot2__, __reshape2__, __formattable__ and __RColorBrewer__ installed.

1. Open R, go to `File -> Source File` and select `CreateSummary.R`. R will ask for the folder where the `.gnet` files produced by MitoGraph are stored.

2. Add a column called _Condition_ in the file `output-summary.csv` created in the previous step and fill with the corresponding cell condition.

3. Run the code `CreatePlots.R`. R will ask again for the folder where the `.gnet` files produced by MitoGraph are stored.

## Examples

[1] - MitoGraph: https://github.com/vianamp/MitoGraph

[2] - Our paper
