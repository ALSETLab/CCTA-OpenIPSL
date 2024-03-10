clear all; clc;

load data_scenario_plot.mat

%%
NN = length(t.data);
arr = 1:60:NN;

t = t.data(arr)/60;% - 7.5;
p = p.data(arr);
w = w.data(arr);
r = r.data(arr);

%%
figure(10);
subplot(3,1,1);
plot(t,p,'b');
grid on
ylabel('P(t) - p.u.')
xlim([0 67.5])

subplot(3,1,2);
plot(t,w,'b');
grid on
ylabel('\Delta\omega(t) - p.u.')
xlim([0 67.5])

subplot(3,1,3)
plot(t,r,'b');
grid on
ylabel('r(t)')
xlim([0 67.5])


xlabel('Time (min)')

set(gcf,'color','w');
%set(gcf,'Position',[70 990 250 250]);
set(gcf,'Position',[70 990 500 250]);

f = gcf;
exportgraphics(f,'fig_scenarios.pdf')
%matlab2tikz('fig_scenarios.tex')