function functionDefinition = Model_getFunctionDefinition(SBMLModel, number)
%
%   Model_getFunctionDefinition 
%             takes  1) an SBMLModel structure 
%             and    2) a number n
%
%             and returns 
%               the nth function definition structure defined within the model
%
%       functionDefinition = Model_getFunctionDefinition(SBMLModel, number)

%  Filename    :   Model_getFunctionDefinition.m
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
if (~isSBML_Model(SBMLModel))
    error(sprintf('%s\n%s', 'Model_getFunctionDefinition(SBMLModel, number)', 'first argument must be an SBML model structure'));
elseif (SBMLModel.SBML_level < 2)
    error(sprintf('%s\n%s', 'Model_getFunctionDefinition(SBMLModel, number)', 'no function definitions in a level 1 model'));   
elseif ((number < 1) || (~isIntegralNumber(number)))
    error(sprintf('%s\n%s', 'Model_getFunctionDefinition(SBMLModel, number)', 'second argument must be a positive integer'));
end;

if (number > length(SBMLModel.functionDefinition))
    functionDefinition = [];
else
    functionDefinition = SBMLModel.functionDefinition(number);
end;
