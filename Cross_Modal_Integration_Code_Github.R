#This code is being shared to help with the problem of cross modal integration of data. The objective this code was developed to achieve was integrating published coordinates from resting state and task-based fMRI data to understand which regions active during a task are functionally connected at rest. 

#Assumed input - This code assumes that a review has been undertaken and coordinates reflecting either activation peaks, centers of gravity, or other neurological locations are organized in an excel sheet with an x, y, z structure. Ideally, there is one input from one modality (e.g., resting state fMRI), here referenced as a terminal seed, and multiple inputs from another modality (e.g., task-based fMRI).  



#Set working directory
setwd("/users/scottholmes/Desktop/ROI_data_project")

#Import required R packages and libraries
library(apcluster)
library(xlsx)
library(car)
library(scatterplot3d)
library(plot3D)
library(ggplot2)

#Read in data sets in x, y, z, formatting that includes data from both modalities in the same data sheet. Please note that coordinates can be in any atlas format.
L_ACC=read.xlsx("ROI_Coordinates_Strip.xlsx", sheetName="L_ACC", startRow=1, endRow=11)

#Set up data frame from excel sheet
L_ACC_DF=data.frame(L_ACC$MNI_ACC_X,L_ACC$MNI_ACC_Y,L_ACC$MNI_ACC_Z)

#Identify method of determining distance between points
dist(L_ACC_DF, method = "euclidean")

#Find number of clusters using affinity based propagation analysis

#Choose similarity metric (r) and input data

LA_clus <- apcluster(negDistMat(r=2),L_ACC_DF)
cat("affinity propogation optimal number of clusters:", length(LA_clus@clusters), "\n")

#Plot output of AP analysis
plot(LA_clus, L_ACC_DF)

#Print output of AP analysis to identify coordinate integration with clusters
LA_clus

#Choice of manually segregating clusters and filtering to determine the mean of each resulting x, y, and z. The below code found three clusters and has manually taken the coordinates from specific lines (e.g., 3,4,5) to find the mean center of a cluster (e.g., cluster 1)
LA_clus_1 <- L_ACC_DF[c(3,4,5),]
mean(LA_clus_1$L_ACC.MNI_ACC_X)
mean(LA_clus_1$L_ACC.MNI_ACC_Y)
mean(LA_clus_1$L_ACC.MNI_ACC_Z)

LA_clus_2 <- L_ACC_DF[c(1,2,6,7,9,10),]
mean(LA_clus_2$L_ACC.MNI_ACC_X)
mean(LA_clus_2$L_ACC.MNI_ACC_Y)
mean(LA_clus_2$L_ACC.MNI_ACC_Z)

LA_clus_3 <- L_ACC_DF[c(8),]
mean(LA_clus_3$L_ACC.MNI_ACC_X)
mean(LA_clus_3$L_ACC.MNI_ACC_Y)
mean(LA_clus_3$L_ACC.MNI_ACC_Z)
























R_ACC=read.xlsx("ROI_Coordinates_Strip.xlsx", sheetName="R_ACC", startRow=1, endRow=20)
R_ACC_DF=data.frame(R_ACC$MNI_ACC_X,R_ACC$MNI_ACC_Y,R_ACC$MNI_ACC_Z)


RA_clus <- apcluster(negDistMat(r=2),R_ACC_DF)
cat("affinity propogation optimal number of clusters:", length(RA_clus@clusters), "\n")
plot(RA_clus, R_ACC_DF)
RA_clus

RA_clus_1 <- R_ACC_DF[c(3,9),]

mean(RA_clus_1$R_ACC.MNI_ACC_X)
mean(RA_clus_1$R_ACC.MNI_ACC_Y)
mean(RA_clus_1$R_ACC.MNI_ACC_Z)

RA_clus_2 <- R_ACC_DF[c(1,2,4,5,6,7,8,10,16,19),]
mean(RA_clus_2$R_ACC.MNI_ACC_X)
mean(RA_clus_2$R_ACC.MNI_ACC_Y)
mean(RA_clus_2$R_ACC.MNI_ACC_Z)

RA_clus_3 <- R_ACC_DF[c(11,12,13,14,15,17,18),]
mean(RA_clus_3$R_ACC.MNI_ACC_X)
mean(RA_clus_3$R_ACC.MNI_ACC_Y)
mean(RA_clus_3$R_ACC.MNI_ACC_Z)


L_DLPFC=read.xlsx("ROI_Coordinates_Strip.xlsx", sheetName="L_DLPFC", startRow=1, endRow=61)
L_DLPFC_DF=data.frame(L_DLPFC$MNI_DLPFC_X,L_DLPFC$MNI_DLPFC_Y,L_DLPFC$MNI_DLPFC_Z)

LD_clus <- apcluster(negDistMat(r=2),L_DLPFC_DF)
cat("affinity propogation optimal number of clusters:", length(LD_clus@clusters), "\n")
plot(LD_clus, L_DLPFC_DF)
LD_clus


L_DLPFC_1 <- L_DLPFC_DF[c(1,2,3,4,8,9,12,21,23,25,27,32),]

