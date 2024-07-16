% Create and plot connectivity matrix from atlased power doppler data

load('PD') % power doppler data (deps,lats,els,time)
load('AtlasCrop') % cropped brain volume with labeled regions
load('Regions') % regions labels

% average power doppler signal over each region
PD_reorg = Average_by_region(PD, st, AtlasCrop);

% calculate connectivity between each region
ConnMat = calculate_connectivity_pearson(PD_reorg);

% populates full matrix, removes regions without signal
I2 = rot90(fliplr(ConnMat), 1);
I = ConnMat + I2;
B = triu(ConnMat.', 1) + tril(ConnMat);
I(find(B > 0)) = 1;

Z = rmmissing(I, 'MinNumMissing', size(I, 1));
Z2 = rmmissing(Z, 2, 'MinNumMissing', size(Z, 1));

% plot connectivity matrix
figure; imagesc(Z2)
colormap jet
axis equal tight
colorbar
caxis([0 1])
