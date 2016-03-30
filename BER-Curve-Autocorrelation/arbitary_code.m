clc;
clear all, close all;
 
%% Create random data
 
nbits = 3;
ngarbage = 3*nbits;
data = randi([0,1],1,nbits);
garbage = randi([0,1],1,ngarbage);
stream = horzcat(data,garbage); 
 
%% Convert from Unipolar to Bipolar Encoding
 
stream_b = 2*stream - 1;
 
%% Define Parametersm,
 
%%% Variable Parameters
nsamples = 20*nbits;
nseq = 5 %# Iterate stream nseq times
T = 1000; %# Number of periods
Ts = 1; %# Symbol Duration
Es = Ts/2; %# Energy per Symbol
fc = 1e9; %# Carrier frequency
 
%%% Dependent Parameters
A = sqrt(2*Es/Ts); %# Amplitude of Carrier
omega = 2*pi*fc %# Frequency in radians
t = linspace(0,T,nsamples) %# Discrete time from 0 to T periods with nsamples samples
nspb = nsamples/length(stream) %# Number of samples per bit
 
%% Creating the BPSK Modulation
%# simple matrix manipulation.
 
% Replicate each bit nspb/nseq times
repStream_b = repmat(stream_b',1,nspb/nseq);
 
% Tranpose and replicate nseq times to be able to fill to t
modSig_proto = repmat(repStream_b',1,nseq);
 
% Tranpose column by column, then rearrange into a row vector
modSig = modSig_proto(:)';
 
%% The Carrier Wave
 
carrier = A*cos(omega*t);
 
%% Modulated Signal
 
sig = modSig.*carrier;
