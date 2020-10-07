# cross_modal_integration

The methods presented in this document and associated code were originally presented by Dr. Scott A Holmes at the Society For Neuroscience meeting in 2015. Their intended use is to extract functionally connected regions of interest from published task-based literature without the requirement of any novel input data from a user. 

For any questions relating to the code, or its application, please contact Dr. Holmes at scott.holmes@childrens.harvard.edu

For defining regions of interest:

ROI generation involved three steps of 

(1) Identifying coordinates within the ACC and DLPFC from the published literature using a cross-modal technique of integrating resting-state and task-based fMRI data to isolate functionally connected regions implicated in discrete components of a task. The accompanying code will outline how to seed task-based fMRI data with published resting state coordinates using affinity based propagation analysis. The result of this stage will be a list of coordinates that aggregate into around two clusters (i.e., regions that are functionally connected).

(2) Use of FSL to project coordinates identified in step 1 onto a blank template in MNI standard space (https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSL)

(3) Inport niftii file generated in FSL into 3DSlicer (https://www.slicer.org/wiki/Modules:MeshContourSegmentation-Documentation-3.6) and use the convex wrap function to envelope the coordinates from Step 2 with a convex (or concave if that is your intention) hull.  


Poster: https://www.researchgate.net/publication/283041124_Isolating_regions_involved_in_conflict_monitoring_and_cognitive_control_A_multi-modal_approach_to_reducing_variability_in_regions_of_interest

Dissertation showing practical example: https://escholarship.mcgill.ca/concern/theses/2b88qf56v
