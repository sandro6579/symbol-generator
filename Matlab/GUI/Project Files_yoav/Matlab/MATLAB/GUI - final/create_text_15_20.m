function varargout = create_text_15_20(varargin)
%{
Model Name 	:	GUI_Tests
Generated	:	27.10.2012
Author		:	Yoav Shvartz
Project		:	Symbol Generator Project

Description: 
GUI_Test is a Graphical User Interface with which the user can build 
frames with added or removed symbols which are being loaded by the GUI.
The user can choose the time of waiting between opcodes and frames with 
the 'wait' panel.
The frames with their relevant opcodes and waiting times are written into
a test file with the name the user choose.
In additon, the user can print into another file the screen, in any given
time.

Order of actions:
1. choose a name for your test file and click the 'start' button.
2. adding symbol:
    - click the 'load symbol' button and choose a symbol to add
    - choose the coordinate (x,y). 
      remark: 
              1. x is an integer between 1 to 20
              2. y is an integer between 1 to 15  
    - click the 'show symbol' to add the symbol to the screen
    - choose time and units, to wait AFTER the opcode of the added symbol
      is executed.
      remarks: 
              1. unit [T] is 1 clock cycle.  
              2. default waiting is 0[T]
   adding symbol:
    - choose the coordinate (x,y). 
      remark: 
              1. x is an integer between 1 to 20
              2. y is an integer between 1 to 15  
    - click the 'remove symbol' to remove the symbol from the screen
    - choose time and units, to wait AFTER the opcode of the removed symbol
      is executed
3. after adding and removing symbols to and from the screen, click the 
   'create frame' button to create the frame and to write the opcodes to 
   your test file.
4. repeat stages 1-4 to add as many frames as desired.
   when finished, click the 'create test file' button to create your test 
   file
5. the test file always starts with 300 zeroed opcodes for initializing the
   test.
6. At any given time you can print the screen on th GUI to a file named 
   <name of test file>_screen. 
 
Revision:
		Number		Date		Name				Description			
		1.00		20.4.2012   Yoav Shvartz		Creation

Todo:
	(1) add a 'help' button.
    (2) arrange the GUI buttons.
    (3)
%}


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

% Last Modified by GUIDE v2.5 28-Oct-2012 21:20:40

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

handles.pic_name=0; % the symbol path name. For example: handles.pic_name = "H:\Project\Project Files\Matlab\GUI\Project Files_yoav\Matlab\MATLAB\GUI - final\symbol_00.bmp"  
handles.screen=imread('screen.bmp');
handles.opcode=cell(15,20);
handles.changed=zeros(15,20);
handles.time=cell(15,20);
handles.start=0;
axes(handles.window);
imshow(handles.screen);

for y=1:15
    for x=1:20
        handles.opcode{y,x}='000000000000000000000000';
        handles.time{y,x}='T 0';
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


% --- Executes on button press in Load_symbol.
function Load_symbol_Callback(hObject, eventdata, handles)
% hObject    handle to Load_symbol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%checking the user initiate the text file by using the 'start' button
if (handles.start==0)
    error('first click the start button');
end

[File,Dir] = uigetfile({'*.bmp; *.png; *.jpg; *.gif ; *.tif', 'Picture File (*.bmp, *.png, *.jpg, *.gif)'; '*.*', 'All files (*.*)'}, 'Choose Image Files', 'MultiSelect', 'off');
handles.pic_name = strcat(Dir,File);   %Concatenate File after Dir
set(handles.loaded_file,'String',File);
guidata(hObject, handles);

function x_loc_Callback(hObject, eventdata, handles)
% hObject    handle to x_loc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x_loc as text
%        str2double(get(hObject,'String')) returns contents of x_loc as a double

%checking the user initiate the text file by using the 'start' button
if (handles.start==0)
    set(handles.x_loc,'String','1');
    error('first click the start button');
end

x=get(handles.x_loc,'String');
x=str2num(x);
if (x<1)||(x>20)
   set(handles.x_loc,'String','1');
   error('x is out of bounds [1,20]'); 
end

guidata(hObject, handles);

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

%checking the user initiate the text file by using the 'start' button
if (handles.start==0)
    set(handles.y_loc,'String','1');
    error('first click the start button');
end

y=get(handles.y_loc,'String');
y=str2num(y);
if (y<1)||(y>15)
   set(handles.y_loc,'String','1');
   error('y is out of bounds [1,15]'); 
end

guidata(hObject, handles);

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


% --- Executes on button press in add_symbol.
function add_symbol_Callback(hObject, eventdata, handles)
% hObject    handle to add_symbol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%checking the user initiate the text file by using the 'start' button
if (handles.start==0)
    error('first click the start button');
end

x=get(handles.x_loc,'String');
y=get(handles.y_loc,'String');
x=str2num(x);
y=str2num(y);

