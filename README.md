# MitoGraph-Contrib-RScripts

R scripts created to assist you to analyze and plot the data produced by MitoGraph [1]. Example of plot:

<img src="doc/All_metrics.png" width="auto" height="512" title="All metrics">

## How to run

Before running our scripts, make sure you have the R packages __igraph__, __ggplot2__, __reshape2__, __formattable__ and __RColorBrewer__ installed.

1. If you are using _R_, go to `File -> Source File` and select `CreateSummary.R`. If you are using __R Studio__, open the file `CreateSummary.R` and hit Shift + ⌘ + S.

2. The script will ask for folder where the `.gnet` files produced by MitoGraph are stored. Type it and hit return.

3. Add a column called _Condition_ in the file `output-summary.csv` created in the previous step and fill with the corresponding cell condition.

4. If you are using _R_, go to `File -> Source File` and select `CreatePlots.R`. If you are using __R Studio__, open the file `CreatePlots.R` and hit Shift + ⌘ + S.

5. The script will ask for folder where the `.gnet` files produced by MitoGraph are stored. Type it and hit return.

## Examples

[1] - MitoGraph: https://github.com/vianamp/MitoGraph

[2] - Our paper
