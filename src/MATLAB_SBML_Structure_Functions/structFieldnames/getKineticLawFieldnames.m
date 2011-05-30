function [SBMLfieldnames, nNumberFields] = getKineticLawFieldnames(level, ...
                                                                   version)

%
% getKineticLawFieldnames
%       takes an SBML level
%     and  an SBML version
%
%       and returns
%           1) an array fieldnames for the KineticLaw structure of the appropriate
%                  level and version
%      2) the number of fieldnames expected

%  Filename    :   getKineticLawFieldnames.m
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


if (~isValidLevelVersionCombination(level, version))
  error ('invalid level/version combination');
end;

if (level == 1)
		SBMLfieldnames = { 'typecode', ...
		                   'notes', ...
		                   'annotation', ...
		                   'formula', ...
		                   'parameter', ...
		                   'timeUnits', ...
		                   'substanceUnits', ...
		                 };
		nNumberFields = 7;
elseif (level == 2)
	if (version == 1)
		SBMLfieldnames = { 'typecode', ...
		                   'metaid', ...
		                   'notes', ...
		                   'annotation', ...
		                   'formula', ...
		                   'math', ...
		                   'parameter', ...
		                   'timeUnits', ...
		                   'substanceUnits', ...
		                 };
		nNumberFields = 9;
	elseif (version == 2)
		SBMLfieldnames = { 'typecode', ...
		                   'metaid', ...
		                   'notes', ...
		                   'annotation', ...
		                   'formula', ...
		                   'math', ...
		                   'parameter', ...
		                   'sboTerm', ...
		                 };
		nNumberFields = 8;
	elseif (version == 3)
		SBMLfieldnames = { 'typecode', ...
		                   'metaid', ...
		                   'notes', ...
		                   'annotation', ...
		                   'sboTerm', ...
		                   'formula', ...
		                   'math', ...
		                   'parameter', ...
		                 };
		nNumberFields = 8;
	elseif (version == 4)
		SBMLfieldnames = { 'typecode', ...
		                   'metaid', ...
		                   'notes', ...
		                   'annotation', ...
		                   'sboTerm', ...
		                   'formula', ...
		                   'math', ...
		                   'parameter', ...
		                 };
		nNumberFields = 8;
	end;
elseif (level == 3)
	if (version == 1)
		SBMLfieldnames = { 'typecode', ...
		                   'metaid', ...
		                   'notes', ...
		                   'annotation', ...
		                   'sboTerm', ...
		                   'math', ...
		                   'localParameter', ...
		                 };
		nNumberFields = 7;
	end;
end;
