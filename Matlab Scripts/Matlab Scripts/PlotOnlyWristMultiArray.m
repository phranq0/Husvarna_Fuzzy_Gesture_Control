%% Modified Script for extraction of Filtered Data Sets as matrices
counter = 0; %Initialization of a counter variable for saving final data into a 2D array
a_vel_z_curve_filt = zeros(350,9);
l_vel_x_curve_filt = zeros(350,9);
a_vel_z_straight_filt = zeros(300,9);
l_vel_x_straight_filt = zeros(300,9);

files = dir('*.mat'); 
for file = files'
    filename = load(file.name);
    counter = counter + 1;
%% Plots of the behaviour of the driver's wrist in different conditions of motion

 % Now we are evaluating the time range in which the robot is moving along
 % an approximate straight line and in this range we provide plots of the
 % motions registered from the smartwatch.
 
 % This loop is used to save into arrays, for each data structure, 
 % the Linear and Angular velocities for different parts of the track.
 % We took as example the range for the very first track, 'lap1_group1
 % volunteer_1'.
 %Maybe Delete from analysis file 'Lap2Group3Vol11'(Not Sure folder)
 time_rettilineo = zeros(300,1);
 a_vel_z_rettilineo = zeros(300,1);
 l_vel_x_rettilineo = zeros(300,1);
 for i = 1:1:300 % 130 is the approximate range of values which define a straight path
    time_rettilineo(i) = filename.dataCommand.time(1075+i);
    a_vel_z_rettilineo(i) = filename.dataCommand.a_vel_z(1075+i);
    l_vel_x_rettilineo(i) = filename.dataCommand.l_vel_x(1075+i);
 end   
 
 
 % Here we are using a Median Filter to cut off undesidered values from the
 % plots

% figure
 a_vel_z_straight_filt(:,counter) = medfilt1(a_vel_z_rettilineo,20);
% plot(time_rettilineo,a_vel_z_straight_filt(:,counter),'color','b','DisplayName','AngVel_Z_filtered');
% title(strcat(file.name,',Filtered AngVel Straight'))
% figure
 l_vel_x_straight_filt(:,counter) = medfilt1(l_vel_x_rettilineo,20);
% plot(time_rettilineo,l_vel_x_straight_filt(:,counter),'color','b','DisplayName','LinVel_X_filtered');
% title(strcat(file.name,',Filtered LinVel Straight'))
 % Now we evaluate Smartwatch Data on a curve instead of a straight motion 
 % This loop is used to save into arrays, for each data structure, 
 % the Linear and Angular velocities for different parts of the track.
 % We took as example the range for the very first track, 'lap1_group1
 % volunteer_1'.
 % To evaluate together all .mat files, we had to find two 'common ranges'
 % which approximately contain for each file a STRAIGHT section and a CURVE
 % section. ----> So it's all about adjusting the following loop values
 time_curve = zeros(350,1);
 
 for i = 1:1:350 % 95 is the approximate range of values which define a straight path
    time_curve(i) = filename.dataCommand.time(750+i);
    a_vel_z_curve(i) = filename.dataCommand.a_vel_z(750+i);
    l_vel_x_curve(i) = filename.dataCommand.l_vel_x(750+i);
 end   
 
 
 % Here we are using a Median Filter to cut off undesidered values from the
 % plots
 
% figure
 a_vel_z_curve_filt(:,counter) = medfilt1(a_vel_z_curve,20);
 plot(time_curve,a_vel_z_curve_filt(:,counter),'color','b','DisplayName','AngVel_Z_filtered');
% title(strcat(file.name,',Filtered AngVel Curve'))
% figure
 l_vel_x_curve_filt(:,counter) = medfilt1(l_vel_x_curve,20);
 plot(time_curve,l_vel_x_curve_filt(:,counter),'color','b','DisplayName','LinVel_X_filtered');
% title(strcat(file.name,',Filtered LinVel Curve'))
 %%TODO When the loop on files will be implemented to find all possible datasets
 %%of commands, remember to initialize a variable (outside) 'count' to increment at
 %%each iteration and so create a bidimensional array which will contain
 %%all the filtered data a_vel_z_filtered(rett and curve) and
 %%l_vel_x_filtered(rett and curve)
 
end  

%% TODO Now remain to create TWO fuzzy logic filters, with OUTPUT membership functions on the base of 
%% Collected data, completely separated between linear and angular input