clear
%% Figure 1====================
load Figure_1.mat
load colormaps.mat

% define the region for heat budget calculation
coy(1,:) = [507,751,1099];% Sulu
coy(2,:) = [960,1026,1099];% Sangihe
coy(3,:) = [1078,1307,801];% Halmahera
coy(4,:) = [267,1200,105];% Indian

cox(1,:) = [1027,801,1098];% Sangihe
cox(2,:) = [1308,720,800];% Halmahera
cox(3,:) = [267,395,590];% karimata
cox(4,:) = [267,105,345];% Indian
cox(5,:) = [1308,150,548];% Australia

figure
subplot(2,1,1)
pcolor(XC,YC,SST)
shading flat
colormap(colormap1)
h = colorbar;ylabel(h,'Temperature (^oC)');
caxis([27.2 29.4])
set(h,'YTick',[27.2:0.2:29.4]);
axis equal;
fa = [108 138 -14 8.5]; axis(fa);
set(gca,'fontsize',12,'Layer','top');
set(gca,'XTick',[110:5:135],'XTickLabel',['110^oE';'115^oE';'120^oE';'125^oE';'130^oE';'135^oE']);
set(gca,'YTick',[-12:4:8],'YTickLabel',['12^oS';'8^oS ';'4^oS ';'0^o  ';'4^oN ';'8^oN ']);

for j = 1:4
disp(j)
lon_1 = coy(j,1);
lon_2 = coy(j,2);
la   = coy(j,3);
hold on
plot([XC(lon_1,1) XC(lon_2,1)],[YC(1,la) YC(1,la)],'k','LineWidth',2)
end

for j = 1:5
lon      = cox(j,1);
lat_1    = cox(j,2);
lat_2    = cox(j,3);
hold on
plot([XC(lon,1) XC(lon,1)],[YC(1,lat_1) YC(1,lat_2)],'k','LineWidth',2)
end