mean(L_DLPFC_1$L_DLPFC.MNI_DLPFC_X)
mean(L_DLPFC_1$L_DLPFC.MNI_DLPFC_Y)
mean(L_DLPFC_1$L_DLPFC.MNI_DLPFC_Z)
sd(L_DLPFC_1$L_DLPFC.MNI_DLPFC_X)
sd(L_DLPFC_1$L_DLPFC.MNI_DLPFC_Y)
sd(L_DLPFC_1$L_DLPFC.MNI_DLPFC_Z)

L_DLPFC_2 <- L_DLPFC_DF[c(7,10,13,14,22,30,41),]

mean(L_DLPFC_2$L_DLPFC.MNI_DLPFC_X)
mean(L_DLPFC_2$L_DLPFC.MNI_DLPFC_Y)
mean(L_DLPFC_2$L_DLPFC.MNI_DLPFC_Z)
sd(L_DLPFC_2$L_DLPFC.MNI_DLPFC_X)
sd(L_DLPFC_2$L_DLPFC.MNI_DLPFC_Y)
sd(L_DLPFC_2$L_DLPFC.MNI_DLPFC_Z)

L_DLPFC_3 <- L_DLPFC_DF[c(5,15,16,17,18,19,20,24,28,29,34,38),]

mean(L_DLPFC_3$L_DLPFC.MNI_DLPFC_X)
mean(L_DLPFC_3$L_DLPFC.MNI_DLPFC_Y)
mean(L_DLPFC_3$L_DLPFC.MNI_DLPFC_Z)
sd(L_DLPFC_3$L_DLPFC.MNI_DLPFC_X)
sd(L_DLPFC_3$L_DLPFC.MNI_DLPFC_Y)
sd(L_DLPFC_3$L_DLPFC.MNI_DLPFC_Z)

L_DLPFC_4 <- L_DLPFC_DF[c(6,26,31,35,36,37,39,45,54),]

mean(L_DLPFC_4$L_DLPFC.MNI_DLPFC_X)
mean(L_DLPFC_4$L_DLPFC.MNI_DLPFC_Y)
mean(L_DLPFC_4$L_DLPFC.MNI_DLPFC_Z)
sd(L_DLPFC_4$L_DLPFC.MNI_DLPFC_X)
sd(L_DLPFC_4$L_DLPFC.MNI_DLPFC_Y)
sd(L_DLPFC_4$L_DLPFC.MNI_DLPFC_Z)

L_DLPFC_5 <- L_DLPFC_DF[c(44),]

mean(L_DLPFC_5$L_DLPFC.MNI_DLPFC_X)
mean(L_DLPFC_5$L_DLPFC.MNI_DLPFC_Y)
mean(L_DLPFC_5$L_DLPFC.MNI_DLPFC_Z)
sd(L_DLPFC_5$L_DLPFC.MNI_DLPFC_X)
sd(L_DLPFC_5$L_DLPFC.MNI_DLPFC_Y)
sd(L_DLPFC_5$L_DLPFC.MNI_DLPFC_Z)

L_DLPFC_6 <- L_DLPFC_DF[c(11,33,43,46,47,51,52,55),]

mean(L_DLPFC_6$L_DLPFC.MNI_DLPFC_X)
mean(L_DLPFC_6$L_DLPFC.MNI_DLPFC_Y)
mean(L_DLPFC_6$L_DLPFC.MNI_DLPFC_Z)
sd(L_DLPFC_6$L_DLPFC.MNI_DLPFC_X)
sd(L_DLPFC_6$L_DLPFC.MNI_DLPFC_Y)
sd(L_DLPFC_6$L_DLPFC.MNI_DLPFC_Z)

L_DLPFC_7 <- L_DLPFC_DF[c(40,42,48,49,50,53),] # Seed location

mean(L_DLPFC_7$L_DLPFC.MNI_DLPFC_X)
mean(L_DLPFC_7$L_DLPFC.MNI_DLPFC_Y)
mean(L_DLPFC_7$L_DLPFC.MNI_DLPFC_Z)
sd(L_DLPFC_7$L_DLPFC.MNI_DLPFC_X)
sd(L_DLPFC_7$L_DLPFC.MNI_DLPFC_Y)
sd(L_DLPFC_7$L_DLPFC.MNI_DLPFC_Z)

L_DLPFC_8 <- L_DLPFC_DF[c(56,57,58,59),]

mean(L_DLPFC_8$L_DLPFC.MNI_DLPFC_X)
mean(L_DLPFC_8$L_DLPFC.MNI_DLPFC_Y)
mean(L_DLPFC_8$L_DLPFC.MNI_DLPFC_Z)
sd(L_DLPFC_8$L_DLPFC.MNI_DLPFC_X)
sd(L_DLPFC_8$L_DLPFC.MNI_DLPFC_Y)
sd(L_DLPFC_8$L_DLPFC.MNI_DLPFC_Z)



R_DLPFC=read.xlsx("ROI_Coordinates_Strip.xlsx", sheetName="R_DLPFC", startRow=1, endRow=41)
R_DLPFC_DF=data.frame(R_DLPFC$MNI_DLPFC_X,R_DLPFC$MNI_DLPFC_Y,R_DLPFC$MNI_DLPFC_Z)

