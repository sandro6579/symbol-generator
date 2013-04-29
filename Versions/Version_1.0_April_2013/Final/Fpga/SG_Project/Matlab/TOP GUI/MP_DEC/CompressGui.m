function varargout = CompressGui(varargin)
% COMPRESSGUI M-file for CompressGui.fig
%      COMPRESSGUI, by itself, creates a new COMPRESSGUI or raises the existing
%      singleton*.
%
%      H = COMPRESSGUI returns the handle to a new COMPRESSGUI or the handle to
%      the existing singleton*.
%
%      COMPRESSGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COMPRESSGUI.M with the given input arguments.
%
%      COMPRESSGUI('Property','Value',...) creates a new COMPRESSGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CompressGui_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CompressGui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help CompressGui

% Last Modified by GUIDE v2.5 10-Jan-2011 11:28:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CompressGui_OpeningFcn, ...
                   'gui_OutputFcn',  @CompressGui_OutputFcn, ...
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

% --- Executes just before CompressGui is made visible.
function CompressGui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CompressGui (see VARARGIN)

% Choose default command line output for CompressGui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes CompressGui wait for user response (see UIRESUME)
% uiwait(handles.figure1);



% --- Outputs from this function are returned to the command line.
function varargout = CompressGui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in buttonLoadImage.
function buttonLoadImage_Callback(hObject, eventdata, handles)
% hObject    handle to buttonLoadImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% My program
%Load image:
[FileN, DirN] = uigetfile({'*.bmp; *.png; *.jpg; *.gif', 'Picture File (*.bmp, *.png, *.jpg, *.gif)'; '*.*', 'All files (*.*)'}, 'Choose Image Files', 'MultiSelect', 'on');
set(handles.listbox_files,'Value', 1); %Add files into list
set(handles.listbox_files,'String', FileN); %Add files into list
set(handles.edit_dir,'String', DirN);
%%End my program


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
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end




% --- Executes on button press in buttonClear.
function buttonClear_Callback(hObject, eventdata, handles)
% hObject    handle to buttonClear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes1); %Clear Axes 1
cla(handles.axes2); %Clear Axes 2
set(handles.edit1, 'String', ' '); %Clear File name



% --- Executes on button press in buttonCompress.
function buttonCompress_Callback(hObject, eventdata, handles)
% hObject    handle to buttonCompress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

DirN=get(handles.edit_dir,'String');
Files=get(handles.listbox_files, 'String');

if sum(class(Files(get(handles.listbox_files, 'Value')))=='char')==4 %String, and not cell
    set(handles.edit1, 'String', [DirN, Files] )
else
    set(handles.edit1, 'String', [DirN, cell2mat(Files(get(handles.listbox_files, 'Value')))] )
end
clear Files;
OriginalImg=imread(get(handles.edit1,'String'));
ImgSize = [size(OriginalImg,2) size(OriginalImg,1)];

%Display image size:
sbytesorig=whos('OriginalImg');
set(handles.text_decmp_byte, 'String', [num2str(sbytesorig.bytes) ' Bytes']);

%Show image:
axes(handles.axes1);
imagesc(OriginalImg);
colormap(gray);

%Compress image
tic;
CmpImg = compress_img(get(handles.edit1,'String'),256);
set(handles.text_cmp_img, 'String', [num2str(toc) ' Seconds']);
sbytescmp=whos('CmpImg'); %Compressed image size
set(handles.text_cmp_byte, 'String', [num2str(sbytescmp.bytes) ' Bytes']);

%Compression Ratio:
set(handles.text_ratio, 'String', ['Compression Ratio: 1 : ' num2str(ceil(sbytesorig.bytes/sbytescmp.bytes))]);

%Deallocate whos
clear('sbytesorig', 'sbytescmp');

%Decompress Image
tic;
DecompImg = decompress_img(CmpImg,ImgSize);
set(handles.text_dec_img, 'String', [num2str(toc) ' Seconds']);

%Show decompressed image
axes(handles.axes2);
imagesc(DecompImg);

