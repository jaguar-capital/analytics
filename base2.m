clc 
clear
data=xlsread('base1.xlsx','Hoja1','A2:DS10000');
W1=make_neighborsw(data(:,12),data(:,13),5);
W2=make_neighborsw(data(:,12),data(:,13),10);
x1= ones(9999,1);
nvar= char('pm2','cons','estrato','area','alc','banos','garaje','cocina','instlav','instsec','estufa','horno','calentador','chimenea','deposito','porteria'...
    ,'salonsoc','piscina','parqueinf','gym','tanque','sauna','guarde','ascensor','centcom','segur','transm','medgen','ips','eps','turis','univ','colnof','dummysur');
dat= [x1 data(:,8) data(:,16:19) data(:,24) data(:,26:27) data(:,30) data(:,33) data(:,36:47) data(:,75:77) data(:,79) data(:,82) data(:,84) data(:,86) data(:,88:89) data(:,123)];
%res= ols(data(:,14),dat);
%prt(res,nvar);
sar= sar(data(:,14),dat, W1);
prt(sar,nvar);
y2= (sar.y);
yhat2= (sar.yhat);
error2 =errperf(y2,yhat2,'mape');

sem= sem(data(:,14),dat,W1);
prt(sem,nvar);
y= (sem.y);
yhat= (sem.yhat);
hist(sem.resid);
error =errperf(y,yhat,'mape');

sdm= sdm(data(:,14),dat,W1);
prt(sdm,nvar);
y1= (sdm.y);
yhat1= (sdm.yhat);
hist(sdm.resid);
error1= errperf(y1,yhat1,'mape');

nvar= char('pm2','cons','area','alc','banos','garaje','cocina','instlav','instsec','estufa','horno','calentador','chimenea','deposito','porteria'...
    ,'salonsoc','piscina','parqueinf','gym','tanque','sauna','guarde','ascensor','centcom','segur','transm','medgen','ips','eps','turis','univ','colnof');


%res= sem.resid;
betas= (sem.beta);
bet= transpose(betas);
lote= [1 50 1 2 2 1 1 1 0 1 0 1 0 1 0 1 1 0 1 1 1 1 0 600 180 690 400 1970 1730 1700 470];
lote2= [1 80 2 2 2	1 1	1 0	1 0	1 0	1 0	1 1	0 1	1 1	1 0	600	180	690	400	1970 1730 1700 470];
viva26= [1 83 3	2 2	1 1	1 0	1 0	1 0	1 0 1 1 1 1 1 1 1 0 340 210 540 180 2100 1600 1970 290];
sanm= [1 50 1 2 2 1 1 1 1 1 1 0 0 0 1 1 0 0 1 0 0 2 0 320 860 450 590 390 530 440 310];  
lot=transpose(lote);
lot2=transpose(lote2);
viv26=transpose(viva26);
snm= transpose(sanm);
predict= (bet*lot);
predict2= (bet*lot2);
predict3= (bet*viv26);
predict4= (bet*snm);

%perf = mae(y,yhat);
res= sem.resid;
xb= mean(res);


%moran= moran(data(:,14),dat,W1);
%prt(moran);
