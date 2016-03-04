%%
LowerMidCOD = readtable('CauseOfDeathLowerMid.csv');
UpperMidCOD = readtable('CauseOfDeathUpperMid.csv');

UpperMidCOD = sortrows(UpperMidCOD,'Causes','ascend');
LowerMidCOD = sortrows(LowerMidCOD,'Causes', 'ascend');
LowerMidCOD = sortrows(LowerMidCOD, 'Year', 'ascend');
UpperMidCOD = sortrows(UpperMidCOD, 'Year','ascend');

%%
% this could be written as a function
UpperMidCOD = table2array(UpperMidCOD);
UpperMidCOD = UpperMidCOD(strcmpi(UpperMidCOD(:, 5), 'Both sexes'), :);
% finds data for both sexes and all ages, death per 100 000
UpperMidCOD = UpperMidCOD(:, [3, 7, 9]);

LowerMidCOD = table2array(LowerMidCOD);
LowerMidCOD = LowerMidCOD(strcmpi(LowerMidCOD(:, 5), 'Both sexes'), :);
% finds data for both sexes and all ages, death per 100 000
LowerMidCOD = LowerMidCOD(:, [3, 7, 9]);
%%
%x = strcmpi(LowerMidCOD(:, 2), UpperMidCOD(:, 2)) & strcmpi(LowerMidCOD(:, 1), UpperMidCOD(:, 1));
%verified data sorted correctly with disease and year

%%
figure;
hold on;
plot(str2double(LowerMidCOD(:, 3)), 'r.');
plot(str2double(UpperMidCOD(:, 3)), '.');



%%
HighIncomeCOD = readtable('CauseOfDeathHigh.csv');
HighIncomeCOD = sortrows(HighIncomeCOD,'Causes', 'ascend');
HighIncomeCOD = sortrows(HighIncomeCOD, 'Year', 'ascend');

HighIncomeCOD = table2array(HighIncomeCOD);
HighIncomeCOD = HighIncomeCOD(strcmpi(HighIncomeCOD(:, 5), 'Both sexes'), :);
% finds data for both sexes and all ages, death per 100 000
HighIncomeCOD = HighIncomeCOD(:, [3, 7, 9]);

%%
LowIncomeCOD = readtable('CauseOfDeathLow.csv');
LowIncomeCOD = IncomeCODProcess(LowIncomeCOD);

%%
figure;
hold on;
plot(str2double(LowerMidCOD(:, 3)), 'r.');
plot(str2double(UpperMidCOD(:, 3)), '.');
plot(str2double(HighIncomeCOD(:, 3)), 'g.');
