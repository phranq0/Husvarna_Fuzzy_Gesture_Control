%% Matlab Script for Sensor Data Analysis
% The following script is used for plotting and refining the parts of
% datasets that we have chosen for representing the movements of the wrist
% in correspondence with two different sections of the track, in particular
% a straight and a curve.



%% For loop to analize in a sequence the selected experimental data sets 
% We only have considered 9 files of the overall provided beacause we chose
% only the most regular tracks.

files = dir('*.mat'); 
for file = files'
    filename = load(file.name);
    
%% Plots of the behaviour of the driver's wrist in different conditions of motion
% Now we are evaluating the time range in which the robot is moving along
% an approximate straight line and in this range we provide plots of the
% motions registered from the smartwatch.

 time_rettilineo = zeros(300,1);
 a_vel_z_rettilineo = zeros(300,1);
 l_vel_x_rettilineo = zeros(300,1);
 for i = 1:1:300 % This is the approximate range of values which define a straight path
    time_rettilineo(i) = filename.dataCommand.time(1075+i);
    a_vel_z_rettilineo(i) = filename.dataCommand.a_vel_z(1075+i);
    l_vel_x_rettilineo(i) = filename.dataCommand.l_vel_x(1075+i);
 end   
 
 f = figure;
 p = uipanel('Parent',f,'BorderType','none'); 
 p.Title = 'Straight Path Commands'; 
 p.TitlePosition = 'centertop'; 
 p.FontSize = 12;
 p.FontWeight = 'bold';
 sub1 = subplot(2,1,1,'Parent',p);
 plot(sub1,time_rettilineo,a_vel_z_rettilineo,'color','b','DisplayName','AngVel_Z_rettilineo');
 title('Angular Velocity of the wrist');
 sub2 = subplot(2,1,2,'Parent',p);
 plot(sub2,time_rettilineo,l_vel_x_rettilineo,'color','r','DisplayName','LinVel_X_rettilineo');
 title('Linear Velocity of the wrist');
 
 % Here we are using a Median Filter to cut off undesidered values from the
 % plots
 figure
 a_vel_z_filtered = medfilt1(a_vel_z_rettilineo,20);
 plot(time_rettilineo,a_vel_z_filtered,'color','b','DisplayName','AngVel_Z_filtered');
 title(strcat(file.name,',Filtered Angular Straight'))
 figure
 l_vel_x_filtered = medfilt1(l_vel_x_rettilineo,20);
 plot(time_rettilineo,l_vel_x_filtered,'color','b','DisplayName','LinVel_X_filtered');
 title(strcat(file.name,',Filtered Linear Straight'))
 
 % Now we evaluate Smartwatch Data on a curve instead of a straight motion 
 % This loop is used to save into arrays, for each data structure, 
 % the Linear and Angular velocities for different parts of the track.
 % We took as example the range for the very first track, 'lap1_group1
 % volunteer_1'.
 % To evaluate together all .mat files, we had to find two 'common ranges'
 % which approximately contain for each file a STRAIGHT section and a CURVE
 % section.
 time_curve = zeros(350,1);
 a_vel_z_curve = zeros(350,1);
 l_vel_x_curve = zeros(350,1);
 for i = 1:1:350 % This is the approximate range of values which define a straight path
    time_curve(i) = filename.dataCommand.time(750+i);
    a_vel_z_curve(i) = filename.dataCommand.a_vel_z(750+i);
    l_vel_x_curve(i) = filename.dataCommand.l_vel_x(750+i);
 end   
 
 f = figure;
 p = uipanel('Parent',f,'BorderType','none'); 
 p.Title = 'Curved Path Commands'; 
 p.TitlePosition = 'centertop'; 
 p.FontSize = 12;
 p.FontWeight = 'bold';
 sub1 = subplot(2,1,1,'Parent',p);
 plot(sub1,time_curve,a_vel_z_curve,'color','b','DisplayName','AngVel_Z_curve');
 title('Angular Velocity of the wrist');
 sub2 = subplot(2,1,2,'Parent',p);
 plot(sub2,time_curve,l_vel_x_curve,'color','r','DisplayName','LinVel_X_curve');
 title('Linear Velocity of the wrist');
 
 % Here we are using a Median Filter to cut off undesidered values from the
 % plots
 figure
 a_vel_z_filtered = medfilt1(a_vel_z_curve,20);
 plot(time_curve,a_vel_z_filtered,'color','b','DisplayName','AngAcc_Z_filtered');
 title(strcat(file.name,',Filtered Angular Curve'))
 figure
 l_vel_x_filtered = medfilt1(l_vel_x_curve,20);
 plot(time_curve,l_vel_x_filtered,'color','b','DisplayName','LinAcc_X_filtered');
 title(strcat(file.name,',Filtered Linear Curve'))

 
end  