%checkin bounds of x & y
if ( (x>20)||(x<1)||(y>15)||(y<1) )
    error(' x or y are out of bounds ( x = [1,20] y = [1,15] )');
end

axes(handles.window);
Symbol=imread(handles.pic_name);
Symbol_2_dim=Symbol(:,:,1);
handles.screen( ((y-1)*32+1):(y*32),((x-1)*32+1):(x*32) ) = Symbol_2_dim; % y = rows , x = columns 
imshow(handles.screen);

handles.changed(y,x)=1;  % image was added !

% finding the number of the loaded picture:
% example: if picture name = "...XXX_02.bmp", then pic_num = "0000000000010" (13 bits)  .
i1=find(handles.pic_name == '_',1,'last');
i2=find(handles.pic_name == '.',1,'last');
pic_num=dec2base(   str2num(handles.pic_name((i1+1):(i2-1)))  ,2  ,13);
x_bin=dec2bin(x-1,5);
y_bin=dec2bin(y-1,4);
handles.opcode{y,x}=strcat('0','1',pic_num,y_bin,x_bin);

guidata(hObject, handles);


% --- Executes on button press in clear_screen.
function clear_screen_Callback(hObject, eventdata, handles)
% hObject    handle to clear_screen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Clear SCREEN (SCREEN is black)
handles.screen=imread('screen.bmp');
axes(handles.window);
imshow(handles.screen);
for y=1:15
    for x=1:20
        handles.opcode{y,x}='000000000000000000000000';
        handles.changed(y,x)=0;
        handles.time{y,x}='T 0';
    end
end
set(handles.loaded_file, 'String', 'empty'); %Clear File name
set(handles.wait_time, 'String', '0'); %Reset  wait_time
handles.start=0; % the user needs to push 'start' buton again
guidata(hObject, handles);


