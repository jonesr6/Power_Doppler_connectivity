function ConnMat = calculate_connectivity_pearson(PD_reorg)
    %calculate_connectivity_pearson: This function calculates the connectivity
    %between voxels in time, using Pearson correlation between voxels
    %PD_reorg: power doppler matrix collapsed into voxels x time
    %ConnMat: connectivity between each pixel through time, only populating top
    %         triangle of matrix

    ConnMat = zeros(size(PD_reorg, 1)) + 0.0;
    first_flag = 1;
    for k1 = 1:size(PD_reorg, 1)
        for k2 = k1:size(PD_reorg, 1)
            if first_flag
                c = corrcoef(PD_reorg(k1, :), PD_reorg(k2, :));
                CLag0 = c(1);
                first_flag = 0;
            else
                c = corrcoef(PD_reorg(k1, :), PD_reorg(k2, :));
                CLag0 = c(2);
            end
            ConnMat(k1, k2) = abs(CLag0);
        end
    end

end
