function SBMLConstraint = Constraint_setMetaid(SBMLConstraint, metaid)
%
% Constraint_setMetaid
%       takes an SBML Constraint structure
%    and the metaid to be set
%
%       and returns
%           the Constraint with the new value for the metaid attribute

%  Filename    :   Constraint_setMetaid.m
%  Description :
%  Author(s)   :   SBML Development Group <sbml-team@caltech.edu>
%  $Id: $
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

[level, version] = GetLevelVersion(SBMLConstraint);

if isfield(SBMLConstraint, 'metaid')
	if ~ischar(metaid)
		error('metaid must be character array') ;
	else
		SBMLConstraint.metaid = metaid;
	end;
else
	error('metaid not an attribute on SBML L%dV%d Constraint', level, version);
end;

