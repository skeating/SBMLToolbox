function SBMLModel = Model_addUnitDefinition(SBMLModel, SBMLUnitDefinition)
%
% Model_addUnitDefinition(SBMLModel, SBMLUnitDefinition)
%       takes an SBML Model structure
%    and an SBML UnitDefinition structure
%
%       and returns
%           the Model with the UnitDefinition element added

%  Filename    :   Model_addUnitDefinition.m
%  Description :
%  Author(s)   :   SBML Development Group <sbml-team@caltech.edu>
%  $Id$
%  $Source v $
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


%get level and version and check the input arguments are appropriate

[level, version] = GetLevelVersion(SBMLModel);
[unitDefinition_level, unitDefinition_version] = GetLevelVersion(SBMLUnitDefinition);

if level ~= unitDefinition_level
	error('mismatch in levels');
elseif version ~= unitDefinition_version
	error('mismatch in versions');
end;

if isfield(SBMLModel, 'unitDefinition')
	index = length(SBMLModel.unitDefinition);
	if index == 0
		SBMLModel.unitDefinition = SBMLUnitDefinition;
	else
    if ~isfield(SBMLModel.unitDefinition(1), 'level')
      SBMLModel = propagateLevelVersion(SBMLModel);
    end;
		SBMLModel.unitDefinition(index+1) = SBMLUnitDefinition;
	end;
else
	error('unitDefinition not an element on SBML L%dV%d Model', level, version);
end;

