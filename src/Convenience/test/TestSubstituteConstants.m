function fail = TestSubstituteConstants
% SubstituteConstants 
%       takes 
%           1) a string representation of a formula 
%           2) the SBMLModel structure
%       and returns 
%           a string representing the formula with the ids of any constants
%           within the model substituted
%
%
%   EXAMPLE:
%           m = SBMLModel with constant parameter
%               with id = 'g' and value = 3' 
%
%           subsFormula = SubstituteConstants('2 * g * S1', SBMLModel)
%           
%                   = '2 * 3 * S1'


%  Filename    :   TestSubstituteConstants.m
%  Description : 
%  Author(s)   :   SBML Development Group <sbml-team@caltech.edu>
%  Revision    :   $Id: TestSubstitute.m 7155 2008-06-26 20:24:00Z mhucka $
%  Source      :   $Source v $
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


m = TranslateSBML('../../Test/test-data/initialAssignments.xml');

formula = 'S1*2';
output = 'S1*2';

fail = TestFunction('SubstituteConstants', 2, 1, formula, m, output);

formula = 'k * S1';
output = '6 * S1';

fail = fail + TestFunction('SubstituteConstants', 2, 1, formula, m, output);

formula = 'compartment * S1';
output = '3 * S1';

fail = fail + TestFunction('SubstituteConstants', 2, 1, formula, m, output);

m = TranslateSBML('../../Test/test-data/l1v1.xml');

formula = '(x0 + vm) * (km*2)';
output = '(x0 + 2) * (2*2)';

fail = fail + TestFunction('SubstituteConstants', 2, 1, formula, m, output);

