function SBMLSpeciesReference = SpeciesReference_setConstant(SBMLSpeciesReference, constant)
%
% SpeciesReference_setConstant
%    takes an SBML SpeciesReference structure
%    and the constant to be set
%
%    returns
%      the SpeciesReference with the new value for the constant attribute

%  Filename    :   SpeciesReference_setConstant.m
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

[level, version] = GetLevelVersion(SBMLSpeciesReference);

if isfield(SBMLSpeciesReference, 'constant')
	if (~isIntegralNumber(constant) || constant < 0 || constant > 1)
		error('constant must be an integer of value 0/1') ;
	else
		SBMLSpeciesReference.constant = constant;
	end;
else
	error('constant not an attribute on SBML L%dV%d SpeciesReference', level, version);
end;

