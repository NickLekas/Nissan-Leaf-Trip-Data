close all

% Read in data
d1 = dlmread("data/day1_clean.csv", ",")
d2 = dlmread("data/day2_clean.csv", ",")
d3 = dlmread("data/day3_clean.csv", ",")

% Column look up
T1 = 15
T2 = 17
T4 = 21
ODO = 121
QC = 122
Ambient = 128
SOH = 129

% Day 1 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% data seperation
d1_T1 = d1(2:size(d1), T1)                        % T1 temperature in C
d1_T2 = d1(2:size(d1), T2)                        % T2 temperature in C
d1_T4 = d1(2:size(d1), T4)                        % T4 temperature in C
d1_Ta = d1(2:size(d1), Ambient)                   % Ambient temperature in F
d1_qc = d1(2:size(d1), QC)                        % Total number of quick charges
d1_odo = d1(2:size(d1), ODO)                      % ODO reading in mi
d1_soh = d1(2:size(d1), SOH)                      % SOH in percent

% data processing
d1_Ta = (d1_Ta - 32) * (5/9)                      % Convert ambient from F to C
d1_dist = d1_odo(size(d1_odo)) - d1_odo(1)        % Calculate miles driven
d1_delta_soh = d1_soh(size(d1_odo)) - d1_soh(1)   % Calculate delta SOH

min_qc = min(d1_qc)                               % Get the lowest total QC
d1_qc = d1_qc - min_qc                            % Subtract the lowest total QC from total QC's to get number of QC's done in the day


% Day 2 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% data seperation
d2_T1 = d2(2:size(d2), T1)                        % T1 temperature in C
d2_T2 = d2(2:size(d2), T2)                        % T2 temperature in C
d2_T4 = d2(2:size(d2), T4)                        % T4 temperature in C
d2_Ta = d2(2:size(d2), Ambient)                   % Ambient temperature in F
d2_qc = d2(2:size(d2), QC)                        % Total number of quick charges
d2_odo = d2(2:size(d2), ODO)                      % ODO reading in mi
d2_soh = d2(2:size(d2), SOH)                      % SOH in percent

% data processing
d2_Ta = (d2_Ta - 32) * (5/9)                      % Convert ambient from F to C
d2_dist = d2_odo(size(d2_odo)) - d2_odo(1)        % Calculate miles driven
d2_delta_soh = d2_soh(size(d2_odo)) - d2_soh(1)   % Calculate delta SOH

min_qc = min(d2_qc)                               % Get the lowest total QC
d2_qc = d2_qc - min_qc                            % Subtract the lowest total QC from total QC's to get number of QC's done in the day


% Day 3 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% data seperation
d3_T1 = d3(2:size(d3), T1)                        % T1 temperature in C
d3_T2 = d3(2:size(d3), T2)                        % T2 temperature in C
d3_T4 = d3(2:size(d3), T4)                        % T4 temperature in C
d3_Ta = d3(2:size(d3), Ambient)                   % Ambient temperature in F
d3_qc = d3(2:size(d3), QC)                        % Total number of quick charges
d3_odo = d3(2:size(d3), ODO)                      % ODO reading in mi
d3_soh = d3(2:size(d3), SOH)                      % SOH in percent

% data processing
d3_Ta = (d3_Ta - 32) * (5/9)                      % Convert ambient from F to C
d3_dist = d3_odo(size(d3_odo)) - d3_odo(1)        % Calculate miles driven
d3_delta_soh = d3_soh(size(d3_odo)) - d3_soh(1)   % Calculate delta SOH

min_qc = min(d3_qc)                               % Get the lowest total QC
d3_qc = d3_qc - min_qc                            % Subtract the lowest total QC from total QC's to get number of QC's done in the day


% Plotting day 1 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
figure(1)
hold on
plot(d1_T1, 'color', 'blue')
plot(d1_T2, 'color', 'green')
plot(d1_T4, 'color', 'magenta')
ax = plotyy([2:size(d1)], d1_Ta, [2:size(d1)], d1_qc)
hold off
set(ax(1), {'ycolor'}, {'black'})

grid on
ylim(ax(1), [10 55])
ylim(ax(2), [min(d1_qc) max(d1_qc)])
yticks(ax(1), [10:5:55])
yticks(ax(2), [min(d1_qc):1:max(d1_qc)])
xlim("tight")
title("Day 1")
ylabel(ax(1), 'Temperature (^{\deg}C)')
ylabel(ax(2), '# of quick charges')
legend("T1", "T2", "T4", "Outside", 'location', 'southeastoutside')
set(ax, "fontsize", 24)


% Plotting day 2 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
figure(2)
hold on
plot(d2_T1, 'color', 'blue')
plot(d2_T2, 'color', 'green')
plot(d2_T4, 'color', 'magenta')
ax = plotyy([2:size(d2)],d2_Ta, [2:size(d2)], d2_qc)
hold off
set(ax(1), {'ycolor'}, {'black'})

grid on
ylim(ax(1), [10 55])
ylim(ax(2), [min(d2_qc) max(d2_qc)])
yticks(ax(1), [10:5:55])
yticks(ax(2), [min(d2_qc):1:max(d2_qc)])
title("Day 2")
ylabel(ax(1), 'Temperature (^{\deg}C)')
ylabel(ax(2), '# of quick charges')
legend("T1", "T2", "T4", "Outside", 'location', 'southeastoutside')
set(ax, "fontsize", 24)


% Plotting day 3 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
figure(3)
hold on
plot(d3_T1, 'color', 'blue')
plot(d3_T2, 'color', 'green')
plot(d3_T4, 'color', 'magenta')
ax = plotyy([2:size(d3)], d3_Ta,[2:size(d3)], d3_qc)
hold off
set(ax(1), {'ycolor'}, {'black'})

grid on
ylim(ax(1), [10 55])
ylim(ax(2), [min(d3_qc) max(d3_qc)])
yticks(ax(1), [10:5:55])
yticks(ax(2), [min(d3_qc):1:max(d3_qc)+1])
title("Day 3")
ylabel(ax(1), 'Temperature (^{\deg}C)')
ylabel(ax(2), '# of quick charges')
legend("T1", "T2", "T4", "Outside", 'location', 'southeastoutside')
set(ax, "fontsize", 24)