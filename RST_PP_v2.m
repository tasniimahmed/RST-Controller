function varargout = RST_PP_v2(varargin)
% RST_PP_V2 MATLAB code for RST_PP_v2.fig
%      RST_PP_V2, by itself, creates a new RST_PP_V2 or raises the existing
%      singleton*.
%
%      H = RST_PP_V2 returns the handle to a new RST_PP_V2 or the handle to
%      the existing singleton*.
%
%      RST_PP_V2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RST_PP_V2.M with the given input arguments.
%
%      RST_PP_V2('Property','Value',...) creates a new RST_PP_V2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RST_PP_v2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RST_PP_v2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RST_PP_v2

% Last Modified by GUIDE v2.5 02-Apr-2010 19:39:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RST_PP_v2_OpeningFcn, ...
                   'gui_OutputFcn',  @RST_PP_v2_OutputFcn, ...
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


% --- Executes just before RST_PP_v2 is made visible.
function RST_PP_v2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RST_PP_v2 (see VARARGIN)

% Choose default command line output for RST_PP_v2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes RST_PP_v2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
%handles
%figure1 output
%text1~19   edit1~19
%checkbox1 checkbox2 checkbox3
%pushbutton1 pushbutton2
%axes1 axes2

%Ts             text1/edit1
%Plant	delay: text2/edit2, num: text3/edit3, den: text4/edit4
%               B(z): text5/edit5, A(z): text6/edit6
%Regulation     w0: text7/edit7, zeta: text8/edit8, P(z): text11/edit11
%Tracking       w0: text9/edit9, zeta:text10/edit10
%               Bm(z): text12/edit12, Am(z): text13/edit13
%Hr: text14/edit14, Hs: text15/edit15, dist. freq.: text16/edit16
%R: text17/edit17, S: text18/edit18, T: text19/edit19
%Continuous plant: checkbox1, Cont. criteria: checkbox2
%Rem. zeros: checkbox3
%Update plant: push button1, Solve: pushbutton2

set(handles.edit1, 'string','1');%Ts

        %continuous plant
set(handles.edit2, 'string','0.6');%delay   %3 0.6
set(handles.edit3, 'string','1');%num
set(handles.edit4, 'string','[10 1]');%den

set(handles.checkbox1, 'value',0);%discrete plant

        %discrete plant
set(handles.edit5, 'string','[0 0.1 0.2]');%Bp
set(handles.edit6, 'string','[1 -1.3 0.42]');%Ap

set(handles.checkbox2, 'value',1);%continuous design criteria

        %reguation P(z)
set(handles.edit7, 'string','0.4');%w0
set(handles.edit8, 'string','0.9');%zeta
set(handles.edit11, 'string','[1 -1.3741 0.4867]');%P (just in case)

        %tracking Bm(z)/Am(z)
set(handles.edit9, 'string','0.5');%w0
set(handles.edit10, 'string','0.9');%zeta
set(handles.edit12, 'string','[0.0927 0.0687]');%Bm
set(handles.edit13, 'string','[1 -1.2451 0.4066]');%Am (just in case)

set(handles.edit14, 'string','1');%Hr
set(handles.edit15, 'string','1');%Hs
set(handles.edit16, 'string','0');%disturcance cosine frequency
%set(handles.edit16, 'string','[1 -1]');%disturbance den

set(handles.checkbox3, 'value',0);
%set(handles.checkbox3, 'string','Unused');%cancel zeros


pushbutton2_Callback(0, 0, handles);


% --- Outputs from this function are returned to the command line.
function varargout = RST_PP_v2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)%Ts
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



function edit2_Callback(hObject, eventdata, handles)%Plant cont delay
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)%Plant cont num
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)%Plant cont den
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)%Bp(z)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)%Ap(z)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)%Reg. w0
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)%Reg. zeta
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)%Track w0
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)%Track zeta
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)%P(z)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)%Bm(z)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)%Am(z)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)%Hr
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)%Hs
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)%Disturbance den
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit17_Callback(hObject, eventdata, handles)%R
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit18_Callback(hObject, eventdata, handles)%S
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit19_Callback(hObject, eventdata, handles)%T
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)%[ ] cont. plant
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)%[ ] cont. criteria
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)%[ ] remove zeros
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)%continuous curve
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4
[Ts Bp Ap Hr Hs dist P Bm Am]=acquire_data(handles);

