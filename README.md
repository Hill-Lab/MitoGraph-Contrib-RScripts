# MitoGraph-Contrib-RScripts

Here we provide an example dataset of mammalian cells and R scripts created to assist you to analyze and plot the data produced by <a href="https://github.com/vianamp/MitoGraph">MitoGraph</a>. Example of plot:

<p align="center">
  <img src="doc/All_metrics.png" width="auto" height="512" title="All metrics">
</p>

## Download

<a href="https://github.com/Hill-Lab/MitoGraph-Contrib-RScripts/archive/v1.0.zip">Click here to download our example dataset and R scripts</a>. We recommend you to unzip the file in your Desktop.

## How to Run MitoGraph on our example dataset

To execute MitoGraph on our test dataset, type the following command in the terminal of your Mac OS (spotlight + terminal):

```
cd ~/Desktop/MitoGraph
./MitoGraph -xy 0.1667 -z 0.2 -scales 1.0 1.3 4 -adaptive 10 -path ~/Desktop/MitoGraph-Contrib-RScripts-1.0/samples
```

## How to use our scripts

Before running our scripts, make sure you have __R__ & __R Studio__ (https://www.rstudio.com/products/rstudio/download/) installed in your system as well as the packages __igraph__, __ggplot2__, __reshape2__, __formattable__ and __RColorBrewer__ installed.

1. If you are using _R_, go to `File -> Source File` and select `CreateSummary.R`. If you are using __R Studio__, open the file `CreateSummary.R` and hit Shift + ⌘ + S.

2. The script will ask for folder where the `.gnet` files produced by MitoGraph are stored. Type `~/Desktop/MitoGraph-Contrib-RScripts-1.0/samples/` hit return.

3. Add a column called _Condition_ in the file `output-summary.csv` created in the previous step and fill with the corresponding cell condition.

4. If you are using _R_, go to `File -> Source File` and select `CreatePlots.R`. If you are using __R Studio__, open the file `CreatePlots.R` and hit Shift + ⌘ + S.

5. The script will ask for folder where the `.gnet` files produced by MitoGraph are stored. Type `~/Desktop/MitoGraph-Contrib-RScripts-1.0/samples/` and hit return.

## Output files

__CreateSummary.R output files:__ 
* output.csv
* output-summary.csv

__CreatePlots.R output files:__
* Plot1.eps: Avg edge length vs. Total Connected Components (normalized to total length (µm))

* Plot3.eps: Total edge # (normalized to total length (µm)) vs. Average Degree

* Plot5.eps: Total connected components (normalized to total length (µm) vs. PHI

* Plot7.eps: Avg mitochondrial width (µm) vs Volume from voxels (µm^3)

* AVG_SD_metrics.eps: Bar chart of all metrics collected (Avg±STDEV)

* All_metrics.eps: Box plot + Scatter overlay plot of all metrics collected 

* MitoGraph_Connectivity_score.eps: Box plot + Scatter overlay plot of the MitoGraph Connectivity Score

* AOV_stats_new.csv: Table of p-values 

## References: 

__R:__ R Core Team (2017). R: A language and environment for statistical computing. R Foundation for
  Statistical Computing, Vienna, Austria. URL https://www.R-project.org/.

__igraph:__ Csardi G, Nepusz T: The igraph software package for complex network research, InterJournal, Complex
  Systems 1695. 2006. http://igraph.org

__ggplot2:__ H. Wickham. ggplot2: Elegant Graphics for Data Analysis. Springer-Verlag New York, 2009.

__reshape2:__ Hadley Wickham (2007). Reshaping Data with the reshape Package. Journal of Statistical Software,
  21(12), 1-20. URL http://www.jstatsoft.org/v21/i12/.

__formattable:__ Kun Ren and Kenton Russell (2016). formattable: Create 'Formattable' Data Structures. R package
  version 0.2.0.1. https://CRAN.R-project.org/package=formattable

__RColorBrewer:__ Erich Neuwirth (2014). RColorBrewer: ColorBrewer Palettes. R package version 1.1-2.
  https://CRAN.R-project.org/package=RColorBrewer
