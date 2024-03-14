% Script to obtain the power flow solution from PSAT models
% LV, 2024/03
clear all; clc;
% put the path to where the psat .zip has been uncompressed
cd("C:\Users\vanfretti\Documents\MATLAB\psat-2.1.11-mat\psat")
initpsat % starts PSAT in command line mode
% put the path to the working director where the models are stored
cd("C:\Users\vanfretti\Documents\MATLAB\example2_psat_models")
clpsat.readfile = 0; % do not reload the data files

%% Specify the model to be solved
runpsat('d_kundur1_mdl_case1.m','data')
% Set the system parameters
Settings.freq = 60;
Settings.mva = 100;
Settings.showlf = 1;
% Power flow settings and solution
Settings.lftol = 1e-12;

% % decrease the load/generation
% ldecrease = -0.25; %percent load decrease
% 
% % Modify the power output of the generators
% PV.store(1,4) = 5*(1+ldecrease);
% PV.store(2,4) = 5*(1+ldecrease);
% PV.store(4,4) = 5*(1+ldecrease);
% 
% % Modify the load
% PQ.store(1,4) = 15.00* (1+ldecrease);
% PQ.store(2,4) = 5.00 * (1+ldecrease);


%% Run power flow
runpsat('pf')

%% Post-process the data

% calculate the line flows
[ps0,qs0,pr0,qr0] = fm_flows;

% extract the bus voltages and angles for further use
voltages = DAE.y(1+Bus.n:2*Bus.n);
angles = DAE.y(Bus.a);

% extract the power at each bus from the solution
Sbase = 100.0e6;
pgen = Snapshot.Pg*Sbase/1e6;
qgen = Snapshot.Qg*Sbase/1e6;
pload = Snapshot.Pl*Sbase/1e6;
qload = Snapshot.Ql*Sbase/1e6;

% Make a table
varNames = {'Bus', '|V (pu)|','/_V (rad)', ...
            'Pgen (MW)',  'Qgen (Mvar)', ...
            'Pload (MW)', 'Qload (Mvar)'};
Tableout = table(Bus.names,voltages,angles,pgen,qgen,pload,qload,'VariableNames',varNames);
disp(Tableout)
%% Display data for reuse
% disp('Voltage Magnitudes')
% disp(voltages)
% figure(101)
% bar(voltages,'DisplayName','voltages')
% xlabel('Iteration no and Bus no')
% ylabel('Voltage (pu)')

% Make a table
varNames = {'Bus', '|V (pu)|','/_V (rad)', ...
            'Pgen (MW)',  'Qgen (Mvar)', ...
            'Pload (MW)', 'Qload (Mvar)'};
Tableout = table(Bus.names,voltages,angles,pgen,qgen,pload,qload,'VariableNames',varNames);
disp(Tableout)
%% Display data for reuse
% format long g
% disp('Voltage Magnitudes')
% disp(voltages)
% figure(101)
% bar(voltages,'DisplayName','voltages')
% xlabel('Iteration no and Bus no')
% ylabel('Voltage (pu)')

%% Display record data
run dexample2_print_record_data.m

%closepsat % exits PSAT gracefully