% --- Executes on selection change in listbox_files.
function listbox_files_Callback(hObject, eventdata, handles)
% hObject    handle to listbox_files (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox_files contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox_files


% --- Executes during object creation, after setting all properties.
function listbox_files_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox_files (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_dir_Callback(hObject, eventdata, handles)
% hObject    handle to edit_dir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_dir as text
%        str2double(get(hObject,'String')) returns contents of edit_dir as a double


% --- Executes during object creation, after setting all properties.
function edit_dir_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_dir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sof_edit_Callback(hObject, eventdata, handles)
% hObject    handle to sof_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sof_edit as text
%        str2double(get(hObject,'String')) returns contents of sof_edit as a double


% --- Executes during object creation, after setting all properties.
function sof_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sof_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eof_edit_Callback(hObject, eventdata, handles)
% hObject    handle to eof_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eof_edit as text
%        str2double(get(hObject,'String')) returns contents of eof_edit as a double


% --- Executes during object creation, after setting all properties.
function eof_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eof_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function type_edit_Callback(hObject, eventdata, handles)
% hObject    handle to type_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of type_edit as text
%        str2double(get(hObject,'String')) returns contents of type_edit as a double


% --- Executes during object creation, after setting all properties.
function type_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to type_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function addr_msb_edit_Callback(hObject, eventdata, handles)
% hObject    handle to addr_msb_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of addr_msb_edit as text
%        str2double(get(hObject,'String')) returns contents of addr_msb_edit as a double


% --- Executes during object creation, after setting all properties.
function addr_msb_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to addr_msb_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function addr_mid_edit_Callback(hObject, eventdata, handles)
% hObject    handle to addr_mid_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of addr_mid_edit as text
%        str2double(get(hObject,'String')) returns contents of addr_mid_edit as a double


% --- Executes during object creation, after setting all properties.
function addr_mid_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to addr_mid_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function addr_lsb_edit_Callback(hObject, eventdata, handles)
% hObject    handle to addr_lsb_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of addr_lsb_edit as text
%        str2double(get(hObject,'String')) returns contents of addr_lsb_edit as a double


% --- Executes during object creation, after setting all properties.
function addr_lsb_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to addr_lsb_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function crc_force_val_edit_Callback(hObject, eventdata, handles)
% hObject    handle to crc_force_val_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of crc_force_val_edit as text
%        str2double(get(hObject,'String')) returns contents of crc_force_val_edit as a double


% --- Executes during object creation, after setting all properties.
function crc_force_val_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to crc_force_val_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in crc_checkbox.
function crc_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to crc_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of crc_checkbox




% --- Executes on button press in pushbutton_tx_data.
function pushbutton_tx_data_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_tx_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
data=linspace(0, 255, 256);
data = [data data data data];
sof = hex2dec(get(handles.sof_edit, 'String'));
eof = hex2dec(get(handles.eof_edit, 'String'));
type = hex2dec(get(handles.type_edit, 'String'));
addr1 = hex2dec(get(handles.addr_msb_edit, 'String')) ;
addr2 = hex2dec(get(handles.addr_mid_edit, 'String')) ;
addr3 = hex2dec(get(handles.addr_lsb_edit, 'String'));
len = numel(data) - 1;
if get(handles.crc_checkbox, 'Value') == 1 
    crc = mod(sum(data) + type + floor(len/256) + mod(len, 256) + addr1 + addr2 + addr3, 256);
else
    crc = hex2dec(get(handles.crc_force_val_edit, 'String')) ;
end
dataToSend=[sof     type    addr1   addr2   addr3   floor(len/256)      mod(len, 256)       data    crc     eof];
serial_port= instrfind('Port','COM1'); %Close any COM1 serial connection
if numel(serial_port) ~= 0
    fclose(serial_port);
end
serial_port = serial('COM1','BaudRate', 115200,'Parity', 'none', 'DataBits', 8, 'StopBits', 1,'Timeout', 2, 'OutputBufferSize', numel(data) + 9, 'InputBufferSize', numel(data) + 9);
fopen(serial_port);
fwrite(serial_port, dataToSend);
ReceivedData = fread(serial_port);

%Print values to screen
for idx = 1:numel(dataToSend)
    display(['TX: ' num2str(dataToSend(idx)) '      Rx:' num2str(ReceivedData(idx))]);
end

if numel((find(dataToSend ~=ReceivedData'))) == 0 
    display('Receieved data = Transmitted data');
else
    display(['Error in the following index: ' num2str(find(dataToSend ~=ReceivedData')) ])
    display(['Trasnmitted data:' num2str(dataToSend(find(dataToSend ~=ReceivedData'))) ' ; Received data: ' num2str(ReceivedData(find(dataToSend ~=ReceivedData')))] )
end
fclose(serial_port);

