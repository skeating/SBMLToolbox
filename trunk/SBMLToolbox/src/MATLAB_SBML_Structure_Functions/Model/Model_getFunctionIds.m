function FunctionIds = Model_getFunctionIds(SBMLModel)
% functionIds = Model_getFunctionIds(SBMLModel)
%
% takes
%
% 1. SBMLModel; an SBML Model structure
%
% returns
%
% 1. the value of the functionIds attribute
%

%<!---------------------------------------------------------------------------
% This file is part of SBMLToolbox.  Please visit http://sbml.org for more
% information about SBML, and the latest version of SBMLToolbox.
%
% Copyright (C) 2009-2011 jointly by the following organizations: 
%     1. California Institute of Technology, Pasadena, CA, USA
%     2. EMBL European Bioinformatics Institute (EBML-EBI), Hinxton, UK
%
% Copyright (C) 2006-2008 jointly by the following organizations: 
%     1. California Institute of Technology, Pasadena, CA, USA
%     2. University of Hertfordshire, Hatfield, UK
%
% Copyright (C) 2003-2005 jointly by the following organizations: 
%     1. California Institute of Technology, Pasadena, CA, USA 
%     2. Japan Science and Technology Agency, Japan
%     3. University of Hertfordshire, Hatfield, UK
%
% SBMLToolbox is free software; you can redistribute it and/or modify it
% under the terms of the GNU Lesser General Public License as published by
% the Free Software Foundation.  A copy of the license agreement is provided
% in the file named "LICENSE.txt" included with this software distribution.
%----------------------------------------------------------------------- -->



























%-------------------------------------------------------------------
% check input is an SBML model
if (~isValidSBML_Model(SBMLModel))
    error('Model_getFunctionIds(SBMLModel)\n%s', 'input must be an SBMLModel structure');
end;
   
FunctionIds = {};
if (SBMLModel.SBML_level == 2)
    for i = 1:length(SBMLModel.functionDefinition)
        FunctionIds{i} = SBMLModel.functionDefinition(i).id;
    end;
end;

