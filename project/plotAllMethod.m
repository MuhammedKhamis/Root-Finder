function plotAllMethod(dataBisection,dataFalse,dataFixed,dataNewton,dataSecant,dataBirgeVieta)
    plot(dataBisection(:,1),dataBisection(:,3),dataFalse(:,1),dataFalse(:,3),dataFixed(:,1),dataFixed(:,3),dataNewton(:,1),dataNewton(:,3),dataSecant(:,1),dataSecant(3,:),dataBirgeVieta(:,1),dataBirgeVieta(:,6));
end