RD_clus <- apcluster(negDistMat(r=2),R_DLPFC_DF)
cat("affinity propogation optimal number of clusters:", length(RD_clus@clusters), "\n")
plot(RD_clus, R_DLPFC_DF)
RD_clus



R_DLPFC_1 <- R_DLPFC_DF[c(1),]

mean(R_DLPFC_1$R_DLPFC.MNI_DLPFC_X)
mean(R_DLPFC_1$R_DLPFC.MNI_DLPFC_Y)
mean(R_DLPFC_1$R_DLPFC.MNI_DLPFC_Z)
sd(R_DLPFC_1$R_DLPFC.MNI_DLPFC_X)
sd(R_DLPFC_1$R_DLPFC.MNI_DLPFC_Y)
sd(R_DLPFC_1$R_DLPFC.MNI_DLPFC_Z)

R_DLPFC_2 <- R_DLPFC_DF[c(2,13,14,15),]

mean(R_DLPFC_2$R_DLPFC.MNI_DLPFC_X)
mean(R_DLPFC_2$R_DLPFC.MNI_DLPFC_Y)
mean(R_DLPFC_2$R_DLPFC.MNI_DLPFC_Z)
sd(R_DLPFC_2$R_DLPFC.MNI_DLPFC_X)
sd(R_DLPFC_2$R_DLPFC.MNI_DLPFC_Y)
sd(R_DLPFC_2$R_DLPFC.MNI_DLPFC_Z)

R_DLPFC_3 <- R_DLPFC_DF[c(4,7,8,9,11,12,17,18,20,32,36,38),]

mean(R_DLPFC_3$R_DLPFC.MNI_DLPFC_X)
mean(R_DLPFC_3$R_DLPFC.MNI_DLPFC_Y)
mean(R_DLPFC_3$R_DLPFC.MNI_DLPFC_Z)
sd(R_DLPFC_3$R_DLPFC.MNI_DLPFC_X)
sd(R_DLPFC_3$R_DLPFC.MNI_DLPFC_Y)
sd(R_DLPFC_3$R_DLPFC.MNI_DLPFC_Z)


R_DLPFC_4 <- R_DLPFC_DF[c(3,5,6,10,16,19,21,23,26,28,33,35,37),] # Seed location

mean(R_DLPFC_4$R_DLPFC.MNI_DLPFC_X)
mean(R_DLPFC_4$R_DLPFC.MNI_DLPFC_Y)
mean(R_DLPFC_4$R_DLPFC.MNI_DLPFC_Z)
sd(R_DLPFC_4$R_DLPFC.MNI_DLPFC_X)
sd(R_DLPFC_4$R_DLPFC.MNI_DLPFC_Y)
sd(R_DLPFC_4$R_DLPFC.MNI_DLPFC_Z)

R_DLPFC_5 <- R_DLPFC_DF[c(22,24,25,27,29,30,31,34,39),]

mean(R_DLPFC_5$R_DLPFC.MNI_DLPFC_X)
mean(R_DLPFC_5$R_DLPFC.MNI_DLPFC_Y)
mean(R_DLPFC_5$R_DLPFC.MNI_DLPFC_Z)
sd(R_DLPFC_5$R_DLPFC.MNI_DLPFC_X)
sd(R_DLPFC_5$R_DLPFC.MNI_DLPFC_Y)
sd(R_DLPFC_5$R_DLPFC.MNI_DLPFC_Z)





###############################################
###############################################
###############################################
###############################################
###############################################
###############################################
###############################################



R_DLPFC_ADJ=read.xlsx("ROI_Coordinates_Strip.xlsx", sheetName="R_DLPFC", startRow=1, endRow=41)
R_DLPFC_DF_ADJ=data.frame(R_DLPFC_ADJ$MNI_DLPFC_X,R_DLPFC_ADJ$MNI_DLPFC_Y,R_DLPFC_ADJ$MNI_DLPFC_Z)

RD_clus_ADJ <- apcluster(negDistMat(r=2),R_DLPFC_DF_ADJ)
cat("affinity propogation optimal number of clusters:", length(RD_clus_ADJ@clusters), "\n")
plot(RD_clus_ADJ, R_DLPFC_DF_ADJ)
RD_clus_ADJ

#At this point, you should have two sets of coordinates. Each set should contain a set of coordinates reflecting sub regions that reflect functionally connected regions of the brain. In each set, the defined coordinate sets make up your target cluster that you will use in Step 2 in FSL

#For three dimensional images (non-time series) use the following code that generates regions of interest on a blank MNI template.
#Please check out videos by Andrew Jahn for more detail (http://andysbrainblog.blogspot.com/2013/04/fsl-tutorial-creating-rois-from.html)
#repeat for as many coordinates you have in your identified cluster
fslmaths inputimagename.nii.gz -mul 0 -add 1 -roi x 1 y 1 z 1 0 1 output.nii.gz -odt float
	
#Enter the output image (output.nii.gz) into 3dSlicer (https://www.slicer.org/wiki/Modules:MeshContourSegmentation-Documentation-3.6) and cover using a convex hull






