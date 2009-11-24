function SBMLSpecies = Species_setInitialAmount(SBMLSpecies, initialAmount)
%
%   Species_setInitialAmount 
%             takes  1) an SBMLSpecies structure 
%             and    2) a double representing the initialAmount to be set
%
%             and returns 
%               the species with the initialAmount set
%
%       SBMLSpecies = Species_setInitialAmount(SBMLSpecies, initialAmount)

%  Filename    :   Species_setInitialAmount.m
%  Description :
%  Author(s)   :   SBML Development Group <sbml-team@caltech.edu>
%  $Id$
%  $Source v $
%
%<!---------------------------------------------------------------------------
% This file is part of SBMLToolbox.  Please visit http://sbml.org for more
% information about SBML, and the latest version of SBMLToolbox.
%
% Copyright 2005-2007 California Institute of Technology.
% Copyright 2002-2005 California Institute of Technology and
%                     Japan Science and Technology Corporation.
% 
% This library is free software; you can redistribute it and/or modify it
% under the terms of the GNU Lesser General Public License as published by
% the Free Software Foundation.  A copy of the license agreement is provided
% in the file named "LICENSE.txt" included with this software distribution.
% and also available online as http://sbml.org/software/sbmltoolbox/license.html
%----------------------------------------------------------------------- -->



% check that input is correct
if (~isstruct(SBMLSpecies))
    error(sprintf('%s', ...
      'argument must be an SBML Species structure'));
end;
 
[sbmlLevel, sbmlVersion] = GetLevelVersion(SBMLSpecies);

if (~isSBML_Species(SBMLSpecies, sbmlLevel, sbmlVersion))
    error(sprintf('%s\n%s', 'Species_setInitialAmount(SBMLSpecies, initialAmount)', 'first argument must be an SBML species structure'));
elseif(~isnumeric(initialAmount))
    error(sprintf('%s\n%s', 'Species_setInitialAmount(SBMLSpecies, initialAmount)', 'second argument must be a number representing the initialAmount')); 
end;

SBMLSpecies.initialAmount = initialAmount;
SBMLSpecies.isSetInitialAmount = int32(1);

if exist('OCTAVE_VERSION')
  warning off Octave:divide-by-zero;
else
  warning off MATLAB:divideByZero;
end;

SBMLSpecies.initialConcentration = 0/0;
SBMLSpecies.isSetInitialConcentration = int32(0);

if exist('OCTAVE_VERSION')
  warning off Octave:divide-by-zero;
else
  warning off MATLAB:divideByZero;
end;
