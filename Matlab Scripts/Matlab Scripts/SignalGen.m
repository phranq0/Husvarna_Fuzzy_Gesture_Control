%%Script for Generating Signals from Data sets, and make them loadable
%%into simulink model- ADJUST LOOPS TO FIT THE CORRECT .mat FILE
%ts_pos_x = timeseries(pos_x,time);
%ts_pos_y = timeseries(pos_y,time);
%ts_ori_z = timeseries(ori_z,time);

%DataMoCap
x = zeros(1,4848);
y = zeros(1,4848);
z = zeros(1,4848);
t = zeros(1,4848);

for i = 1:1:4848
    
    x(i) = dataMoCap.pos_x(i);
    y(i) = dataMoCap.pos_y(i);
    z(i) = dataMoCap.ori_z(i);
    t(i) = dataMoCap.time(i);
end 

%DataCommand
lvx = zeros(1,1648);
avz = zeros(1,1648);
tcom = zeros(1,1648);

for j = 1:1:1648
    
    lvx(j) = dataCommand.l_vel_x(j);
    avz(j) = dataCommand.a_vel_z(j);
    tcom(j)= dataCommand.time(j);
end    









