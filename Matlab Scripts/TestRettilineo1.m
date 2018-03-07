 
%% Plots of the behaviour of the driver's wrist in different conditions of motion
 
 % Now we are evaluating the time range in which the robot is moving along
 % an approximate straight line and in this range we provide plots of the
 % motions registered from the smartwatch.
 
 % Loop used to save into arrays, for each data structure, the Linear and
 % Angular velocities for different parts of the track.
 %We took as example the range for the very first track, 'lap1 group1
 %volunteer 1'.
 time_rettilineo = zeros(130,1);
 a_vel_z_rettilineo = zeros(130,1);
 l_vel_x_rettilineo = zeros(130,1);
 for i = 1:1:130 % 130 is the approximate range of values which define a straight path
    time_rettilineo(i) = dataCommand.time(1518+i);
    a_vel_z_rettilineo(i) = dataCommand.a_vel_z(1518+i);
    l_vel_x_rettilineo(i) = dataCommand.l_vel_x(1518+i);
 end   
 
 f = figure;
 p = uipanel('Parent',f,'BorderType','none'); 
 p.Title = 'Straight Path Section Commands'; 
 p.TitlePosition = 'centertop'; 
 p.FontSize = 12;
 p.FontWeight = 'bold';
 sub1 = subplot(2,1,1,'Parent',p);
 plot(sub1,time_rettilineo,a_vel_z_rettilineo,'color','b','DisplayName','AngVel_Z_rettilineo');
 title('Angular Velocity of the wrist');
 sub2 = subplot(2,1,2,'Parent',p);
 plot(sub2,time_rettilineo,l_vel_x_rettilineo,'color','r','DisplayName','LinVel_X_rettilineo');
 title('Linear Velocity of the wrist');
 
 