# Power_Doppler_connectivity
Calculate connectivity of 4D ultrasound power Doppler data by brain region. Requires 4D dataset registered to an atlas.

Connectivity_matrix.m is the wrapper used to load in data, calculate the connectivity matrix, and plot the resulting matrix. This script uses two helper functions, listed below.

Average_by_region.m: This function reads a 4D power doppler dataset (depth,lateral,elevation,time) and the corresponding registered brain regions and outputs the average power doppler data per brain region (brain region, time).

calculate_connectivity_pearson.m: This function reads a 2D matrix (voxel, time) to output the connectivity matrix between all voxels.