R=str2num(get(handles.edit17, 'string'));%full R S T values
S=str2num(get(handles.edit18, 'string'));
T=str2num(get(handles.edit19, 'string'));


simulate_RST(Ts, Bp, Ap, R, S, T, Bm, Am, dist, handles);




function P=z_polynomial(w0, zeta, Ts)
s=w0*(-zeta+1i*sqrt(1-zeta*zeta));
z=exp(s*Ts);
rez=real(z); imz=imag(z);
P=[1, -2*rez, rez*rez+imz*imz];

function lz=count_leading_zeros(v)
size_v=size(v);
if size_v(1)<size_v(2)%horizontal vector
    v=v';
end
size_v=size(v);
lz=0;
for k=1:size_v(1)
    if v(k)==0
        lz=lz+1;
    else
        break;
    end
end

function [Ts B A Hr Hs dist P Bm Am]=acquire_data(handles)
c=clock;
iteration_time=sprintf('%d-%d-%d %d:%d:%f', c(1), c(2), c(3), c(4), c(5), c(6))

Ts=str2double(get(handles.edit1, 'string'));
BW=0;%rad/s
%GET PLANT PTF
if get(handles.checkbox1, 'value')%continuous plant
    num=str2num(get(handles.edit3, 'string'));
    den=str2num(get(handles.edit4, 'string'));
    delay=str2double(get(handles.edit2, 'string'));
    sysc=tf(num, den, 'iodelay', delay);
    sysd=c2d(sysc, Ts, 'zoh');
    [B A]=tfdata(sysd, 'v');
    
    %get bandwidth
    BW=max(abs(roots(den)));
    
    B=padarray(B', sysd.ioDelay, 0, 'pre')';
    %get discretized delay
    %r1=step(sysd, 0:Ts:100);
    %totaldelay=count_leading_zeros(r1);
    %Bdelay=count_leading_zeros(B);
    %B=padarray(B', totaldelay-Bdelay, 0, 'pre')';
    set(handles.edit5, 'string',['[' num2str(B) ']']);
    set(handles.edit6, 'string',['[' num2str(A) ']']);
else                                 %discrete plant
    B=str2num(get(handles.edit5, 'string'));
    A=str2num(get(handles.edit6, 'string'));
end
%GET REGULATION P(z) & TRACKING Bm(z)/Am(z)
if get(handles.checkbox2, 'value')%continuous design criteria
    w0  =str2double(get(handles.edit7, 'string'));
    zeta=str2double(get(handles.edit8, 'string'));
    
    P=z_polynomial(w0, zeta, Ts);
    set(handles.edit11, 'string',['[' num2str(P) ']']);
    BW=max([BW w0]);
    
    w0  =str2double(get(handles.edit9, 'string'));
    zeta=str2double(get(handles.edit10, 'string'));
    Am=z_polynomial(w0, zeta, Ts);
    set(handles.edit13, 'string',['[' num2str(Am) ']']);
    BW=max([BW w0]);
    
    Bm=sum(Am);%Bm(z)=Am(1)
    set(handles.edit12, 'string',['[' num2str(Bm) ']']);
else                            %discrete design criteria
    P =str2num(get(handles.edit11, 'string'));
    Am=str2num(get(handles.edit13, 'string'));
	Bm=str2num(get(handles.edit12, 'string'));
end
set(handles.figure1, 'NumberTitle','off', 'Name',sprintf('RST Pole Placement v2. Nyquist period=%fs.', pi/BW));%%



Hr=str2num(get(handles.edit14, 'string'));
Hs=str2num(get(handles.edit15, 'string'));
distf=str2double(get(handles.edit16, 'string'));
if distf==0
    dist=[1 -1];
else
    dist=[1, -2*cos(2*pi*distf*Ts), 1];
end

function no_int=has_no_integrator(A)%finds if A has no integrator
r=roots(A);
sr=size(r);
no_int=true;
for k=1:sr(1)
    if r(k)==1
        no_int=false;
    end
end

function [B_stable B_unstable]=separate_B(B)
lz=count_leading_zeros(B);
gain=B(lz+1);%find polynomial gain
r=roots(B);
B_stable=1; B_unstable=1;
sr=size(r);
for k=1:sr(1)
    if abs(r(k))>=1 %unstable & critical zeros
        B_unstable=conv(B_unstable, [1 -r(k)]);
    else            %stable zeros
        B_stable=conv(B_stable, [1 -r(k)]);
    end
end
B_stable=B_stable*gain;%put the gain in the cancelled part
B_unstable=padarray(B_unstable', lz, 0, 'pre')';%put the delays in non-cancelled part

function [t X ref_size]=sim_response(sim_time, t_ref, t_dist, TF_ref, TF_dist, Ts)
res_ref =step(TF_ref, 0:(sim_time-t_ref));
res_dist=impulse(TF_dist, 0:(sim_time-t_dist));
ref_size=size(res_ref);
res_ref  =padarray(res_ref,  t_ref,  0, 'pre');
res_dist =padarray(res_dist, t_dist, 0, 'pre');
t=0:Ts:(sim_time*Ts);
X=res_ref-0.25*res_dist;%disturbance is a negative quarter-step

function simulate_RST(Ts, B, A, R, S, T, Bm, Am, dist, handles)
%CALCULATE TFs:
track=filt(Bm, Am);
AS=conv(A, S);
BR=conv(B, R);
size_AS=size(AS);
size_BR=size(BR);
if size_AS(2)>size_BR(2)%AS longer than BR
    BR=padarray(BR', size_AS(2)-size_BR(2), 0, 'post')';
else
    if size_AS(2)<size_BR(2)%BR longer than AS
        AS=padarray(AS', size_BR(2)-size_AS(2), 0, 'post')';
    end
end
den=AS+BR;

%'c(z)/r(z):'
c_r=minreal(track*filt(conv(T, B), den));

%'Output sensitivity fn c(z)/D(z):'
c_D=minreal(filt(AS, den));

%'U(z)/r(z):'
U_r=minreal(track*filt(conv(T, A), den));

%'U(z)/D(z):'
U_D=minreal(filt(conv(A, -R), den));

D=filt(1, dist);

%RESPONSE PLOTS
sim_time=100; t_ref=5; t_dist=50;

continuous_curve=get(handles.checkbox4, 'value');
[t PlantOutput ref_size]=sim_response(sim_time, t_ref, t_dist, c_r, c_D*D, Ts);
reference=ones(ref_size);
reference=padarray(reference, t_ref, 0, 'pre');
%stairs(handles.axes1, t,PlantOutput);
if continuous_curve
    plot(handles.axes1, t,reference,'-', t,PlantOutput,'-');
else
    plot(handles.axes1, t,reference,'.', t,PlantOutput,'o');
end
set(handles.axes1, 'XMinorGrid','on', 'YMinorGrid','on');
title(handles.axes1, sprintf('Plant output, step disturbance at %g s', t_dist*Ts));

[t ControlSignal ref_size]=sim_response(sim_time, t_ref, t_dist, U_r, U_D*D, Ts);
%stairs(handles.axes2, t,ControlSignal);
if continuous_curve
    plot(handles.axes2, t,ControlSignal,'-');
else
    plot(handles.axes2, t,ControlSignal,'o');
end
set(handles.axes2, 'XMinorGrid','on', 'YMinorGrid','on');
title(handles.axes2, sprintf('Control signal, step disturbance at %g s', t_dist*Ts));

% --- Executes on button press in pushbutton1.
%the following function is the call back of the updat plant
function pushbutton1_Callback(hObject, eventdata, handles)%update plant only
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[Ts Bp Ap Hr Hs dist P Bm Am]=acquire_data(handles);

%generating header file for the input at 2/6/2019
input_file = fopen('input_file.h','w');
fprintf(input_file, '#ifndef _INPUT_H_\n');

fprintf(input_file, '#define _INPUT_H_\n');

%defining the A vector entered by the user as an array
%it's size defined by length() function
fprintf(input_file, 'extern const float Ap[');
fprintf(input_file, num2str(length(Ap)));
fprintf(input_file, '];\n');
%defining the B vector entered by the user as an array
%it's size defined by length() function
fprintf(input_file, 'extern const float Bp[');
fprintf(input_file, num2str(length(Bp)));
fprintf(input_file, '];\n');
%defining the sampling time in the header file
fprintf(input_file, 'extern const float Ts;\n');
fclose(input_file);
%generating source file to save the vales of the input at 3/6/2019
input_file_c = fopen('input_file.c','w');
%including the header file of the definitions
fprintf(input_file_c, '#include \"input_file.h\"\n');
%saving the values of the A vector from the user
fprintf(input_file_c, 'const float Ap[]= {');
%looping till the length of the vector
for i=1 : length(Ap)
    if i == length(Ap)
        fprintf(input_file_c,' %f}; \n',Ap(i));
        
    else
        fprintf(input_file_c,' %f,',Ap(i));
    end
end  

fclose(input_file_c);
input_file_c = fopen('input_file.c','a');
%saving the values of the A vector from the user
fprintf(input_file_c,'const float Bp[]= {');
%looping till the length of the vector
for i=1 : length(Bp)
    if i == length(Bp)
        fprintf(input_file_c,' %f}; \n',Bp(i));
        
    else
        fprintf(input_file_c,' %f,',Bp(i));
    end
end   

input_file_c = fopen('input_file.c','a');
%saving the value of the sampling time
fprintf(input_file_c,'const float Ts= %f ; \n',Ts);
fclose(input_file_c);

R=str2num(get(handles.edit17, 'string'));%full R S T values
S=str2num(get(handles.edit18, 'string'));
T=str2num(get(handles.edit19, 'string'));

simulate_RST(Ts, Bp, Ap, R, S, T, Bm, Am, dist, handles);


% --- Executes on button press in pushbutton2.
%the following function is the callback of solve button
function pushbutton2_Callback(hObject, eventdata, handles)%solve
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[Ts Bp Ap Hr Hs dist P Bm Am]=acquire_data(handles);
zeta=str2double(get(handles.edit8, 'string'));
w=str2double(get(handles.edit7, 'string'));
input_file = fopen('input_file.h','a');
%defining zeta in the header file in 6/6/2019
fprintf(input_file,'extern const float zeta;\n');
fclose(input_file);
%saving the value of zeta in the source file
input_file_c = fopen('input_file.c','a');
fprintf(input_file_c,'const float zeta= %f ; \n',zeta);
fclose(input_file_c);
input_file = fopen('input_file.h','a');
%defining w in header
fprintf(input_file,'extern const float w;\n');
fprintf(input_file,'#endif\n');
fclose(input_file);
%saving value of w in source file
input_file_c = fopen('input_file.c','a');
fprintf(input_file_c,'const float w= %f ; \n',w);
fclose(input_file_c);
Bps=[]; Bpu=[];
if get(handles.checkbox3, 'value')  %cancel stable zeros
    [Bps Bpu]=separate_B(Bp);
else                                %don't cancel
    Bps=1; Bpu=Bp;
end

%SOLUTION
%Ap Hs S + Bp Hr R = P      (no zeros cancelled)
S_has_integrator=has_no_integrator(Ap);
Hs_full=[];
if S_has_integrator
    Hs_full=conv(Hs, [1 -1]);
else
    Hs_full=Hs;
end
%filters
A=conv(Ap, Hs_full)';
B=conv(Bpu, Hr)';
nA=size(A); nA=nA(1)-1;%vertical vector size, power of z = size-1
nB=size(B); nB=nB(1)-1;
A=padarray(A, nB-1, 0, 'post');
B=padarray(B, nA-1, 0, 'post');
M=[];
for k=1:nB
    M=[M A];
    A=circshift(A, 1);
end
for k=(nB+1):(nB+nA)
    M=[M B];
    B=circshift(B, 1);
end
%M
n=size(M);  n=n(1);%M is a square matrix
nP=size(P); nP=nP(2);
P_full=padarray(P', n-nP, 0, 'post');
SR=M\P_full;

%Extract R, S, T
R=SR((nB+1):(nB+nA))';
S=SR(1:nB)';
if S_has_integrator
    S=conv(S, [1, -1]);
end
S=conv(S, Bps);
T=P/sum(Bpu);%(no zeros cancelled)
R=conv(R, Hr);
S=conv(S, Hs);
set(handles.edit17, 'string',['[' num2str(R) ']']);%full R S T values for Update plant & Simulink buttons
set(handles.edit18, 'string',['[' num2str(S) ']']);
set(handles.edit19, 'string',['[' num2str(T) ']']);

%generating the output header file for RST
%written in 9/6/2020
output_file_h = fopen('output_file.h','w');
fprintf(output_file_h, '#ifndef _RST_H_\n');
fprintf(output_file_h, '#define _RST_H_\n');
%Defining the R as an array
fprintf(output_file_h, 'extern const float R[');
fprintf(output_file_h, num2str(length(R)));
fprintf(output_file_h, '];\n');
%defining S as an array
fprintf(output_file_h, 'extern const float S[');
fprintf(output_file_h, num2str(length(S)));
fprintf(output_file_h, '];\n');
%defining T as an array
fprintf(output_file_h, 'extern const float T[');
fprintf(output_file_h, num2str(length(T)));
fprintf(output_file_h, '];\n');
fprintf(output_file_h, '#endif');
fclose(output_file_h);
%generating source file for the RST values
output_file = fopen('output_file.c','w');
fprintf(output_file, '#include \"output_file.h\"\n');
fprintf(output_file,'const float R[]={');
%looping till size of R to save all values
for i=1 : length(R)
    if i == length(R)
        fprintf(output_file,' %f}; \n',R(i));
    else
        fprintf(output_file,' %f,',R(i));
    end
end   
fclose(output_file);

output_file = fopen('output_file.c','a');
fprintf(output_file,'const float S[]={');
%looping till size of S to save all values
for i=1 : length(S)
    if i == length(S)
        fprintf(output_file,' %f}; \n',S(i));
        
    else
        fprintf(output_file,' %f,',S(i));
    end
end   
fclose(output_file);

output_file = fopen('output_file.c','a');
%looping till size of T to save all values
fprintf(output_file,'const float T[]={');
for i=1 : length(T)
    if i == length(T)
        fprintf(output_file,' %f}; \n',T(i));
        
    else
        fprintf(output_file,' %f,',T(i));
    end
end   
fclose(output_file);
simulate_RST(Ts, Bp, Ap, R, S, T, Bm, Am, dist, handles);


% --- Executes on button press in pushbutton3.
%the following function is the call back of solve
%That automatically generates simulink model and the c code
function pushbutton3_Callback(hObject, eventdata, handles)%generate Simulink model
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[Ts Bp Ap Hr Hs dist P Bm Am]=acquire_data(handles);

R=str2num(get(handles.edit17, 'string'));%full R S T values
S=str2num(get(handles.edit18, 'string'));
T=str2num(get(handles.edit19, 'string'));

c=clock;
name=sprintf('System_%d%02d%02d_%02d%02d_%02d', c(1), c(2), c(3), c(4), c(5), round(c(6)));
sim_time=100; t_ref=5; t_dist=50;
str_Ts=num2str(Ts);
x=0; y=0;
%generating the whole system
sys=new_system(name);
set_param(name, 'stoptime',num2str(sim_time));
x=x+0; y=y+100;%step position
%creating subsystem of the controller
%written in 10/6/2020
add_block('simulink/Ports & Subsystems/Subsystem',[name '/Mysubsystem']);
set_param([name '/Mysubsystem'],'Position',[380 87 480 180]);
%making the subsystem of two inputs
add_block('simulink/Ports & Subsystems/In1',[name '/Mysubsystem/In2']);
%setting position
set_param([name '/Mysubsystem/In2'],'Position',[1100 120 1150 150]);
add_block('simulink/Sources/Step', [name '/Reference'], 'position',[x, y, x+30, y+30],...
    'time',num2str(t_ref*Ts), 'sampletime',str_Ts);
x=x+30;%step width
x=x+35;%spacing
add_block('simulink/Discrete/Discrete Filter', [name '/Bm(z)//Am(z)'], 'position',[x, y, x+195, y+30],...
    'numerator',['[' num2str(Bm) ']'], 'denominator',['[' num2str(Am) ']'], 'sampletime',str_Ts);
x=x+195;%tracking width
add_line(name, 'Reference/1', 'Bm(z)//Am(z)/1');

x=x+35;%spacing
%adding the T block of the controller in the subsystem
add_block('simulink/Discrete/Discrete Filter', [name '/Mysubsystem/T(z)'], 'position',[x, y, x+195, y+30],...
    'numerator',['[' num2str(T) ']'], 'denominator','[1]', 'sampletime',str_Ts);
x=x+195;%T width
add_line(name, 'Bm(z)//Am(z)/1', 'Mysubsystem/1');
add_line([name '/Mysubsystem'], 'In1/1','T(z)/1' );

x=x+25;%spacing
add_block('simulink/Math Operations/Sum', [name '/Mysubsystem/Sum1'], 'position',[x, y+5, x+20, y+5+20],...
    'inputs','|+-');
x=x+20;%sum width
x=x+20;%spacing
x=x+195;%Hs width
x=x+35;%spacing
%adding the S block of the controller in the subsystem
add_block('simulink/Discrete/Discrete Filter', [name '/Mysubsystem/1//S(z)'], 'position',[x, y, x+195, y+30],...
    'numerator','[1]', 'denominator',['[' num2str(S) ']'], 'sampletime',str_Ts);
x=x+195;%S width
%adding T to the sum to be added with R to give S
add_line([name '/Mysubsystem'] , 'Sum1/1', '1//S(z)/1');
add_line([name '/Mysubsystem'],'T(z)/1' ,'Sum1/1');
x=x+330;%make space for possible continuous plant
add_block('simulink/Math Operations/Sum', [name '/Sum2'], 'position',[x, y+5, x+20, y+5+20],...
    'inputs','++|');
x=x+20;%sum width
x=x-285;%return till after S
if get(handles.checkbox1, 'value')%continuous plant
    add_block('simulink/Discrete/Zero-Order Hold', [name '/Zero-Order Hold'], 'position',[x, y, x+35, y+30]);
    x=x+35;%ZOH width
    x=x+35;%spacing
    add_block('simulink/Continuous/Transport Delay', [name '/Plant Delay'], 'position',[x, y, x+30, y+30],...
        'delaytime',get(handles.edit2, 'string'));
    x=x+30;%delay width
    x=x+35;%spacing
    add_block('simulink/Continuous/Transfer Fcn', [name '/Gp(s)'], 'position',[x, y, x+120, y+30],...
        'numerator',get(handles.edit3,'string'), 'denominator',get(handles.edit4,'string'));
    x=x+120;%Gp width
else%discrete plant
    add_block('simulink/Discrete/Discrete Filter', [name '/Bp(z)//Ap(z)'], 'position',[x, y+50, x+195, y+80],...
        'numerator',['[' num2str(Bp) ']'], 'denominator',['[' num2str(Ap) ']'], 'sampletime',str_Ts);
    x=x+195;%plant width
    add_line(name, 'Mysubsystem/1', 'Bp(z)//Ap(z)/1');
    add_line(name, 'Bp(z)//Ap(z)/1', 'Sum2/2');
end

x=x+35;%spacing till sum2
x=x-135;%new branch
add_block('simulink/Sources/Sine Wave', [name '/Disturbance'], 'position',[x, 0, x+30, 0+30],...
    'amplitude','-0.25', 'frequency',get(handles.edit16,'string'), 'phase','pi/2', 'sampletime',str_Ts);
x=x+30;%disturbance width
x=x+40;%spacing
add_block('simulink/Continuous/Transport Delay', [name '/Disturbance Delay'], 'position',[x, 0, x+30, 0+30],...
    'delaytime',num2str(t_dist*Ts));
x=x+30;%delay width
add_line(name, 'Disturbance/1', 'Disturbance Delay/1');
add_line(name, 'Disturbance Delay/1', 'Sum2/1');
x=x+125;%spacing from dist. delay till mux
add_block('simulink/Signal Routing/Mux', [name '/Mux'], 'position',[x, y-15, x+5, y-15+38]);
x=x+5;%mux width
x=x+35;%spacing
%showing the output on a scope
add_block('simulink/Sinks/Scope', [name '/Scope'], 'position',[x, y, x+30, y+32]);
add_line(name, 'Mysubsystem/1', 'Mux/1');
add_line(name, 'Sum2/1', 'Mux/2');
add_line(name, 'Sum2/1','Mysubsystem/2' );
add_line(name, 'Mux/1', 'Scope/1');
%feedback blocks
x=x-465; y=y+110;%from scope left edge to R
% the R block of the controller
block_R=add_block('simulink/Discrete/Discrete Filter', [name '/Mysubsystem/R(z)'], 'position',[x, y, x+195, y+30],...
    'numerator',['[' num2str(R) ']'], 'denominator','[1]', 'sampletime',str_Ts, 'orientation','left');
x=x-195;%R width
add_line([name '/Mysubsystem'], 'In2/1', 'R(z)/1');
delete_line([name '/Mysubsystem'], 'In1/1','Out1/1' );
add_line([name '/Mysubsystem'], '1//S(z)/1','Out1/1' );
set_param([name '/Mysubsystem/Out1'],'Position',[1100 70 1150 100]);
x=x-35;%spacing
x=x-195;
add_line([name '/Mysubsystem'], 'R(z)/1', 'Sum1/2');

%Configration for microcontroller as cortex m in config file
%Automatically generating c code
Simulink.BlockDiagram.loadActiveConfigSet( name, 'config.m');
rtwbuild([name '/Mysubsystem']);
open_system(sys);
%clear;
