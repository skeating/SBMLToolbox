function varargout = BrowseModels(varargin)
% BROWSEMODELS M-file for BrowseModels.fig
%
%  Filename    : BrowseModels.m
%  Description : drives GUI that browses the data file SBML_Models
%  Author(s)   : SBML Development Group <sbml-team@caltech.edu>
%  Organization: University of Hertfordshire STRC
%  Created     : 2003-09-15
%  Revision    : $Id$
%  Source      : $Source$
%
%  Copyright 2003 California Institute of Technology, the Japan Science
%  and Technology Corporation, and the University of Hertfordshire
%
%  This library is free software; you can redistribute it and/or modify it
%  under the terms of the GNU Lesser General Public License as published
%  by the Free Software Foundation; either version 2.1 of the License, or
%  any later version.
%
%  This library is distributed in the hope that it will be useful, but
%  WITHOUT ANY WARRANTY, WITHOUT EVEN THE IMPLIED WARRANTY OF
%  MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.  The software and
%  documentation provided hereunder is on an "as is" basis, and the
%  California Institute of Technology, the Japan Science and Technology
%  Corporation, and the University of Hertfordshire have no obligations to
%  provide maintenance, support, updates, enhancements or modifications.  In
%  no event shall the California Institute of Technology, the Japan Science
%  and Technology Corporation or the University of Hertfordshire be liable
%  to any party for direct, indirect, special, incidental or consequential
%  damages, including lost profits, arising out of the use of this software
%  and its documentation, even if the California Institute of Technology
%  and/or Japan Science and Technology Corporation and/or University of
%  Hertfordshire have been advised of the possibility of such damage.  See
%  the GNU Lesser General Public License for more details.
%
%  You should have received a copy of the GNU Lesser General Public License
%  along with this library; if not, write to the Free Software Foundation,
%  Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
%
%  The original code contained here was initially developed by:
%
%      Sarah Keating
%      Science and Technology Research Centre
%      University of Hertfordshire
%      Hatfield, AL10 9AB
%      United Kingdom
%
%      http://www.sbml.org
%      mailto:sbml-team@caltech.edu
%
%  Contributor(s):
%
% varargout = BrowseModels(number) raises a GUI that browses the data file
% SBML_Models.dat
%
% number is the the number of output arguments
%   number = 0 - no output expected (ie no model to be loaded)
%   number = 1 - output expected (ie return model)
%
% This GUI should be called using BrowseSBML_Models.m

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BrowseModels_OpeningFcn, ...
                   'gui_OutputFcn',  @BrowseModels_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin & isstr(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before BrowseModels is made visible.
function BrowseModels_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to BrowseModels (see VARARGIN)

% Choose default command line output for BrowseModels
handles.output = hObject;
handles.nargout = varargin{1};
handles.Model_l1_Index = 1;
handles.Model_l2_Index = 1;

% read in the file
load 'SBML_Models';
if (exist('Models_l1') == 0) 
   [m, n_level2] = size(Models_l2);
   n_level1 = 0;
   handles.Models_l1 = 0;
   handles.Models_l2 = Models_l2;
elseif (exist('Models_l2') == 0)
   [m, n_level1] = size(Models_l1);
   n_level2 = 0;               
   handles.Models_l1 = Models_l1;
   handles.Models_l2 = 0;
else
   [m, n_level1] = size(Models_l1);
   [m, n_level2] = size(Models_l2);
   handles.Models_l1 = Models_l1;
   handles.Models_l2 = Models_l2;
end;

% save in data 
handles.n_level1 = n_level1;
handles.n_level2 = n_level2;

handles.Level = 1;

for nNumber = 1:n_level1
    ListNames_l1{nNumber} = Models_l1(nNumber).name;
end;
if (n_level1 == 0)
    ListNames_l1 = 'None saved';
end;
for nNumber = 1:n_level2
    Name = Models_l2(nNumber).name;
    k = isempty(Name);
    if (k == 1)
        Name = Models_l2(nNumber).id;
    end;
    ListNames_l2{nNumber} = Name;
end;
if (n_level2 == 0)
    ListNames_l2 = 'None saved';
end;

ListLevels{1} = '1';
ListLevels{2} = '2';

set(handles.ListModels, 'String', ListNames_l1);
set(handles.SelModel, 'String', Models_l1(handles.Model_l1_Index).name);
set(handles.LevelListbox, 'String', ListLevels);

if (n_level1 == 0)
    handles.ListNames_l1 = 0;
    handles.ListNames_l2 = ListNames_l2;
elseif (n_level2 == 0)
    handles.ListNames_l1 = ListNames_l1;
    handles.ListNames_l2 = 0;
else
    handles.ListNames_l1 = ListNames_l1;
    handles.ListNames_l2 = ListNames_l2;
end;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes BrowseModels wait for user response (see UIRESUME)
if (handles.nargout > 0)
    set(handles.Close, 'Enable', 'off');
else
    set(handles.LoadModel, 'Enable', 'off');
end;
uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = BrowseModels_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
    close(handles.figure1);


% --- Executes on button press in ViewModel.
function ViewModel_Callback(hObject, eventdata, handles)
% hObject    handle to ViewModel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if (handles.Level == 1)
    ViewModel(handles.Models_l1(handles.Model_l1_Index));
else
    ViewModel(handles.Models_l2(handles.Model_l2_Index));
end;


% --- Executes on button press in LoadModel.
function LoadModel_Callback(hObject, eventdata, handles)
% hObject    handle to LoadModel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if (handles.Level == 1)
    handles.output = LoadSBMLModel(handles.Model_l1_Index, 1);
else
    handles.output = LoadSBMLModel(handles.Model_l2_Index, 2);
end;
set(handles.Close, 'Enable', 'on');
set(handles.LoadModel, 'Enable', 'off');

guidata(hObject, handles);

%uiresume;

% --- Executes on button press in DeleteModel.
function DeleteModel_Callback(hObject, eventdata, handles)
% hObject    handle to DeleteModel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if (handles.Level == 1)
    DeleteSBMLModel(handles.Model_l1_Index, 1);
else
    DeleteSBMLModel(handles.Model_l2_Index, 2);
end;

load 'SBML_Models';
if (exist('Models_l1') == 0) 
   [m, n_level2] = size(Models_l2);
   n_level1 = 0;
   handles.Models_l1 = 0;
   handles.Models_l2 = Models_l2;
elseif (exist('Models_l2') == 0)
   [m, n_level1] = size(Models_l1);
   n_level2 = 0;               
   handles.Models_l1 = Models_l1;
   handles.Models_l2 = 0;
else
   [m, n_level1] = size(Models_l1);
   [m, n_level2] = size(Models_l2);
   handles.Models_l1 = Models_l1;
   handles.Models_l2 = Models_l2;
end;

% save in data 
handles.n_level1 = n_level1;
handles.n_level2 = n_level2;

for nNumber = 1:n_level1
    ListNames_l1{nNumber} = Models_l1(nNumber).name;
end;
for nNumber = 1:n_level2
    Name = Models_l2(nNumber).name;
    k = isempty(Name);
    if (k == 1)
        Name = Models_l2(nNumber).id;
    end;
    ListNames_l2{nNumber} = Name;
end;
if (n_level1 == 0)
    handles.ListNames_l1 = 0;
    handles.ListNames_l2 = ListNames_l2;
elseif (n_level2 == 0)
    handles.ListNames_l1 = ListNames_l1;
    handles.ListNames_l2 = 0;
else
    handles.ListNames_l1 = ListNames_l1;
    handles.ListNames_l2 = ListNames_l2;
end;

if (handles.Level == 1)
    if (handles.Model_l1_Index > n_level1)
       handles.Model_l1_Index = n_level1;
   end;
   set(handles.ListModels, 'Value', handles.Model_l1_Index);
   set(handles.ListModels, 'String', ListNames_l1);
   set(handles.SelModel, 'String', handles.ListNames_l1(handles.Model_l1_Index));
else
    if (handles.Model_l2_Index > n_level2)
       handles.Model_l2_Index = n_level2;
   end;
   set(handles.ListModels, 'Value', handles.Model_l2_Index);
   set(handles.ListModels, 'String', ListNames_l2);
   set(handles.SelModel, 'String', handles.ListNames_l2(handles.Model_l2_Index));
end;
%set(handles.ListModels, 'Value', handles.ModelIndex);
%set(handles.ListModels, 'String', ListNames);
%set(handles.SelModel, 'String', handles.Models(handles.ModelIndex).Name);

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in Close.
function Close_Callback(hObject, eventdata, handles)
% hObject    handle to Close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isequal(get(handles.figure1, 'waitstatus'), 'waiting')
    % The GUI is still in UIWAIT, us UIRESUME
    uiresume(handles.figure1);
else
    % The GUI is no longer waiting, just close it
    delete(handles.figure1);
end


% --- Executes during object creation, after setting all properties.
function ListModels_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ListModels (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on selection change in ListModels.
function ListModels_Callback(hObject, eventdata, handles)
% hObject    handle to ListModels (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if (handles.Level == 1)
    handles.Model_l1_Index = get(handles.ListModels, 'Value');
   set(handles.SelModel, 'String', handles.ListNames_l1(handles.Model_l1_Index));
else
   handles.Model_l2_Index = get(handles.ListModels, 'Value');
   set(handles.SelModel, 'String', handles.ListNames_l2(handles.Model_l2_Index));
end;   
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function LevelListbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LevelListbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on selection change in LevelListbox.
function LevelListbox_Callback(hObject, eventdata, handles)
% hObject    handle to LevelListbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns LevelListbox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from LevelListbox

handles.Level = get(handles.LevelListbox, 'Value');
handles.Model_l1_Index = 1;
handles.Model_l2_Index = 1;

if (handles.Level == 1)
    set(handles.ListModels, 'String', handles.ListNames_l1);
    set(handles.SelModel, 'String', handles.Models_l1(handles.Model_l1_Index).name);
    set(handles.ListModels, 'Value', handles.Model_l1_Index);
else
    set(handles.ListModels, 'String', handles.ListNames_l2);
    set(handles.SelModel, 'String', handles.ListNames_l2(handles.Model_l2_Index));
    set(handles.ListModels, 'Value', handles.Model_l2_Index);
end;
guidata(hObject, handles);



