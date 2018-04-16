clc;
close all;
clear all;

%setting variables;
n=1000;
frameSize=5;
sigma=4;      %taka duża wartość, bo test jest przy 5-krotnym wzmocnieniem sygnału
range=0.3;
amplify=5;

signalSimulation(n,frameSize,sigma,range,amplify);