hold on
[c,h] = contourf(XC(:,1),YC(1,:),-D',[1 1]*0,'k');
set(h,'Facecolor',[1 1 1]*0.6);

subplot(2,1,2)
bar(cat(2,Tide',Notide',Tide'-Notide'))
legend('Tide', 'No-tide','Difference','FontSize',15);
grid on
ylabel('Heat fluxes (TW)')
xticks([1:1:4]);
xticklabels({'Advection','Eddy','Mixing','Forcing'});
set(gca,'fontsize',12,'Layer','top');

%% Figure 2===========================
load Figure_2.mat

figure
subplot(10,1,[1 3])
bar(eddy,0.8)
hold on
bar(eddy_nt,0.8)
grid on
xticks([1:1:12]);
xticklabels({'D','J','F','M','A','M','J','J','A','S','O','N'})
xlim([0 13]); ylim([-60 20])
yticks([-60:10:20]);
legend('Tide','No-tide','FontSize',10)
ylabel('Eddy heat flux (TW)');

subplot(10,1,[4 6])
bar(mix,0.8)
hold on
bar(mix_nt,0.8)
hold on
bar(mix-mix_nt,0.8)
grid on
xticks([1:12]);
xticklabels({'D','J','F','M','A','M','J','J','A','S','O','N'})
xlim([0 13]); ylim([-120 0])
yticks([-120:20:0]);
legend('Tide','No-tide','Difference','FontSize',10)
ylabel('Mixing heat fluxes (TW)');

subplot(10,1,[7 9])
yyaxis left
plot(MLD,'LineWidth',2)
ylim([25 65]);yticks([25:5:65])
grid on
ylabel('Mixed Layer Depth (m)')
hold on
yyaxis right
plot(Kv,'LineWidth',2)
ylim([1 5]*1e-2);yticks([1:0.5:5]*1e-2)
ylabel('Vertical diffusivity (10^{-2} m^2/s)');
xticks([1:12]);
xticklabels({'D','J','F','M','A','M','J','J','A','S','O','N'})
xlim([-1 13]);
set(gca,'xticklabel',{[]})

subplot(10,1,10)
quiver([1:1:12],[1:1:12]*0,squeeze(w_u)',squeeze(w_v)',0.2,'k','LineWidth',1)
axis equal
axis([0.5 12.5 -0.45 0.55])
hold on
quiver([0.4],[0.3],2,0,0.2,'k')
grid on
set(gca,'YTick',[])
xlim([0 13]);ylim([-0.5 0.65]);
xticks([1:12]);
xticklabels({'D','J','F','M','A','M','J','J','A','S','O','N'})

%% Figure 3================================
load Figure_3.mat

figure
subplot(2,1,1)
t = [0:40];
pcolor(t,depth,log10(Kv_3h))
hold on
[C,h] = contour(t,depth,T_3h,[20:2:26],'k','ShowText','on');
caxis([-5 -1]);
shading flat;colormap(colormap2)
h = colorbar; ylabel(h,'Vertical diffusivity (10^{-2} m^2/s)');
h.Ticks = [-5,-4.5 -4,-3.5,-3,-2.5,-2,-1.5,-1];
h.TickLabels = {'10^{-5}','10^{-4.5}','10^{-4}','10^{-3.5}','10^{-3}','10^{-2.5}','10^{-2}','10^{-1.5}','10^{-1}',};
xticks([0:8:40]);
xticklabels({'1','2','3','4','5','6'});
ylim([-160 -10])
xlabel('Day'); ylabel('Depth (m)');


subplot(2,1,2)
pcolor(XC,YC,displacement)
hold on
[c,h] = contourf(XC(:,1),YC(1,:),-D',[1 1]*RC(29),'k');
set(h,'Facecolor',[1 1 1]*0.7);
hold on
[c,h] = contourf(XC(:,1),YC(1,:),-D',[1 1]*0,'k');
set(h,'Facecolor',[1 1 1]*0.5);
shading flat
h = colorbar;ylabel(h,'Tidal displacement (m)');
caxis([4 20])
axis equal;
colormap(colormap1)
fa = [108 138 -14 8.5]; axis(fa);
set(gca,'fontsize',12,'Layer','top');
set(gca,'XTick',[110:5:135],'XTickLabel',['110^oE';'115^oE';'120^oE';'125^oE';'130^oE';'135^oE']);
set(gca,'YTick',[-12:4:8],'YTickLabel',['12^oS';'8^oS ';'4^oS ';'0^o  ';'4^oN ';'8^oN ']);

%% Figure 4===========================
load Figure_4ab.mat
load Figure_4cd.mat
load Figure_4ef.mat

figure
subplot(3,2,1)
pcolor(XC,YC,MLD_N-T26_N)
shading flat
caxis([0 40])
hold on
[c,h] = contourf(XC(:,1),YC(1,:),-D',[1 1]*RC(29),'k');
set(h,'Facecolor',[1 1 1]*0.7);
hold on
[c,h] = contourf(XC(:,1),YC(1,:),-D',[1 1]*0,'k');
set(h,'Facecolor',[1 1 1]*0.5);
shading flat
h = colorbar;ylabel(h,'MLD-thermocline depth (m)');
axis equal;
colormap(colormap3)
fa = [108 138 -14 8.5]; axis(fa);
set(gca,'fontsize',9,'Layer','top');
set(gca,'XTick',[110:5:135],'XTickLabel',['110^oE';'115^oE';'120^oE';'125^oE';'130^oE';'135^oE']);
set(gca,'YTick',[-12:4:8],'YTickLabel',['12^oS';'8^oS ';'4^oS ';'0^o  ';'4^oN ';'8^oN ']);

subplot(3,2,2)
pcolor(XC,YC,MLD_S-T26_S)
shading flat
caxis([0 40])
hold on
[c,h] = contourf(XC(:,1),YC(1,:),-D',[1 1]*RC(29),'k');
set(h,'Facecolor',[1 1 1]*0.7);
hold on
[c,h] = contourf(XC(:,1),YC(1,:),-D',[1 1]*0,'k');
set(h,'Facecolor',[1 1 1]*0.5);
shading flat
h = colorbar;ylabel(h,'MLD-thermocline depth (m)');
axis equal;
colormap(colormap3)
fa = [108 138 -14 8.5]; axis(fa);
set(gca,'fontsize',9,'Layer','top');
set(gca,'XTick',[110:5:135],'XTickLabel',['110^oE';'115^oE';'120^oE';'125^oE';'130^oE';'135^oE']);
set(gca,'YTick',[-12:4:8],'YTickLabel',['12^oS';'8^oS ';'4^oS ';'0^o  ';'4^oN ';'8^oN ']);

subplot(3,2,3)
pcolor(XC,YC,TV_N)
shading flat
caxis([0 1.2])
hold on
[c,h] = contourf(XC(:,1),YC(1,:),-D',[1 1]*RC(29),'k');
set(h,'Facecolor',[1 1 1]*0.7);
hold on
[c,h] = contourf(XC(:,1),YC(1,:),-D',[1 1]*0,'k');
set(h,'Facecolor',[1 1 1]*0.5);
shading flat
h = colorbar;ylabel(h,'Temperature variability (^oC)');
axis equal;
colormap(colormap3)
fa = [108 138 -14 8.5]; axis(fa);
set(gca,'fontsize',9,'Layer','top');
set(gca,'XTick',[110:5:135],'XTickLabel',['110^oE';'115^oE';'120^oE';'125^oE';'130^oE';'135^oE']);
set(gca,'YTick',[-12:4:8],'YTickLabel',['12^oS';'8^oS ';'4^oS ';'0^o  ';'4^oN ';'8^oN ']);

subplot(3,2,4)
pcolor(XC,YC,TV_S)
shading flat
caxis([0 1.2])
hold on
[c,h] = contourf(XC(:,1),YC(1,:),-D',[1 1]*RC(29),'k');
set(h,'Facecolor',[1 1 1]*0.7);
hold on
[c,h] = contourf(XC(:,1),YC(1,:),-D',[1 1]*0,'k');
set(h,'Facecolor',[1 1 1]*0.5);
shading flat
h = colorbar;ylabel(h,'Temperature variability (^oC)');
axis equal;
colormap(colormap4)
fa = [108 138 -14 8.5]; axis(fa);
set(gca,'fontsize',9,'Layer','top');
set(gca,'XTick',[110:5:135],'XTickLabel',['110^oE';'115^oE';'120^oE';'125^oE';'130^oE';'135^oE']);
set(gca,'YTick',[-12:4:8],'YTickLabel',['12^oS';'8^oS ';'4^oS ';'0^o  ';'4^oN ';'8^oN ']);

subplot(3,2,5)
yyaxis left
bar(san_eddy,'FaceColor',[1 1 1]*0.7)
ylabel('Eddy heat flux (TW)')
ylim([-10 0])
hold on
yyaxis right
plot(san_MLD,'LineWidth',2,'LineStyle','-')
hold on
plot(san_T26,'LineWidth',2,'LineStyle','--')
ylim([-100 0]);yticks([-100:10:0])
grid on
ylabel('Depth (m)');
xticks([1:12]);
xticklabels({'D','J','F','M','A','M','J','J','A','S','O','N'})
legend('Eddy','MLD','T26','FontSize',10)
xlim([0 13]);

subplot(3,2,6)
yyaxis left
bar(ban_eddy,'FaceColor',[1 1 1]*0.7)
ylabel('Eddy heat flux (TW)')
ylim([-10 0])
hold on
yyaxis right
plot(ban_MLD,'LineWidth',2,'LineStyle','-')
hold on
plot(ban_T26,'LineWidth',2,'LineStyle','--')
ylim([-100 0]);yticks([-100:10:0])
grid on
ylabel('Depth (m)');
xticks([1:12]);
xticklabels({'D','J','F','M','A','M','J','J','A','S','O','N'})
legend('Eddy','MLD','T26','FontSize',10)
xlim([0 13]);


