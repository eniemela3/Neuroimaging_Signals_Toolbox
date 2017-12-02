function varargout = main(varargin)
% MAIN MATLAB code for main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 02-Dec-2017 15:49:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

%addpath('data', 'functions');

function main_OpeningFcn(hObject, eventdata, handles, varargin)

clear global import1 import2 signal1 signal2 MREG1 MREG2;

global Fs MREG1 MREG2;
Fs = 10; % Hz

% Choose default command line output for main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

if strcmp(get(hObject,'Visible'),'off')
    plot(rand(5));
end

function varargout = main_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;

function FileMenu_Callback(hObject, eventdata, handles)

function OpenMenuItem_Callback(hObject, eventdata, handles)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

function PrintMenuItem_Callback(hObject, eventdata, handles)
printdlg(handles.figure1)

function CloseMenuItem_Callback(hObject, eventdata, handles)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)

%% Signal 1 & 2 select drop down menus

function chooseSignal1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject, 'Value', 1);
set(hObject, 'String', listFiles());

function chooseSignal2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject, 'Value', 1);
set(hObject, 'String', listFiles());

function chooseSignal1_Callback(hObject, eventdata, handles)
global import1
global MREG1
selected = get(hObject, 'Value');
files = get(hObject, 'String');
file = strip(files(selected,:));
if strcmp(file, 'mreg.txt')
    MREG1 = 1; % not empty
end
  
if selected > 1
    import1 = load(files(selected, :));
    if size(import1, 2) > 1
        set(handles.component1, 'Visible', 'on');
        set(handles.component1, 'String', 1:size(import1, 2));
        set(handles.component1text, 'Visible', 'on');
    else
        set(handles.component1, 'Visible', 'off');
        set(handles.component1text, 'Visible', 'off');
    end
else
    import1 = 0;
    set(handles.component1, 'Visible', 'off');
    set(handles.component1text, 'Visible', 'off');
end

function chooseSignal2_Callback(hObject, eventdata, handles)
global import2 MREG2

selected = get(hObject, 'Value');
files = get(hObject, 'String');
file = strip(files(selected,:));
if strcmp(file, 'mreg.txt')
    MREG2 = 1;
end

if selected > 1
    import2 = load(files(selected, :));
    if size(import2, 2) > 1
        set(handles.component2, 'Visible', 'on');
        set(handles.component2, 'String', 1:size(import2, 2));
        set(handles.component2text, 'Visible', 'on');
    else
        set(handles.component2, 'Visible', 'off');
        set(handles.component2text, 'Visible', 'off');
    end
else
    import2 = 0;
    set(handles.component2, 'Visible', 'off');
    set(handles.component2text, 'Visible', 'off');
end

function filterSignal1_Callback(hObject, eventdata, handles)
if get(hObject, 'Value')
    set(handles.lowerBound1, 'Visible', 'on');
    set(handles.upperBound1, 'Visible', 'on');
    set(handles.lowerBound1text, 'Visible', 'on');
    set(handles.upperBound1text, 'Visible', 'on');
else
    set(handles.lowerBound1, 'Visible', 'off');
    set(handles.upperBound1, 'Visible', 'off');
    set(handles.lowerBound1text, 'Visible', 'off');
    set(handles.upperBound1text, 'Visible', 'off');
end   

function saveSignals_Callback(hObject, eventdata, handles)

function filterSignal2_Callback(hObject, eventdata, handles)
if get(hObject, 'Value')
    set(handles.lowerBound2, 'Visible', 'on');
    set(handles.upperBound2, 'Visible', 'on');
    set(handles.lowerBound2text, 'Visible', 'on');
    set(handles.upperBound2text, 'Visible', 'on');
else
    set(handles.lowerBound2, 'Visible', 'off');
    set(handles.upperBound2, 'Visible', 'off');
    set(handles.lowerBound2text, 'Visible', 'off');
    set(handles.upperBound2text, 'Visible', 'off');
end 

function saveSignal2_Callback(hObject, eventdata, handles)

function showFFT1_Callback(hObject, eventdata, handles)
global signal1;
if signal1
    fft_calc(signal1);
end

function showFFT2_Callback(hObject, eventdata, handles)
global signal2;
if signal2
    fft_calc(signal2);
end

function updateGraph_Callback(hObject, eventdata, handles)
global import1;
global import2;
global signal1;
global signal2;
global Fs;
global MREG1;
global MREG2;
global fig1;
global fig2;

if ishandle(fig1)
    close(fig1);
end
if ishandle(fig2)
    close(fig2);
end

if size(import1, 2) > 1
    signal1 = import1(:, get(handles.component1, 'Value'));
else
    signal1 = import1;
end
if size(import2, 2) > 1
    signal2 = import2(:, get(handles.component2, 'Value'));
else
    signal2 = import2;
end

if get(handles.filterSignal1, 'Value')
    signal1 = y_IdealFilter(signal1, 1/Fs, [get(handles.lowerBound1, 'Value') get(handles.upperBound1, 'Value')]);
end
if get(handles.filterSignal2, 'Value')
    signal2 = y_IdealFilter(signal2, 1/Fs, [get(handles.lowerBound2, 'Value') get(handles.upperBound2, 'Value')]);
end

plotSignals();

if MREG1
    img = get(handles.component1, 'Value');
    file1 = strjoin(['MREG_components\MREG_IC_' string(img) '.png'], '');
    img1 = imread(convertStringsToChars(file1));
    fig1 = figure;
    imshow(img1);
    clear global MREG1;
end
if MREG2
    img = get(handles.component2, 'Value');
    file2 = strjoin(['MREG_components\MREG_IC_' string(img) '.png'], '');
    img2 = imread(convertStringsToChars(file2));
    fig2 = figure;
    imshow(img2);
    clear global MREG2;
end

function component1_Callback(hObject, eventdata, handles)

function component1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject, 'Visible', 'off');
set(hObject, 'Value', 1);

function component2_Callback(hObject, eventdata, handles)

function component2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject, 'Visible', 'off');
set(hObject, 'Value', 1);

function pushbutton7_Callback(hObject, eventdata, handles)

[filename, pathname] = uigetfile('*.txt', 'Select file to be analyzed')

function lowerBound1_Callback(hObject, eventdata, handles)

function lowerBound1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject, 'Visible', 'off');
set(hObject, 'Value', 0);

function upperBound1_Callback(hObject, eventdata, handles)

function upperBound1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject, 'Visible', 'off');
set(hObject, 'Value', 0);

function lowerBound2_Callback(hObject, eventdata, handles)

function lowerBound2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject, 'Visible', 'off');
set(hObject, 'Value', 0);

function upperBound2_Callback(hObject, eventdata, handles)

function upperBound2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject, 'Visible', 'off');
set(hObject, 'Value', 100);

%% questions
% filter not working?