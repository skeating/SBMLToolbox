function fail = TestGetStoichiometryMatrix
% GetStoichiometryMatrix(SBMLModel) takes an SBML model 
% returns 
%       1) stoichiometry matrix
%       2) an array of character names of all species within the model 


%  Filename    :   TestGetStoichiometryMatrix.m
%  Description : 
%  Author(s)   :   SBML Development Group <sbml-team@caltech.edu>
%  Organization:   University of Hertfordshire STRI
%  Created     :   04-Oct-2005
%  Revision    :   $Id$
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


m = TranslateSBML('../../Test/test-data/algebraicRules.xml');

matrix = [-1, 0; 1, -1; 0, 1; 0, 0];
species = {'S1', 'S2', 'S3', 'X'};

fail = TestFunction('GetStoichiometryMatrix', 1, 2, m, matrix, species);

m = TranslateSBML('../../Test/test-data/initialAssignments.xml');

matrix = [-1, 0; 1, -1; 0, 0; 0, 0; 0, 1];
species = {'S1', 'S2', 'S3', 'X', 'S4'};

fail = TestFunction('GetStoichiometryMatrix', 1, 2, m, matrix, species);
