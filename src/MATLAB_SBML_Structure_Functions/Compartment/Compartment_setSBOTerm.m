function SBMLCompartment = Compartment_setSBOTerm(SBMLCompartment, sboTerm)
%
%   Compartment_setSBOTerm 
%             takes  1) an SBMLCompartment structure 
%             and    2) an integer representing the sboTerm to be set
%
%             and returns 
%               the compartment with the sboTerm set
%
%       SBMLCompartment = Compartment_setSBOTerm(SBMLCompartment, sboTerm)

%  Filename    :   Compartment_setSBOTerm.m
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



% check that input is correct
if (~isstruct(SBMLCompartment))
    error(sprintf('%s\n%s', ...
      'Compartment_setSBOTerm(SBMLCompartment, sboTerm)', ...
      'argument must be an SBML compartment structure'));
end;
 
[sbmlLevel, sbmlVersion] = GetLevelVersion(SBMLCompartment);

if (~isSBML_Compartment(SBMLCompartment, sbmlLevel, sbmlVersion))
  error(sprintf('%s\n%s', ...
    'Compartment_setSBOTerm(SBMLCompartment, sboTerm)', ...
    'first argument must be an SBML compartment structure'));
elseif (~isIntegralNumber(sboTerm))
    error(sprintf('%s\n%s', ...
      'Compartment_setSBOTerm(SBMLCompartment, sboTerm)', ...
      'second argument must be an integer representing the sboTerm'));
elseif (sbmlLevel ~= 2 || sbmlVersion ~= 3)
    error(sprintf('%s\n%s', ...
      'Compartment_setSBOTerm(SBMLCompartment, sboTerm)',  ...
      'sboTerm field only in level 2 version 3 model'));    
end;

SBMLCompartment.sboTerm = sboTerm;
