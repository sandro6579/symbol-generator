function varargout = create_text_15_20(varargin)
% CREATE_TEXT_15_20 MATLAB code for create_text_15_20.fig
%      CREATE_TEXT_15_20, by itself, creates a new CREATE_TEXT_15_20 or raises the existing
%      singleton*.
%
%      H = CREATE_TEXT_15_20 returns the handle to a new CREATE_TEXT_15_20 or the handle to
%      the existing singleton*.
%
%      CREATE_TEXT_15_20('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CREATE_TEXT_15_20.M with the given input arguments.
%
%      CREATE_TEXT_15_20('Property','Value',...) creates a new CREATE_TEXT_15_20 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before create_text_15_20_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to create_text_15_20_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help create_text_15_20

% Last Modified by GUIDE v2.5 22-Aug-2012 20:56:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @create_text_15_20_OpeningFcn, ...
                   'gui_OutputFcn',  @create_text_15_20_OutputFcn, ...
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


% --- Executes just before create_text_15_20 is made visible.
function create_text_15_20_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to create_text_15_20 (see VARARGIN)

% default screen is black
% creating "windows" , "opcode" and "participate" variables:
% in the "windows" we save the symbols represented in binary base.
% in the "opcode" we create the relevant opcode for the cell.
% in the "participate" we save 0 if the cell in the screen has not changed
% and 1 if it has changed.
OriginalImg=imread('symbol_00.bmp');
OriginalImg_2_dim=OriginalImg(:,:,1);
handles.windows=cell(15,20);
handles.opcode=cell(15,20);
handles.changed=zeros(15,20);
for y=1:15
    for x=1:20
        p=strcat('w',num2str(y),'_',num2str(x));
        axes(handles.(p));
        imshow(OriginalImg);
        handles.windows{y,x}=dec2base(OriginalImg_2_dim',2,8);
        handles.opcode{y,x}='000000000000000000000000';
    end
end

% Choose default command line output for create_text_15_20
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes create_text_15_20 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = create_text_15_20_OutputFcn(hObject, eventdata, handles) 
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
p=strcat('w',y,'_',x);
pic_name=get(handles.loaded_file,'String'); 
axes(handles.(p));
OriginalImg=imread(pic_name);
imshow(OriginalImg);

OriginalImg_2_dim=OriginalImg(:,:,1);
x=str2num(x);
y=str2num(y);
handles.windows{y,x}=dec2base(OriginalImg_2_dim',2,8);
handles.changed(y,x)=1;  % image was added !

% finding the number of the loaded picture:
% exampel: if picture name = "...XXX_02.bmp", then pic_name = "0000000000010" (13 bits)  .
i1=find(pic_name == '_',1,'last');
i2=find(pic_name == '.',1,'last');
pic_num=dec2base(   str2num(pic_name((i1+1):(i2-1)))  ,2  ,8);
x_bin=dec2bin(x,5);
y_bin=dec2bin(y,4);
handles.opcode{y,x}=strcat('0','1',pic_num,y_bin,x_bin);
  
guidata(hObject, handles);


% --- Executes on button press in clear_screen.
function clear_screen_Callback(hObject, eventdata, handles)
% hObject    handle to clear_screen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Clear SCREEN (SCREEN is black)
OriginalImg=imread('symbol_00.bmp');
OriginalImg_2_dim=OriginalImg(:,:,1);
for y=1:15
    for x=1:20
        p=strcat('w',num2str(y),'_',num2str(x));
        axes(handles.(p));
        imshow(OriginalImg);
        handles.windows{y,x}=dec2base(OriginalImg_2_dim',2,8);
        handles.opcode{y,x}='000000000000000000000000';
    end
end
handles.changed=zeros(15,20);

set(handles.Opcode_File_Name, 'String','empty_Opcode');
set(handles.loaded_file, 'String', 'empty'); %Clear File name
guidata(hObject, handles);


% --- Executes on button press in create_text_15_20.
function create_text_Callback(hObject, eventdata, handles)
% hObject    handle to create_text_15_20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
text_name=strcat(get(handles.text_name,'String'),'.txt');
file = fopen( text_name ,'wt');
for y=1:15
    for sym_row=1:32:1024
        for x=1:20
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

name=get(handles.text_name,'String');
set(handles.Opcode_File_Name, 'String', strcat(name,'_Opcode'));
guidata(hObject, handles);

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


% --- Executes on button press in create_opcode.
function create_opcode_Callback(hObject, eventdata, handles)
% hObject    handle to create_opcode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

text_name=strcat(get(handles.Opcode_File_Name,'String'),'.txt');
file = fopen( text_name ,'wt');
for y=1:15
    for x=1:20
       if  (handles.changed(y,x)==1 )
            fprintf(file,'%s\n',handles.opcode{y,x});
       end
    end
end
fclose(file);

handles.changed=zeros(15,20); % zeroing the changes for the next frame
    
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function text9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object deletion, before destroying properties.
function text9_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to text9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in clear_image.
function clear_image_Callback(hObject, eventdata, handles)
% hObject    handle to clear_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

x=get(handles.x_loc,'String');
y=get(handles.y_loc,'String');
p=strcat('w',y,'_',x);
OriginalImg=imread('symbol_00.bmp');
axes(handles.(p));
imshow(OriginalImg);

OriginalImg_2_dim=OriginalImg(:,:,1);
x=str2num(x);
y=str2num(y);
handles.windows{y,x}=dec2base(OriginalImg_2_dim',2,8);
handles.changed(y,x)=-1;  % image was deleted !

x_bin=dec2bin(x,5);
y_bin=dec2bin(y,4);
handles.opcode{y,x}=strcat('0','0',pic_num,y_bin,x_bin);
handles.opcode{y,x}='000000000000000000000000';

guidata(hObject, handles);
