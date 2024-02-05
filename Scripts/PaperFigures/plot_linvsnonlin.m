clear all; clc

%% load and rename data
load data_linvsnonlin.mat

NN1 = length(tpnonlin.data);
arrnl = 1:1:NN1; 
NN2 = length(tplinmod.data);
arrln = 1:1:NN2;

pnl = pnonlin.data(arrnl);
tpnl = tpnonlin.data(arrnl);

pl = plinmod.data(arrln);
tpl = tplinmod.data(arrln);

%% plot data
figure(10)
subplot(2,1,1)
hold on
    h1 = plot(tpnl,pnl,'b-','LineWidth',1);
    h2 = plot(tpl,pl,'r-.','LineWidth',1);
hold off
grid on
xlim([0 40])
ylabel('P(t) (pu)')
xlabel('Time (s)')
legend([h1 h2],'Nonlinear','Linear','Location','southeast','Orientation','horizontal')

subplot(2,1,2)
hold on
    h1 = plot(tpnl,pnl,'b-','LineWidth',1);
    h2 = plot(tpl,pl,'r-.','LineWidth',1);
hold off
grid on
xlim([30 40])
ylabel('P(t) (pu)')
xlabel('Time (s)')
legend([h1 h2],'Nonlinear','Linear','Location','southeast','Orientation','horizontal')

position = [260 180 340 180];
set(gcf,'color','w', 'Position', position)
f = gcf;
exportgraphics(f,'linvsnonlin.pdf')