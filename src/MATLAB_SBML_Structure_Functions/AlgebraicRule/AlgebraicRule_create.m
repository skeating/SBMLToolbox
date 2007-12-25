function AlgebraicRule = AlgebraicRule_create(varargin)
%
%   AlgebraicRule_create 
%             optionally takes an SBML level 
%             optionally takes an SBML version
%
%             and returns 
%               a algebraicRule structure of the required level and version
%               (default level = 2 version = 3)
%
%       AlgebraicRule = AlgebraicRule_create
%    OR AlgebraicRule = AlgebraicRule_create(sbmlLevel)
%    OR AlgebraicRule = AlgebraicRule_create(sbmlLevel, sbmlVersion)


%  Filename    :   AlgebraicRule_create.m
%  Description : 
%  Author(s)   :   SBML Development Group <sbml-team@caltech.edu>
%  Organization:   University of Hertfordshire STRI
%  Created     :   09-Feb-2005
%  Revision    :   $Id$
%  Source      :   $Source v $
%
%  Copyright 2005 California Institute of Technology, the Japan Science
%  and Technology Corporation, and the University of Hertfordshire
%
%  This library is free software; you can redistribute it and/or modify it
%  under the terms of the GNU Lesser General Public License as published
%  by the Free Software Foundation; either version 2.1 of the License, or
%  any later version.
%
%  This library is distributed in the hope that it will be useful, but
%  WITHOUT ANY WARRANTY, WITHOUT EVEN THE IMPLIED WARRANTY OF
%  MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.  The software and
%  documentation provided hereunder is on an "as is" basis, and the
%  California Institute of Technology, the Japan Science and Technology
%  Corporation, and the University of Hertfordshire have no obligations to
%  provide maintenance, support, updates, enhancements or modifications.  In
%  no event shall the California Institute of Technology, the Japan Science
%  and Technology Corporation or the University of Hertfordshire be liable
%  to any party for direct, indirect, special, incidental or consequential
%  damages, including lost profits, arising out of the use of this software
%  and its documentation, even if the California Institute of Technology
%  and/or Japan Science and Technology Corporation and/or University of
%  Hertfordshire have been advised of the possibility of such damage.  See
%  the GNU Lesser General Public License for more details.
%
%  You should have received a copy of the GNU Lesser General Public License
%  along with this library; if not, write to the Free Software Foundation,
%  Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
%
%  The original code contained here was initially developed by:
%
%      Sarah Keating
%      Science and Technology Research Institute
%      University of Hertfordshire
%      Hatfield, AL10 9AB
%      United Kingdom
%
%      http://www.sbml.org
%      mailto:sbml-team@caltech.edu
%
%  Contributor(s):


%default level = 2
%default version = 3
sbmlLevel = 2;
sbmlVersion = 3;
if (nargin > 2)
  error(sprintf('%s\n%s\n%s', ...
    'AlgebraicRule_create(sbmlLevel, sbmlVersion)', ...
    'requires either zero, one or two arguments', ...
    'SEE help AlgebraicRule_create'));

elseif (nargin == 2)
  if ((~isIntegralNumber(varargin{1})) || (varargin{1} < 1) || (varargin{1} > 2))
    error(sprintf('%s\n%s', 'AlgebraicRule_create(sbmlLevel, sbmlVersion)', ...
      'first argument must be a valid SBML level i.e. either 1 or 2'));
  elseif ((~isIntegralNumber(varargin{2})) || (varargin{2} < 1) || (varargin{2} > 3))
    error(sprintf('%s\n%s', 'AlgebraicRule_create(sbmlLevel, sbmlVersion)', ...
      'second argument must be a valid SBML version i.e. either 1, 2 or 3'));
  end;
  sbmlLevel = varargin{1};
  if (sbmlLevel == 1 && varargin{2} == 3)
      error(sprintf('Level - version mismatch\nAllowed combinations are L1V1 L1V2 L2V1 L2V2 or L2V3'));
  else
      sbmlVersion = varargin{2};
  end;
    
elseif (nargin == 1)
    if ((~isIntegralNumber(varargin{1})) || (varargin{1} < 1) || (varargin{1} > 2))
        error(sprintf('%s\n%s', 'AlgebraicRule_create(sbmlLevel)', ...
          'argument must be a valid SBML level i.e. either 1 or 2'));
    end;
    sbmlLevel = varargin{1};
    
end;

if (sbmlLevel == 1)
    SBMLfieldnames = {'typecode', 'notes', 'annotation', 'type', 'formula', ...
      'variable', 'species', 'compartment', 'name', 'units'};
    Values = {'SBML_ALGEBRAIC_RULE', '', '', 'rate', '', '', '', '', '', ''};
else
  if (sbmlVersion == 1)
    SBMLfieldnames = {'typecode', 'metaid', 'notes', 'annotation', 'formula', ...
      'variable', 'species', 'compartment', 'name', 'units'};
    Values = {'SBML_ALGEBRAIC_RULE','', '', '', '', '', '', '', '', ''};
  elseif (sbmlVersion == 2)
    SBMLfieldnames = {'typecode', 'metaid', 'notes', 'annotation', 'sboTerm', ...
      'formula', 'variable', 'species', 'compartment', 'name', 'units'};
    Values = {'SBML_ALGEBRAIC_RULE','', '', '', int32(-1), '', '', '', '', '', ''};
  elseif (sbmlVersion == 3)
    SBMLfieldnames = {'typecode', 'metaid', 'notes', 'annotation', 'sboTerm', ...
      'formula', 'variable', 'species', 'compartment', 'name', 'units'};
    Values = {'SBML_ALGEBRAIC_RULE','', '', '', int32(-1), '', '', '', '', '', ''};
  end;
end;

AlgebraicRule = cell2struct(Values, SBMLfieldnames, 2);

%check created structure is appropriate
if (~isSBML_AlgebraicRule(AlgebraicRule, sbmlLevel, sbmlVersion))
    AlgebraicRule = [];
    warning('Failed to create algebraicRule');
end;