% --- Executes on button press in create_text_15_20.
function create_screen_file_Callback(hObject, eventdata, handles)
% hObject    handle to create_text_15_20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
text_name=strcat(get(handles.text_name,'String'),'_screen');
file = fopen( text_name ,'wt');
screen_print = dec2base(handles.screen',2,8);
for i=1:(32*32*20*15) %number of pixels = (32*32)*20*15
    fprintf(file,'%s\n',screen_print(i,:));
end
fclose(file);
    
guidata(hObject, handles);


function text_name_Callback(hObject, eventdata, handles)
% hObject    handle to text_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_name as text
%        str2double(get(hObject,'String')) returns contents of text_name as a double

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


% --- Executes on button press in create_test_file.
function create_test_file_Callback(hObject, eventdata, handles)
% hObject    handle to create_test_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%checking the user initiate the text file by using the 'start' button
if (handles.start==0)
    error('first click the start button');
end

text_name=get(handles.text_name,'String');
file = fopen( text_name ,'at+');
fprintf(file,'-e \n');
fprintf(file,'--end of file \n');
fclose(file);

% zeroing opcodes and times for the next frame
for y=1:15
    for x=1:20
        handles.opcode{y,x}='000000000000000000000000';
        handles.changed(y,x)=0;
        handles.time{y,x}='T 0';
    end
end
   
guidata(hObject, handles);
% --- Executes on button press in remove_symbol.
function remove_symbol_Callback(hObject, eventdata, handles)
% hObject    handle to remove_symbol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%checking the user initiate the text file by using the 'start' button
if (handles.start==0)
    error('first click the start button');
end

x=get(handles.x_loc,'String');
y=get(handles.y_loc,'String');
x=str2num(x);
y=str2num(y);

%checking the user doesn't remove a black symbol  
if ( size(find(handles.screen( ((y-1)*32+1):(y*32),((x-1)*32+1):(x*32) ) == 0),1) == (32*32) )
    error('cannot clear a black symbol');
end
    
%checking bounds of x & y
if ( (x>20)||(x<1)||(y>15)||(y<1) )
    error(' x or y are out of bounds ( x = [1,20] y = [1,15] )');
end 

Symbol=imread('symbol_00.bmp');
axes(handles.window);
Symbol_2_dim=Symbol(:,:,1);
handles.screen( ((y-1)*32+1):y*32,((x-1)*32+1):x*32 ) = Symbol_2_dim;
imshow(handles.screen);

handles.changed(y,x)=-1;  % image was deleted !

x_bin=dec2bin(x-1,5);
y_bin=dec2bin(y-1,4);
handles.opcode{y,x}=strcat('0','0','0000000000000',y_bin,x_bin);

guidata(hObject, handles);


% --- Executes on button press in frame.
function frame_Callback(hObject, eventdata, handles)
% hObject    handle to frame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

text_name=get(handles.text_name,'String');
file = fopen( text_name ,'at+');
[num_of_opcodes,~]=size(find(handles.changed));
num_of_opcodes=num_of_opcodes*3;
num_of_opcodes=num2str(num_of_opcodes);

% adding new frame to "text_name" file 
fprintf(file,'-f opcode count %s  --opcode count = (number of opcodes in frame)*3 \n',num_of_opcodes);
for y=1:15
    for x=1:20
       if  (handles.changed(y,x) ~= 0 )
           if (handles.changed(y,x) == 1)
               fprintf(file,'-- adding symbol to (x,y) = (%d,%d) \n',x,y); 
               fprintf(file,'-p %s --segment 1\n',handles.opcode{y,x}(1:8));   % segment 1 (MSB at first) 
               fprintf(file,'-p %s --segment 2\n',handles.opcode{y,x}(9:16));  % segment 2 
               fprintf(file,'-p %s --segment 3\n',handles.opcode{y,x}(17:24)); % segment 3 (LSB at last)
               fprintf(file,'-t wait %s --time to wait after opcode\n',handles.time{y,x});     % time to wait after opcode 
           end
           if (handles.changed(y,x) == -1)
               fprintf(file,'-- remove symbol from (x,y) = (%d,%d) \n',x,y); 
               fprintf(file,'-p %s --segment 1\n',handles.opcode{y,x}(1:8));   % segment 1 (MSB at first) 
               fprintf(file,'-p %s --segment 2\n',handles.opcode{y,x}(9:16));  % segment 2 
               fprintf(file,'-p %s --segment 3\n',handles.opcode{y,x}(17:24)); % segment 3 (LSB at last)
               fprintf(file,'-t wait %s --time to wait after opcode\n',handles.time{y,x});     % time to wait after opcode 
           end
           % zeroing opcodes and times for the next frame
           handles.opcode{y,x}='000000000000000000000000';
           handles.changed(y,x)=0;
           handles.time{y,x}='T 0';
       end
    end
end

fprintf(file,'-t wait %s --time to wait after frame\n','T 900000'); % time to wait after frame 

fclose(file);

guidata(hObject, handles);

% --- Executes on selection change in time_unit.
function time_unit_Callback(hObject, eventdata, handles)
% hObject    handle to time_unit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns time_unit contents as cell array
%        contents{get(hObject,'Value')} returns selected item from time_unit


% --- Executes during object creation, after setting all properties.
function time_unit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to time_unit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function wait_time_Callback(hObject, eventdata, handles)
% hObject    handle to wait_time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of wait_time as text
%        str2double(get(hObject,'String')) returns contents of wait_time as a double



% --- Executes during object creation, after setting all properties.
function wait_time_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wait_time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in wait.
function wait_Callback(hObject, eventdata, handles)
% hObject    handle to wait (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%checking the user initiate the text file by using the 'start' button
if (handles.start==0)
    error('first click the start button');
end
    
%checking bounds of x & y
if ( (x>20)||(x<1)||(y>15)||(y<1) )
    error(' x or y are out of bounds ( x = [1,20] y = [1,15] )');
end 

%checking if a symbol was added/removed to coordinates (x,y)
if (handles.changed(y,x) == 0) 
    error(' cannot add waiting time to coordinates (x,y) which were not changed');
end

x=get(handles.x_loc,'String');
y=get(handles.y_loc,'String');
x=str2num(x);
y=str2num(y);

%determine how long to wait after the present opcode
list = get(handles.time_unit,'String');
val = get(handles.time_unit,'Value');
time = list{val};
%time=getCurrentPopupString(handles.time_unit);
i1=find(time == '[',1,'last');
i2=find(time == ']',1,'last');
handles.time{y,x}=[ time((i1+1):(i2-1)) ,' ', get(handles.wait_time,'String') ];
guidata(hObject, handles);

% --- Executes on button press in begin.
function begin_Callback(hObject, eventdata, handles)
% hObject    handle to begin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.start=1;

text_name=get(handles.text_name,'String');
file = fopen( text_name ,'wt');
fprintf(file,'--test name: %s \n',get(handles.text_name,'String'));
fprintf(file,'--initializing\n');
fprintf(file,'-f opcode count 900  --opcode count = (number of opcodes in frame)*3 \n');

% zeroing opcodes and times for the next frame
for y=1:15
    for x=1:20
        x_bin=dec2bin(x-1,5);
        y_bin=dec2bin(y-1,4);
        handles.opcode{y,x}=strcat('0','0','0000000000000',y_bin,x_bin);
        fprintf(file,'-p %s --segment 1\n',handles.opcode{y,x}(1:8));   % segment 1 (MSB at first) 
        fprintf(file,'-p %s --segment 2\n',handles.opcode{y,x}(9:16));  % segment 2 
        fprintf(file,'-p %s --segment 3\n',handles.opcode{y,x}(17:24)); % segment 3 (LSB at last)
        handles.opcode{y,x}='000000000000000000000000';
        handles.changed(y,x)=0;
        handles.time{y,x}='T 0';
    end
end

fprintf(file,'-t wait %s --time to wait after frame\n','T 900000'); % time to wait after frame 

fclose(file);
guidata(hObject, handles);
