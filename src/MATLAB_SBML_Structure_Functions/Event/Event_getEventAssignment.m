function eventAssignment = Event_getEventAssignment(SBMLEvent, index)
%
% Event_getEventAssignment
%       takes an SBML Event structure
%    and an index
%
%       and returns
%           the value of the eventAssignment element at the indexed position

%  Filename    :   Event_getEventAssignment.m
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

[level, version] = GetLevelVersion(SBMLEvent);

if isfield(SBMLEvent, 'eventAssignment')
	if (~isIntegralNumber(index) || index <= 0)
		error('index must be a positive integer');
	elseif index <= length(SBMLEvent.eventAssignment)
		eventAssignment = SBMLEvent.eventAssignment;
	else
		error('index is out of range');
	end;
else
	error('eventAssignment not an element on SBML L%dV%d Event', level, version);
end;

