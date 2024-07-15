function powdop2 = Average_by_region(PowDoppler,st,AtlasCrop)
% Average_by_region: Spatially average power doppler data by brain region
% PowDoppler: Power doppler data (depth,lateral,elevational,time)
% st.safe_name: structure name
% st.id: structure id
% AtlasCrop: Atlas registered to brain power doppler volume, labeled with
%            structure id's from st.id
% powdop2: Power doppler data, averaged by brain region (number of brain regions, time)

nregions=length(st.id);
[X,Y,Z,T] = size(PowDoppler);

Regions = [];de=[];l=[];e=[];
powdop2=zeros(nregions,size(PowDoppler,4));
for ii=1:nregions
structure_id = st.id(ii);
structure_name = st.safe_name(ii);
[r,c,d] = ind2sub(size(AtlasCrop),find(AtlasCrop==structure_id)); % [row,col,depth]
idc = find(r>0 & r<=X & c>0 & c<=Y & d>0 & d<=Z);
r2=r(idc);c2=c(idc);d2=d(idc);
Regions =  [Regions; {structure_name}, {r2},{c2},{d2}];
de = [de;r2];l=[l;c2];e=[e;d2];

idx=zeros(length(idc),1);
 for kk=1:T
     oo=1;
for jj=1:length(idc)
    %for kk=1:size(PowDoppler,4)
        powdop2(ii,kk)=powdop2(ii,kk)+(PowDoppler(r2(jj),c2(jj),d2(jj),kk));
    oo=oo+1;
        %end
end 
powdop2(ii,kk)=powdop2(ii,kk)/oo;
end
%powdop2(ii,:)=mean(mean(mean(PowDoppler(idc))));
ii
end

end

