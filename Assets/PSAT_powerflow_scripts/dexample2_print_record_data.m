%% Bus Data Output to screen
nbuses = 11;
buslist = 1:nbuses; % array with bus numbers

vmag = voltages(buslist);
vang = angles(buslist);

% Bus data format specifications

format short
formatSpecMag = 'V%d = %1.24f ,\n';
formatSpecAng = 'A%d = %1.24f ,\n';
formatSpecAngLast = 'A%d = %1.24f )\n';

fprintf('**************************\n')
fprintf('Bus Data Starts \n')
fprintf('**************************\n')
fprintf('( \n')
for k = 1:length(buslist)
    if k < length(buslist)
        fprintf(formatSpecMag,k,vmag(k))
        fprintf(formatSpecAng,k,vang(k))
    else
        fprintf(formatSpecMag,k,vmag(k))
        fprintf(formatSpecAngLast,k,vang(k))   
    end
end

%% Generator Data Output to Screen
ngen = 4;
genlist = 1:ngen;

% Load Data Record formating specifications
format short
formatSpecPg = 'PG%d = 1e06*(  %2.24f  ),\n';
formatSpecQg = 'QG%d = 1e06*(  %2.24f  ),\n';
formatSpecQgLast = 'QG%d = 1e06*(  %2.24f  ) ); \n';

fprintf('\n')
fprintf('**************************\n')
fprintf('Machine Record Data Starts \n')
fprintf('**************************\n')
fprintf('( \n')
for k = 1:length(genlist)
    if k < length(genlist)
        fprintf(formatSpecPg,k,pgen(k))
        fprintf(formatSpecQg,k,qgen(k))
    else
        fprintf(formatSpecPg,k,pgen(k))
        fprintf(formatSpecQgLast,k,qgen(k))   
    end
end


%% Load Data Output to Screen
% Note on formatting and numbering:
% The loads are at buses 7 through 12 and 17, so we need to rearrange
% the data for output

loadarray = [7 9];
pl = pload(loadarray);
ql = qload(loadarray);

nloads = length(loadarray);
loadlist = 1:nloads;

% Load Data Record formating specifications
format short
formatSpecPl = 'PL%d = 1e06*(  %2.24f  ),\n';
formatSpecQl = 'QL%d = 1e06*(  %2.24f  ),\n';
formatSpecQlLast = 'QL%d = 1e06*(  %2.24f  ) ); \n';

fprintf('\n')
fprintf('**************************\n')
fprintf('Load Record Data Starts \n')
fprintf('**************************\n')
fprintf('( \n')
for k = 1:length(loadlist)
    if k < length(loadlist)
        fprintf(formatSpecPl,k,pl(k))
        fprintf(formatSpecQl,k,ql(k))
    else
        fprintf(formatSpecPl,k,pl(k))
        fprintf(formatSpecQlLast,k,ql(k))   
    end
end