function varargout = GUI2(varargin)
% GUI2 MATLAB code for GUI2.fig
%      GUI2, by itself, creates a new GUI2 or raises the existing
%      singleton*.
%
%      H = GUI2 returns the handle to a new GUI2 or the handle to
%      the existing singleton*.
%
%      GUI2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI2.M with the given input arguments.
%
%      GUI2('Property','Value',...) creates a new GUI2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI2

% Last Modified by GUIDE v2.5 12-May-2017 02:43:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI2_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI2_OutputFcn, ...
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


% --- Executes just before GUI2 is made visible.
function GUI2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI2 (see VARARGIN)


    f = handles.figure1;
    %matrix table
    t = uitable('Parent',f,'Position',[60 60 400 300]);
    handles.table = t;
    set(t, 'RowName', []);
    set(t, 'ColumnName', []);
    set(t, 'ColumnWidth', 'auto');
    
    %iterative table
    t2 = uitable('Parent',f,'Position',[60 60 550 300]);
    handles.table2 = t2;
    set(t2, 'RowName', []);
    %arr = ['dsaads' , 'dasdas'];
    set(t2, 'ColumnName', []);
    set(t2, 'ColumnWidth', 'auto');

    
    %buttons
    set(handles.next_button,'Visible','off');

    %tables
    set(handles.table,'Visible','off');
    set(handles.table2,'Visible','off');

% Choose default command line output for GUI2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in method_menu.
function method_menu_Callback(hObject, eventdata, handles)
% hObject    handle to method_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    selected_item = get(hObject,'Value');
    setappdata(handles.figure1,'selected_item',selected_item); 
    switch selected_item
        case 1
            flags = {'on','on','on','on','on','on','on','on','on','on','on','on','off','off','off'};
            
        case 2
            flags = {'off','off','off','off','off','off','off','off','off','off','off','off','on','on','off'};
            
        case 3
            flags = {'off','off','off','off','off','off','off','off','off','off','off','off','on','on','off'};
        
        case 4            
            flags = {'off','off','off','off','off','off','off','off','off','off','off','off','on','on','off'};
        
        case 5
            flags = {'off','off','off','off','on','on','on','on','on','on','off','off','off','off','on'};
        
        case 6
            flags = {'off','off','off','off','on','on','on','on','on','on','off','off','off','off','on'};
        
        otherwise
    end
    showView(handles,flags);
% Hints: contents = cellstr(get(hObject,'String')) returns method_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from method_menu


% --- Executes during object creation, after setting all properties.
function method_menu_CreateFcn(hObject, ~, handles)
% hObject    handle to method_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function initial_values_txtArea_Callback(hObject, eventdata, handles)
% hObject    handle to initial_values_txtArea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of initial_values_txtArea as text
%        str2double(get(hObject,'String')) returns contents of initial_values_txtArea as a double


% --- Executes during object creation, after setting all properties.
function initial_values_txtArea_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initial_values_txtArea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over initial_values_txtArea.
function initial_values_txtArea_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to initial_values_txtArea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function tolerance_txtArea_Callback(hObject, eventdata, handles)
% hObject    handle to tolerance_txtArea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tolerance_txtArea as text
%        str2double(get(hObject,'String')) returns contents of tolerance_txtArea as a double


