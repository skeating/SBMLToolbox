function y = IsSpeciesInReaction(SBMLSpecies, SBMLReaction)
%
%  Filename    : IsSpeciesInReaction.m
%  Description : IsSpeciesInReaction(SBMLSpecies, SBMLReaction)takes a SBML species and  reaction
%               and determines where the species takes part in the reaction
%  Author(s)   : SBML Development Group <sbml-team@caltech.edu>
%  Organization: University of Hertfordshire STRC
%  Created     : 2004-02-02
%  Revision    : $Id$
%  Source      : $Source $
%
%  Copyright 2003 California Institute of Technology, the Japan Science
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
%      Science and Technology Research Centre
%      University of Hertfordshire
%      Hatfield, AL10 9AB
%      United Kingdom
%
%      http://www.sbml.org
%      mailto:sbml-team@caltech.edu
%
%  Contributor(s):
%
% IsSpeciesInReaction(SBMLSpecies, SBMLReaction)takes a SBML species and  reaction
% and determines where the species takes part in the reaction
%
% returns   0   if species is NOT part of the reaction
% or        an array indicting whether the species is a product,
%                   reactant or modifier
%           and recording the stoichiometry
%
%--------------------------------------------------------------------------
% EXAMPLE:    y   =   IsSpeciesInReaction(s, r)
%                 =   0                 if s is not in r
%                 =   [1, 1, 2, 0, 0]   if s is a reactant in r with
%                                           stoichiometry 2
%                 =   [1, 0, 1, 3, 0]   if s is a product in r with
%                                           stoichiometry 3
%                 =   [1, 0, 0, 1]      if s is a modifier in r
%                 =   [2, 1, 4, 1, 2, 0]if s is a reactant with stoichiometry 4 
%                                           and a product with
%                                           stoichiometry 2
%                  
%--------------------------------------------------------------------------

% check that input is valid
SBMLLevel = 1;
if (~isSBML_Species(SBMLSpecies, 1))
    SBMLLevel = 2;
    if(~isSBML_Species(SBMLSpecies, 2))
        error('IsSpeciesInReaction(SBMLSpecies, SBMLReaction)\n%s', 'first input must be an SBML Species structure');
    end;
end;

if(~isSBML_Reaction(SBMLReaction, SBMLLevel))
    error('IsSpeciesInReaction(SBMLSpecies, SBMLReaction)\n%s', 'second input must be an SBML Reaction structure');
end;

%--------------------------------------------------------------------------
% determine the name of the species
% this will match to the speciesreference within the reaction

if (SBMLLevel == 1)
    name = SBMLSpecies.name;
else
    if (isempty(SBMLSpecies.id))
        name = SBMLSpecies.name;
    else
        name = SBMLSpecies.id;
    end;
end;

%--------------------------------------------------------------------------
%determine number of each type of species included within this reaction

NumProducts = length(SBMLReaction.product);
NumReactants = length(SBMLReaction.reactant);
if (SBMLLevel == 2)
    NumModifiers = length(SBMLReaction.modifier);
else
    NumModifiers = 0;
end;

%-------------------------------------------------------------------------
% find species in this reaction

% zero all flags
found = 0;
ProductNo(1) = 0;
ReactantNo(1) = 0;
ModifierNo = 0;
count = 0;

%look for reference to this species
for c = 1:NumProducts
    k = strcmp(name, SBMLReaction.product(c).species);
    if (k == 1)
        found = found + 1;
        ProductNo(1) = ProductNo(1) + 1;
        ProductNo(ProductNo(1)+1) = SBMLReaction.product(c).stoichiometry;
    end;
end;

for c = 1:NumReactants
    k = strcmp(name, SBMLReaction.reactant(c).species);
    if (k == 1)
        found = found + 1;
        ReactantNo(1) = ReactantNo(1) + 1;
        ReactantNo(ReactantNo(1)+1) = SBMLReaction.reactant(c).stoichiometry;
    end;
end;

for c = 1:NumModifiers
    k = strcmp(name, SBMLReaction.reactant(c).species);
    if (k == 1)
        found = found + 1;
        ModifierNo = ModifierNo + 1;
    end;
end;


%--------------------------------------------------------------------------
% assign output

if (found == 0)
    y = 0;
else
    y = [found, ReactantNo, ProductNo, ModifierNo];
end;