%% Spectral Analysis of sunspots dataset
% Dataset info: http://www.sidc.be/silso/infosnytot

%% Import dataset
opts = delimitedTextImportOptions("NumVariables", 5);

% Specify range and delimiter
opts.DataLines = [1, Inf];
opts.Delimiter = ";";

% Specify column names and types
opts.VariableNames = ["Var1", "sunspots", "Var3", "Var4", "Var5"];
opts.SelectedVariableNames = "sunspots";
opts.VariableTypes = ["string", "double", "string", "string", "string"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, ["Var1", "Var3", "Var4", "Var5"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["Var1", "Var3", "Var4", "Var5"], "EmptyFieldRule", "auto");

% Import the data
tbl = readtable("/Users/muratkoptur/GoogleDriveNew/Files/github/MATLAB_scilab/MATLABExamples/data/sunspots.csv", opts);

%% Convert to output type
sunspots = tbl.sunspots;

%% Clear temporary variables
clear opts tbl

%% Plot data and correlation
subplot(2,1,1)
plot(sunspots)
xlabel("Year")
ylabel("Mean Sunspots")
xticks([0 320])
xticklabels({'1700', '2019'})
xlim([0 320])
subplot(2,1,2)
autocorr(sunspots, 100)
saveas(gcf, "../figs/E03_plot_1.png")

%% Spectral Analysis
%  periodogram
subplot(1,1,1)
periodogram(sunspots)
saveas(gcf, "../figs/E03_plot_2.png")