% --- Executes during object creation, after setting all properties.
function tolerance_txtArea_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tolerance_txtArea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in solve_button.
function solve_button_Callback(hObject, eventdata, handles)
% hObject    handle to solve_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    %disp(getappdata(handles.figure1,'selected_item'))
   
    %getting input and parse it
    data = get(handles.input_equations_textArea,'String');
    [A,B,flag] = MatrixParser(data);
    %disp(flag);
    if(flag == 0)
        callError(handles.comment_textArea,'invalid input equations',handles);
        return
    end
    %swicth on functions
    ind = getappdata(handles.figure1,'selected_item');
    
    if(ind == 1)
        [initial1,tolerance1,iteration1,flag1] = getIterativeParameters(handles,1);
        [initial2,tolerance2,iteration2,flag2] = getIterativeParameters(handles,2);
        if(flag1==0 | flag2==0)
            callError(handles.comment_textArea,'invalid extra inputs',handles);
        end
    elseif(ind == 5 | ind == 6)
        [initial,tolerance,iteration,flag] = getIterativeParameters(handles,1)
        A
        if(flag == 0 )
            callError(handles.comment_textArea,'invalid extra inputs',handles);
        end
        %B = B'
        %JacobSeidel(A,B,initial,iteration,tolerance);
    else
    end;
    
    callError(handles.comment_textArea,'',handles);
    solutionTable = [];
    solutions = [];
    len = 0;
    switch ind    
        case 1
            
        case 2
            [solutionTable,finalMatrix,solutions,condition] = Gauss(A,B)
            if(condition == 0)
                len = length(solutions);
                originalMatrix = horzcat(A,B);
                cell = num2cell(double(originalMatrix));
                set(handles.table,'Data',cell);
            else
                callError(handles.comment_textArea,'Gauss Elimination : cannot get solution',handles);
                return
            end
        case 3
            [solutionTable,finalMatrix,solutions,condition] = LUMethodMain(A,B)
            if(condition == 0)
                set(handles.table,'Data',{});
                len = length(A);
                originalMatrix = A;
                cell = num2cell(double(originalMatrix));
                set(handles.table,'Data',cell);
                setappdata(handles.figure1,'ySolutions',finalMatrix)
            else
                callError(handles.comment_textArea,'LU Decomposition : cannot get solution',handles);
                return
            end
        case 4
            [solutionTable,finalMatrix,solutions,condition] = GaussJordan(A,B)
            if(condition == 0)
                len = length(solutions);
                originalMatrix = horzcat(A,B);
                cell = num2cell(double(originalMatrix));
                set(handles.table,'Data',cell);
            else
                callError(handles.comment_textArea,'Gauss Jordan : cannot get solution',handles);
                return
            end
        case 5
           
        case 6
         
        otherwise
    end 
        
    setappdata(handles.figure1,'len',len); 
    setappdata(handles.figure1,'solutionTable',solutionTable); 
    setappdata(handles.figure1,'ind',1);
    setappdata(handles.figure1,'solutions',solutions);
    
    
    % switch cases on selected from pop menu then call the function
    %disp(input_equations)
    
function initial_values_txtArea2_Callback(hObject, eventdata, handles)
% hObject    handle to initial_values_txtArea2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of initial_values_txtArea2 as text
%        str2double(get(hObject,'String')) returns contents of initial_values_txtArea2 as a double


% --- Executes during object creation, after setting all properties.
function initial_values_txtArea2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initial_values_txtArea2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tolerance_txtArea2_Callback(hObject, eventdata, handles)
% hObject    handle to tolerance_txtArea2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tolerance_txtArea2 as text
%        str2double(get(hObject,'String')) returns contents of tolerance_txtArea2 as a double


% --- Executes during object creation, after setting all properties.
function tolerance_txtArea2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tolerance_txtArea2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input_equations_textArea_Callback(hObject, eventdata, handles)
% hObject    handle to input_equations_textArea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input_equations_textArea as text
%        str2double(get(hObject,'String')) returns contents of input_equations_textArea as a double


% --- Executes during object creation, after setting all properties.
function input_equations_textArea_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input_equations_textArea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in next_button.
function next_button_Callback(hObject, eventdata, handles)
% hObject    handle to next_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    startInd = getappdata(handles.figure1,'ind');
    % lenn = number of variables
    lenn = getappdata(handles.figure1,'len');
    matrix = getappdata(handles.figure1,'solutionTable');
    disp('start')
    disp(startInd)
    [r,c] = size(matrix)
    %disp('rows ')
    %disp(r)
    if (startInd > r)
        %in case of LU Decompsition to show [y] then [x]
        if(getappdata(handles.figure1,'selected_item') == 3)
            disp('LU');
            if(startInd == r+1)
                getappdata(handles.figure1,'ySolutions')
                set(handles.table,'Data',getappdata(handles.figure1,'ySolutions'));
                setappdata(handles.figure1,'ind',startInd+1);
            else
                set(handles.table,'Data',getappdata(handles.figure1,'solutions'));
            end
            return;
        end
        % show solutions [x]
        set(handles.table,'Data',getappdata(handles.figure1,'solutions'));
        return;
    end
    %disp(startInd)
    cell = getCell(startInd,lenn,matrix);
    setappdata(handles.figure1,'ind',startInd+lenn);
    set(handles.table,'Data',cell);

    



function iterations_txtArea1_Callback(hObject, eventdata, handles)
% hObject    handle to iterations_txtArea1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of iterations_txtArea1 as text
%        str2double(get(hObject,'String')) returns contents of iterations_txtArea1 as a double


% --- Executes during object creation, after setting all properties.
function iterations_txtArea1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iterations_txtArea1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function iterations_txtArea2_Callback(hObject, eventdata, handles)
% hObject    handle to iterations_txtArea2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of iterations_txtArea2 as text
%        str2double(get(hObject,'String')) returns contents of iterations_txtArea2 as a double


% --- Executes during object creation, after setting all properties.
function iterations_txtArea2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iterations_txtArea2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in file_button.
function file_button_Callback(hObject, eventdata, handles)
% hObject    handle to file_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    [fileName,pathName] = uigetfile('*.txt','Select the input txt file');
    readFile(fileName,pathName,handles);