function y = DetermineSpeciesRoleInReaction(SBMLSpecies, SBMLReaction)
% DetermineSpeciesRoleInReaction(SBMLSpecies, SBMLReaction)takes a SBML species and  reaction
% and determines where the species takes part in the reaction
%
% returns   0   if species is NOT part of the reaction
% or        an array indicting whether the species is a product,
%                   reactant or modifier
%           and recording the position in the list of products/reactants
%
%           [isProduct, isReactant, isModifier, positionInProductList,
%           positionInReactantList]
%
%--------------------------------------------------------------------------
% EXAMPLE:    y   =   DetermineSpeciesRoleInReaction(s, r)
%                 =   0                 if s is not in r
%                 =   [1, 0, 0, 2, 0]   if s is product no 2 in r 
%                 =   [0, 1, 0, 0, 1]   if s is reactant no 1 in r
%                 =   [0, 0, 1, 0, 0]   if s is a modifier in r
%                 =   [1, 1, 0, 1, 2]   if s is product no 1 
%                                           and reactant no 2 in r
%--------------------------------------------------------------------------

%  Filename    : DetermineSpeciesRoleInReaction.m
%  Description : DetermineSpeciesRoleInReaction(SBMLSpecies, SBMLReaction)takes a SBML species and  reaction
%               and determines where the species takes part in the reaction
%  Author(s)   : SBML Development Group <sbml-team@caltech.edu>
%  Organization: University of Hertfordshire STRC
%  Created     : 2005-01-12
%  Revision    : $Id$
%  Source      : $Source $
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

Number = IsSpeciesInReaction(SBMLSpecies, SBMLReaction);

if (Number == 0)
    y = 0;
    return;
end;

% check that input is valid
SBMLLevel = 1;
if (~isSBML_Species(SBMLSpecies, 1))
    SBMLLevel = 2;
    if(~isSBML_Species(SBMLSpecies, 2))
        SBMLVersion = 2;
        if(~isSBML_Species(SBMLSpecies, 2, 2))
            SBMLVersion = 3;
            if (~isSBML_Species(SBMLSpecies, 2, 3))
                error('DetermineSpeciesRoleInReaction(SBMLSpecies, SBMLReaction)\n%s', 'first input must be an SBML Species structure');
            end;
        end;
    end;
end;

%--------------------------------------------------------------------------
% determine the name of the species
% this will match to the speciesreference within the reaction

if (SBMLLevel == 1)
    name = SBMLSpecies.name;
    reactionName = SBMLReaction.name;
else
    if (isempty(SBMLSpecies.id))
        name = SBMLSpecies.name;
    else
        name = SBMLSpecies.id;
    end;
    
    if (isempty(SBMLReaction.id))
        reactionName = SBMLReaction.name;
    else
        reactionName = SBMLReaction.id;
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
ProductNo = 0;
ReactantNo = 0;
ModifierNo = 0;
ReactantPosition = 0;
ProductPosition = 0;

%look for reference to this species
for c = 1:NumProducts
    if (strcmp(name, SBMLReaction.product(c).species))
        ProductNo = ProductNo + 1;
        ProductPosition(ProductNo) = c;
    end;
end;

for c = 1:NumReactants
    if (strcmp(name, SBMLReaction.reactant(c).species))
        ReactantNo = ReactantNo + 1;
        ReactantPosition(ReactantNo) = c;
    end;
end;

for c = 1:NumModifiers
    if (strcmp(name, SBMLReaction.modifier(c).species))
        ModifierNo = ModifierNo + 1;
    end;
end;

%--------------------------------------------------------------------------
% assign output
if ((ReactantNo > 1) || (ProductNo > 1))
       error('DetermineSpeciesRoleInReaction(SBMLSpecies, SBMLReaction)\nspecies %s %s %s\n%s', name,'occurs more than once as a reactant/product in reaction', reactionName, 'this code does not deal with that situation');
end;

    y = [ProductNo, ReactantNo, ModifierNo, ProductPosition, ReactantPosition];
