% ------------------------------------------------------------------------------
% Book:        MVA
% ------------------------------------------------------------------------------
% Quantlet:    MVACARTBan2
% ------------------------------------------------------------------------------
% Description: MVACARTBan2 performs classification analysis for the US
%              bankruptcy data (CF SEC 2004) with 84 companies employing
%              the Gini index and a constraint. It plots a decision tree.
%              
% ------------------------------------------------------------------------------
% Usage:       -
% ------------------------------------------------------------------------------
% Inputs:      None
% ------------------------------------------------------------------------------
% Output:      Plot of a classification tree produced with Gini index.
% ------------------------------------------------------------------------------
% Example:     -
% ------------------------------------------------------------------------------
% Author:      Awdesch Melzer 20120425
% ------------------------------------------------------------------------------

% clear variables and close windows


clear all
close all
clc

% load data
x = load('bankruptcy.dat');
y = x(:,3);
x = x(:,1:2);

% create classification tree employing Gini index, constraint: # of
% observations in parent node = 10
t = classregtree(x,y,'method','classification','splitcriterion','gdi','mergeleaves','off','minparent',10,'minleaf',1,'mergeleaves','off')
view(t)
