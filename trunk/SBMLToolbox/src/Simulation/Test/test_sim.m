function y = test_sim()

%  Filename    :   test_sim.m
%  Description :
%  Author(s)   :   SBML Development Group <sbml-team@caltech.edu>
%  $Id: RunTest.m 7155 2008-06-26 20:24:00Z mhucka $
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



test = 0;
Totalfail = 0;

test = test + 5;
fail = TestAnalyseSpecies;
if (fail > 0)
    disp('AnalyseSpecies failed');
end;
Totalfail = Totalfail + fail;

test = test + 4;
fail = TestDealWithPiecewise;
if (fail > 0)
    disp('DealWithPiecewise failed');
end;
Totalfail = Totalfail + fail;

test = test + 3;
fail = TestGetArgumentsFromLambdaFunction;
if (fail > 0)
    disp('GetArgumentsFromLambdaFunction failed');
end;
Totalfail = Totalfail + fail;

test = test + 1;
fail = TestAnalyseVaryingParameters;
if (fail > 0)
    disp('AnalyseSVaryingParameters failed');
end;
Totalfail = Totalfail + fail;


disp(sprintf('Number tests: %d', test));
disp(sprintf('Number fails: %d', Totalfail));
disp(sprintf('Pass rate: %d%%', ((test-Totalfail)/test)*100));
