%% Husqvarna Control - Script 2
%% DataCommand Path Test
%t = zeros(1,399);

t = 1:0.5:500;
%timesig = rosmessage('sensor_msgs/Imu');
%timesig.Header.Stamp = rostime('now','system');
linV = zeros(1,999);
angV = zeros(1,999);

for j = 1:1:999
    %time(j) = rostime('now','system');
    % Use different scaling values on linear velocity when using Fuzzy
    % Controller
    linV(j) = 0.5*((dataCommand.l_vel_x(j))/0.05); %Scaling for the data
    angV(j) = (dataCommand.a_vel_z(j))/0.05;
    %t(j)= dataCommand.time(j);
end    


