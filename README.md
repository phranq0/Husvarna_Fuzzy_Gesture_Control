# Husvarna_Fuzzy_Gesture_Control
Software Architectures for Robotics Assignment

Implementation in Matlab/Simulink of a linear velocity Fuzzy Logic Controller for mobile robot 'Husqvarna Automower'

# For testing the controller

1 - Follow the necessary steps for Husquarna robot connection to laptop and then for the 
    connection of the smartwatch and smartphone through IMU-bridge. They can be found on 'Emarolab' github repositories
    'gesture-based-controller'
    'mqtt-ros-bridge'
    'imu_stream'
    and 'Husqvarna HRP instructions' and 'gesture-based HRP control' from 'emarolab/Docs' section on github
    
2-  Open Matlab, set the folder which contains all the files stored in 'Matlab Scripts' folder

3-  Load into workspace one of the '.mat' files contained into 'Data Sets' folder

4-  Run 'ScriptTest1.m' or 'ScriptTest2.m'.

5-  Open the Simulink Model 'Pub_Sub_Husqvarna_Smartwatch.slx', and BE SURE that 'LinVelFuzzy.fis' is in the current folder,
    otherwise there will be an error related to the Fuzzy Controller block.
    
6-  Run the simulation and feel free to test other velocity commands by using and eventually modifying the scripts.
    (Advice: When the robot starts moving pay attention to keep the laptop safe, e.g. carry it by hand while connected)
    
