function SBMLLocalParameter = LocalParameter_setId(SBMLLocalParameter, id)
% SBMLLocalParameter = LocalParameter_setId(SBMLLocalParameter, id)
%
% Takes
%
% 1. SBMLLocalParameter, an SBML LocalParameter structure
% 2. id; a string representing the id to be set
%
% Returns
%
% 1. the SBML LocalParameter structure with the new value for the id attribute
%

%<!---------------------------------------------------------------------------
% This file is part of SBMLToolbox.  Please visit http://sbml.org for more
% information about SBML, and the latest version of SBMLToolbox.
%
% Copyright (C) 2009-2016 jointly by the following organizations: 
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

[level, version] = GetLevelVersion(SBMLLocalParameter);

if isfield(SBMLLocalParameter, 'id')
	if ~ischar(id)
		error('id must be character array') ;
	else
		SBMLLocalParameter.id = id;
	end;
else
	error('id not an attribute on SBML L%dV%d LocalParameter', level, version);
end;

