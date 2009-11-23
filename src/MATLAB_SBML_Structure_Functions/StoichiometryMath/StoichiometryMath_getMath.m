function math = StoichiometryMath_getMath(SBMLStoichiometryMath)
%
%   StoichiometryMath_getMath 
%             takes an SBMLStoichiometryMath structure 
%
%             and returns 
%               the math of the StoichiometryMath as a string
%
%       math = StoichiometryMath_getMath(SBMLStoichiometryMath)

%  Filename    :   StoichiometryMath_getMath.m
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
if (~isstruct(SBMLStoichiometryMath))
    error(sprintf('%s\n%s', ...
      'StoichiometryMath_getMath(SBMLStoichiometryMath)', ...
      'argument must be an SBML StoichiometryMath structure'));
end;
 
[sbmlLevel, sbmlVersion] = GetLevelVersion(SBMLStoichiometryMath);

if (~isSBML_StoichiometryMath(SBMLStoichiometryMath, sbmlLevel, sbmlVersion))
    error(sprintf('%s\n%s', ...
      'StoichiometryMath_getMath(SBMLStoichiometryMath)', ...
      'argument must be an SBML StoichiometryMath structure'));
elseif (sbmlLevel ~= 2 || sbmlVersion ~= 3)
    error(sprintf('%s\n%s', ...
      'StoichiometryMath_getMath(SBMLStoichiometryMath)', ...
      'math field only in level 2 version 3 model'));    
end;

math = SBMLStoichiometryMath.math;