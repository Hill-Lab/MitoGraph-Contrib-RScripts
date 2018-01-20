#
# Run with Command + Option + R
#

rm(list=ls())

library(igraph)

GnetsFolder <- readline(prompt="Folder containing .gnet files: ")

RawData <- NULL
Summary <- NULL

Gnets <- list.files(path = GnetsFolder, pattern = "\\.gnet$", ignore.case = TRUE, full.names = TRUE)

for (FileName in Gnets) {

  NameNoExtension = gsub(".gnet", "", FileName)

  # Raw Data
  G <- read.table(FileName, skip=1, col.names=c('Source','Target','Length'))
  G <- graph.data.frame(as.data.frame(G), directed=F)

  RawDataInst <- NULL
  List <- decompose(G)
  for (g in List) {
    RawDataInst <- rbind(RawDataInst, data.frame(FileName, vcount(g), ecount(g), sum(E(g)$Length)))
  }

  # Readable column names for RawData
  colnames(RawDataInst) <- c('FileName', 'Nodes', 'Edges','Length')

  # Sort components by size
  RawDataInst <- RawDataInst[order(RawDataInst$Length, decreasing=T),]

  # Summary Calculations of mito volume, nodes, edges and connected components
  MitoVals <- read.table(paste(NameNoExtension,'.mitograph',sep=''),sep = '\t', skip=1)

  TotalNodes <- vcount(G)
  TotalEdges <- ecount(G)
  TotalLength <- sum(E(G)$Length)
  
  ConnectedComponents = length(List)
  
  # PHI (Length of largest connected component / total length of connected components)
  PHI = max(RawDataInst$Length) / TotalLength
  
  # Average Edge Length (Total length of connected components / total edge #)
  AvgEdgeLength = TotalLength / TotalEdges
  
  # Total Edge Normalized to Total Length
  TotalEdgeNorm = TotalEdges / TotalLength
  
  # Total Node Normalized to Total Length
  TotalNodeNorm = TotalNodes / TotalLength
  
  # Total Connected Components Normalized to Total Length
  TotalCCNorm = ConnectedComponents / TotalLength
  
  # Display the degree distribution of the graph. I mean, the k-th element of the array
  # Pk gives the proportion of nodes with (k-1)-neighbours. Therefore, if you want the
  # proportion of free-ends in the graph, look at the 2nd element: Pk[2]. 
 
  Pk <- degree.distribution(G)
  FreeEnds = ifelse(is.na(Pk[2]), 0, Pk[2])
  ThreeWayJunct = ifelse(is.na(Pk[4]), 0, Pk[4])
  FourWayJunct = ifelse(is.na(Pk[5]), 0, Pk[5])
  
  # AVG Degree = sum_k (k * Pk) 
  AvgDegree = (FreeEnds * 1) + (ThreeWayJunct * 3) + (FourWayJunct * 4)
  
  # MitoGraph Connectivity Score
  MitoGraphCS = (PHI + AvgEdgeLength + AvgDegree) / (TotalNodeNorm + TotalEdgeNorm + TotalCCNorm)
  
  # Combine all columns
  SummaryInst = data.frame(
      "File_Name" = basename(FileName),
      "Total_Nodes" = TotalNodes,
      "Total_Edges" = TotalEdges,
      "Total_Length_um"= TotalLength,
      "Total_Connected_Components" = ConnectedComponents,
      "PHI" = PHI,
      "Avg_Edge_Length_um" = AvgEdgeLength,
      "Total_Edge_Norm_to_Length_um" = TotalEdgeNorm,
      "Total_Node_Norm_to_Length_um" = TotalNodeNorm,
      "Total_Connected_Components_Norm_to_Length_um" = TotalCCNorm,
      "Free_Ends" = FreeEnds,
      "three_way_junction" = ThreeWayJunct,
      "four_way_junction" = FourWayJunct,
      "Avg_Degree" = AvgDegree,
      "MitoGraph_Connectivity_Score" = MitoGraphCS,
      "Volume_from_voxels_um3" = as.numeric(MitoVals[1]),
      "Average_width_um" = as.numeric(MitoVals[2]),
      "Std_width_um" = as.numeric(MitoVals[3]),
      "Total_length_um" = as.numeric(MitoVals[4]),
      "Volume_from_length_um3" = as.numeric(MitoVals[5])
  )

  RawData <- rbind(RawData, RawDataInst)
  Summary <- rbind(Summary, SummaryInst)
  
}

Output <- paste(GnetsFolder,"/output.csv",sep='')
OutputSummary <- paste(GnetsFolder,"/output-summary.csv",sep='')

write.csv(RawData,file=Output, row.names = FALSE)  
write.csv(Summary,file=OutputSummary, row.names= FALSE)  
