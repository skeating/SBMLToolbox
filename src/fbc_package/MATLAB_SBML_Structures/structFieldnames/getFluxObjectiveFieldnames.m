function [SBMLfieldnames, nNumberFields] = getFluxObjectiveFieldnames(level, ...
                                                         version, pkgVersion)
% [fieldnames, num] = getFluxObjectiveFieldnames(level, version, pkgVersion)
%
% Takes
%
% 1. level, an integer representing an SBML level
% 2. version, an integer representing an SBML version
% 3. pkgVersion, an integer representing an SBML package version
%
% Returns
%
% 1. an array of fieldnames for an SBML FluxObjective structure of the given level and version
% 2. the number of fieldnames
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

if (~isValidLevelVersionCombination(level, version))
  error ('invalid level/version combination');
end;

% need a check on package version

if (level == 1)
	SBMLfieldnames = [];
	nNumberFields = 0;
elseif (level == 2)
	SBMLfieldnames = [];
	nNumberFields = 0;
elseif (level == 3)
	if (version == 1)
    if (pkgVersion == 1)
      SBMLfieldnames = { 'typecode', ...
                         'metaid', ...
                         'notes', ...
                         'annotation', ...
                         'sboTerm', ...
                         'fbc_reaction', ...
                         'fbc_coefficient', ...
                         'isSetfbc_coefficient', ...
                         'level', ...
                         'version', ...
                         'fbc_version', ...
                       };
      nNumberFields = 11;
    elseif (pkgVersion == 2)
      SBMLfieldnames = { 'typecode', ...
                         'metaid', ...
                         'notes', ...
                         'annotation', ...
                         'sboTerm', ...
                         'fbc_reaction', ...
                         'fbc_coefficient', ...
                         'isSetfbc_coefficient', ...
                         'level', ...
                         'version', ...
                         'fbc_version', ...
                       };
      nNumberFields = 11;
    end;
	end;
end;
