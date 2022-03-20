% Team 3A Control Code
% Assignment:  Control Code Peer Review
% Authors:  Emmanuel Dhemby and Ben Woosley
% Date:  19 October 2020
%
% Purpose:  Create a script documenting the full water
% sampling process or system and includes the overall code that
% can successfully perform all tasks required.
% This code will be the final product
% of all parts and systems of the entire process including codes and
% instructions as well as calculations for the sampler stand, rotational base, pipette squeeze,
% vision system, and control codT
clear;
a = arduino();

% vision system
cam = webcam(1);
d = distance();
seconds = d / 0.85;

%                           SAMPLER STAND (Ross)
% Two tower frame with pipette squeeze located in the middle
% *********************************************************************************************
% Code for sampler stand
A1A = 'D3';
A1B = 'D4';
disp('Starting motor');
    writeDigitalPin(a,A1A,0);
    writeDigitalPin(a,A1B,1);
    pause(seconds);
    disp('Stopping motor');
    writeDigitalPin(a,A1A,0);
    writeDigitalPin(a,A1B,0);
 % Implementaion of calculations and conversions done
% *********************************************************************************************



%                           ROTATIONAL BASE (Barrett)
% Short instructions on the use of rotational base
% Code for rotational base (if neccessary)
% a = arduino();
% s = servo (a, 'D2', 'MinPulseDuration', 700*10^-6, 'MaxPulseDuration', 2300*10^-6)

% a = arduino();
% s = servo (a, 'D2', 'MinPulseDuration', 700*10^-6, 'MaxPulseDuration', 2300*10^-6)
% writePosition (s, 0)
% pause (1)

%                           PIPETTE SQUEEZE (Zachary)
% -Standard loop set up to input 1 for vision manually
% - Motor makes a half rotation in one direction than stops and
% rotates back in the opposite direction

% Implementaion of calculations and conversions done
% *********************************************************************************************

%connect the arduino
%steps per revolution
stepsPerRevolution =  4 * 32 * 16.032;
%create object thisStepper
thisStepper = Stepper (a,stepsPerRevolution,'D8', 'D11','D12','D13');
% vision system inputs true value for being in posistion
% vision = input('is pipette in position: ');
% if function to spueeze and release the pipette
% if vision == 1
    MoveClockWise(thisStepper,100,500);
    pause(2)
    MoveCounterClockWise(thisStepper,100,325);
% end

A1A = 'D3';
A1B = 'D4';
disp('Reversing motor');
writeDigitalPin(a,A1A,1);
writeDigitalPin(a,A1B,0);
pause(seconds)

disp('Stopping motor');
writeDigitalPin(a,A1A,0);
writeDigitalPin(a,A1B,0);



%                           VISION SYSTEM (Ben)
% Takes a new piction/measurement every 2.5 seconds
% Code
% Implementation of the calculations and conversions done
% *********************************************************************************************

s = servo (a, 'D2', 'MinPulseDuration', 700*10^-6, 'MaxPulseDuration', 2300*10^-6)
writePosition (s, 0)
pause (2)
disp('Done')


% Checking over individual systems for errors
% Overall complete Control Code

% End of program
disp("Doneeeeeeeee");






% *********************************************************************************************

%                           SAMPLER STAND (Ross)
% Two tower frame with pipette squeeze located in the middle
% *********************************************************************************************
% Code for sampler stand
A1A = 'D3';
A1B = 'D4';

disp('Starting motor');
writeDigitalPin(a,A1A,0);
writeDigitalPin(a,A1B,1);
pause(seconds);
disp('Stopping motor');

writeDigitalPin(a,A1A,0);
writeDigitalPin(a,A1B,0);
 % Implementaion of calculations and conversions done
% *********************************************************************************************

% clear 'D10';

%                           ROTATIONAL BASE (Barrett)
% Short instructions on the use of rotational base
% Code for rotational base (if neccessary)
% a = arduino();
% s = servo (a, 'D2', 'MinPulseDuration', 700*10^-6, 'MaxPulseDuration', 2300*10^-6)

% a = arduino();
% s = servo (a, 'D2', 'MinPulseDuration', 700*10^-6, 'MaxPulseDuration', 2300*10^-6)
% writePosition (s, 0)
% pause (1)

%                           PIPETTE SQUEEZE (Zachary)
% -Standard loop set up to input 1 for vision manually
% - Motor makes a half rotation in one direction than stops and
% rotates back in the opposite direction

% Implementaion of calculations and conversions done
% *********************************************************************************************
%connect the arduino
%steps per revolution
stepsPerRevolution =  4 * 32 * 16.032;
%create object thisStepper
% thisStepper = Stepper (a,stepsPerRevolution,'D10', 'D11','D12','D13');
% vision system inputs true value for being in posistion
% vision = input('is pipette in position: ');
% if function to spueeze and release the pipette
% if vision == 1
    MoveClockWise(thisStepper,100,500);
    pause(2)
    MoveCounterClockWise(thisStepper,100,325);
% end

A1A = 'D3';
A1B = 'D4';
disp('Reversing motor');
writeDigitalPin(a,A1A,1);
writeDigitalPin(a,A1B,0);
pause(seconds)

disp('Stopping motor');
writeDigitalPin(a,A1A,0);
writeDigitalPin(a,A1B,0);



%                           VISION SYSTEM (Ben)
% Takes a new piction/measurement every 2.5 seconds


% Implementation of the calculations and conversions done
% *********************************************************************************************

writePosition (s, 1)
pause (2)
disp('Done')


% Checking over individual systems for errors
% Overall complete Control Code

% End of program
disp("Doneeeeeeeee");
