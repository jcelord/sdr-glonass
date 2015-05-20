function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 20-May-2015 09:28:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
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


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

%Format
format ('compact');
format ('long', 'g');
%--- Include folders with functions ---------------------------------------
addpath include;             % The software receiver functions
addpath geoFunctions;        % Position calculation related functions
% Initialize constants, settings =========================================
global settings;
settings = initSettings();
% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
[filename pathname] = uigetfile({'*.dat'},'Choose DAT-file');
fullFileName = strcat(pathname,filename);
set(handles.edit1,'String',fullFileName);
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global settings;
%Get data file name
settings.fileName=get(handles.edit1,'String');
%Probe data
probeData(settings);
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
global settings;
global acqResults;
[fid, message] = fopen(settings.fileName, 'rb');
global fid;
%Initialize the multiplier to adjust for the data type
if (settings.fileType==1) 
  dataAdaptCoeff=1;
else
  dataAdaptCoeff=2;
end
%If success, then process the data
if (fid > 0)  
  % Move the starting point of processing. Can be used to start the
  % signal processing at any point in the data record (e.g. good for long
  % records or for signal processing in blocks).
  fseek(fid, dataAdaptCoeff*settings.skipNumberOfBytes, 'bof');   
% Acquisition ============================================================  
  % Do acquisition if it is not disabled in settings or if the variable
  % acqResults does not exist.
  if ((settings.skipAcquisition == 0) | ~exist('acqResults', 'var'))    
    % Find number of samples per spreading code
    samplesPerCode = round(settings.samplingFreq / ...
                           (settings.codeFreqBasis / settings.codeLength));    
    % Read data for acquisition. 11ms of signal are needed for the fine
    % frequency estimation    
    data  = fread(fid, dataAdaptCoeff*(settings.acqCohIntegration*2 + 1)*...
                 samplesPerCode, settings.dataType)';    
    if (dataAdaptCoeff==2)
        data1=data(1:2:end);
        data2=data(2:2:end);
        if (settings.switchIQ == 1) then
            data=data2 + i.*data1;
        else
            data=data1 + i.*data2;
        end
    end    
    %--- Do the acquisition -------------------------------------------
    set(handles.text2,'String','Acq is in progress');
    acqStatusHandle = ancestor(handles.text2, 'String');
    acqResults = acquisition(data, settings);
    plotAcquisition(acqResults);    
  end
end
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Initialize channels and prepare for the run ============================
  
  % Start further processing only if a GNSS signal was acquired (the
  % field FREQUENCY will be set to 0 for all not acquired signals)
    global channel;
    global acqResults;
    global fid;
	global settings;  
    global trackResults;  
    if (any(acqResults.carrFreq))
    channel = preRun(acqResults, settings);
    showChannelStatus(channel, settings);
    else
        % No satellites to track, exit
    %   disp('No GNSS signals detected, signal processing finished.\n');
        h = msgbox('No GNSS signals detected, signal processing finished','Acq error');
        trackResults = [];
        return;
    end  
    [trackResults, channel] = tracking(fid, channel, settings);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global trackResults;
global acqResults;
global channel;
global settings;
uisave({'trackResults', 'settings', 'acqResults', 'channel'},date);


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[fileName, pathName] = uigetfile('*.mat','Choose MAT-file');
load(strcat(pathName,fileName));
global trackResults;
global acqResults;
global channel;


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global trackResults;
global acqResults;
global channel;
global settings;
global navSolutions;
disp('   Calculating navigation solutions...');
navSolutions = postNavigation(trackResults, settings);
disp('   Processing is complete for this data block');  
% Plot all results ===================================================
disp('   Ploting results...');
if settings.plotTracking
  plotTracking(1:settings.numberOfChannels, trackResults, settings);
end 
plotNavigation(navSolutions, settings);


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global navSolutions;
set(handles.text8,'String',strcat(num2str(mean(navSolutions.latitude)),' deg'));
set(handles.text9,'String',strcat(num2str(mean(navSolutions.longitude)), 'deg'));
set(handles.text10,'String',strcat(num2str(mean(navSolutions.height)), ' m'));
set(handles.text11,'String',num2str(mean(navSolutions.DOP)));

set(handles.text12,'String',strcat('±',num2str(std(navSolutions.X)),' m'));
set(handles.text13,'String',strcat('±',num2str(std(navSolutions.Y)), 'm'));
set(handles.text14,'String',strcat('±',num2str(std(navSolutions.height)), ' m'));
set(handles.text15,'String',strcat('±',num2str(std(navSolutions.DOP))));
