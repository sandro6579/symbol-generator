function varargout = create_text(varargin)
% CREATE_TEXT MATLAB code for create_text.fig
%      CREATE_TEXT, by itself, creates a new CREATE_TEXT or raises the existing
%      singleton*.
%
%      H = CREATE_TEXT returns the handle to a new CREATE_TEXT or the handle to
%      the existing singleton*.
%
%      CREATE_TEXT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CREATE_TEXT.M with the given input arguments.
%
%      CREATE_TEXT('Property','Value',...) creates a new CREATE_TEXT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before create_text_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to create_text_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help create_text

% Last Modified by GUIDE v2.5 05-Aug-2012 18:56:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @create_text_OpeningFcn, ...
                   'gui_OutputFcn',  @create_text_OutputFcn, ...
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


% --- Executes just before create_text is made visible.
function create_text_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to create_text (see VARARGIN)

% default screen is black
OriginalImg=imread('symbol_00.bmp');
axes(handles.window_1_1);
imshow(OriginalImg);
axes(handles.window_1_2);
imshow(OriginalImg);
axes(handles.window_1_3);
imshow(OriginalImg);
axes(handles.window_2_1);
imshow(OriginalImg);
axes(handles.window_2_2);
imshow(OriginalImg);
axes(handles.window_2_3);
imshow(OriginalImg);

% creating "windows variables"
% in the "windows variables" we save the symbols represented in binary base

OriginalImg_2_dim=OriginalImg(:,:,1);
handles.windows=cell(2,3);
for y=1:2
    for x=1:3
        handles.windows{y,x}=dec2base(OriginalImg_2_dim',2,8);
    end
end


% Choose default command line output for create_text
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes create_text wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = create_text_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Load_image.
function Load_image_Callback(hObject, eventdata, handles)
% hObject    handle to Load_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[File,Dir] = uigetfile({'*.bmp; *.png; *.jpg; *.gif ; *.tif', 'Picture File (*.bmp, *.png, *.jpg, *.gif)'; '*.*', 'All files (*.*)'}, 'Choose Image Files', 'MultiSelect', 'on');
Dir_File = strcat(Dir,File);   %Concatenate File after Dir
set(handles.loaded_file,'String', Dir_File);
guidata(hObject, handles);

function x_loc_Callback(hObject, eventdata, handles)
% hObject    handle to x_loc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x_loc as text
%        str2double(get(hObject,'String')) returns contents of x_loc as a double


% --- Executes during object creation, after setting all properties.
function x_loc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_loc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function y_loc_Callback(hObject, eventdata, handles)
% hObject    handle to y_loc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y_loc as text
%        str2double(get(hObject,'String')) returns contents of y_loc as a double


% --- Executes during object creation, after setting all properties.
function y_loc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y_loc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in show_image.
function show_image_Callback(hObject, eventdata, handles)
% hObject    handle to show_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=get(handles.x_loc,'String');
y=get(handles.y_loc,'String');
switch x
   case '1'
            switch y
                    case '1'
                             axes(handles.window_1_1);
                             OriginalImg=imread(get(handles.loaded_file,'String'));
                             imshow(OriginalImg);
                    case '2'
                             axes(handles.window_2_1);
                             OriginalImg=imread(get(handles.loaded_file,'String'));
                             imshow(OriginalImg);
            end
   case '2'
            switch y
                    case '1'
                             axes(handles.window_1_2);
                             OriginalImg=imread(get(handles.loaded_file,'String'));
                             imshow(OriginalImg);
                    case '2'
                             axes(handles.window_2_2);
                             OriginalImg=imread(get(handles.loaded_file,'String'));
                             imshow(OriginalImg);
            end
   case '3'
            switch y
                    case '1'
                             axes(handles.window_1_3);
                             OriginalImg=imread(get(handles.loaded_file,'String'));
                             imshow(OriginalImg);
                    case '2'
                             axes(handles.window_2_3);
                             OriginalImg=imread(get(handles.loaded_file,'String'));
                             imshow(OriginalImg); 
            end
end
OriginalImg_2_dim=OriginalImg(:,:,1);
x=str2num(x);
y=str2num(y);
handles.windows{y,x}=dec2base(OriginalImg_2_dim',2,8);

guidata(hObject, handles);


% --- Executes on button press in clear_screen.
function clear_screen_Callback(hObject, eventdata, handles)
% hObject    handle to clear_screen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Clear SCREEN (SCREEN is black)
OriginalImg=imread('symbol_00.bmp');
axes(handles.window_1_1);
imshow(OriginalImg);
axes(handles.window_1_2);
imshow(OriginalImg);
axes(handles.window_1_3);
imshow(OriginalImg);
axes(handles.window_2_1);
imshow(OriginalImg);
axes(handles.window_2_2);
imshow(OriginalImg);
axes(handles.window_2_3);
imshow(OriginalImg);

OriginalImg_2_dim=OriginalImg(:,:,1);
for y=1:2
    for x=1:3
        handles.windows{y,x}=dec2base(OriginalImg_2_dim',2,8);
    end
end

set(handles.loaded_file, 'String', 'empty'); %Clear File name
guidata(hObject, handles);


% --- Executes on button press in create_text.
function create_text_Callback(hObject, eventdata, handles)
% hObject    handle to create_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

text_name=get(handles.text_name,'String');
file = fopen( text_name ,'wt');
for y=1:2
    for sym_row=1:32:1024
        for x=1:3
                for k=0:31
                     fprintf(file,'%s\n',handles.windows{y,x}(sym_row+k,:));
                end
        end
    end
end
fclose(file);
    
guidata(hObject, handles);


function text_name_Callback(hObject, eventdata, handles)
% hObject    handle to text_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_name as text
%        str2double(get(hObject,'String')) returns contents of text_name as a double


% --- Executes during object creation, after setting all properties.
function text_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
