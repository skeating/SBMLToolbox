function writeCreate(name)

cd (name);

newfilename = sprintf('%s_create.m', name);
fileOut = fopen(newfilename', 'w');

fprintf(fileOut, 'function %s = %s_create(varargin)\n', name, name);

% put in header and licence
fprintf(fileOut, '%%\n');
fprintf(fileOut, '%% %s_create\n', name); 
fprintf(fileOut, '%%    takes an SBML level (optional)\n');
fprintf(fileOut, '%%    and   an SBML version (optional)\n');
fprintf(fileOut, '%%\n');
fprintf(fileOut, '%%    returns\n'); 
fprintf(fileOut, '%%      an MATLAB_SBML %s structure of the appropriate\n', name);
fprintf(fileOut, '%%           level and version\n');
fprintf(fileOut, '%%\n');
fprintf(fileOut, '%% NOTE: the optional level and version preserve backwards compatability\n');
fprintf(fileOut, '%%         if version is missing the default values will be L1V2; L2V4 or L3V1\n');
fprintf(fileOut, '%%         if neither argument is supplied the default values will be L3V1\n\n');

fprintf(fileOut, '%%  Filename    :   %s_create.m\n', name);
fprintf(fileOut, '%%  Description :\n');
fprintf(fileOut, '%%  Author(s)   :   SBML Development Group <sbml-team@caltech.edu>\n');
fprintf(fileOut, '%%  $Id: $\n');
fprintf(fileOut, '%%  $Source v $\n');
fprintf(fileOut, '%%\n');
fprintf(fileOut, '%%<!---------------------------------------------------------------------------\n');
fprintf(fileOut, '%% This file is part of SBMLToolbox.  Please visit http://sbml.org for more\n');
fprintf(fileOut, '%% information about SBML, and the latest version of SBMLToolbox.\n');
fprintf(fileOut, '%%\n');
fprintf(fileOut, '%% Copyright (C) 2009-2011 jointly by the following organizations: \n');
fprintf(fileOut, '%%     1. California Institute of Technology, Pasadena, CA, USA\n');
fprintf(fileOut, '%%     2. EMBL European Bioinformatics Institute (EBML-EBI), Hinxton, UK\n');
fprintf(fileOut, '%%\n');
fprintf(fileOut, '%% Copyright (C) 2006-2008 jointly by the following organizations: \n');
fprintf(fileOut, '%%     1. California Institute of Technology, Pasadena, CA, USA\n');
fprintf(fileOut, '%%     2. University of Hertfordshire, Hatfield, UK\n');
fprintf(fileOut, '%%\n');
fprintf(fileOut, '%% Copyright (C) 2003-2005 jointly by the following organizations: \n');
fprintf(fileOut, '%%     1. California Institute of Technology, Pasadena, CA, USA \n');
fprintf(fileOut, '%%     2. Japan Science and Technology Agency, Japan\n');
fprintf(fileOut, '%%     3. University of Hertfordshire, Hatfield, UK\n');
fprintf(fileOut, '%%\n');
fprintf(fileOut, '%% SBMLToolbox is free software; you can redistribute it and/or modify it\n');
fprintf(fileOut, '%% under the terms of the GNU Lesser General Public License as published by\n');
fprintf(fileOut, '%% the Free Software Foundation.  A copy of the license agreement is provided\n');
fprintf(fileOut, '%% in the file named "LICENSE.txt" included with this software distribution.\n');
fprintf(fileOut, '%%----------------------------------------------------------------------- -->\n\n\n');

fprintf(fileOut, '%%check the input arguments are appropriate\n\n');
fprintf(fileOut, 'if (nargin > 2)\n');
fprintf(fileOut, '\terror(''too many input arguments'');\n');
fprintf(fileOut, 'end;\n\n');
fprintf(fileOut, 'switch (nargin)\n');
fprintf(fileOut, '\tcase 2\n');
fprintf(fileOut, '\t\tlevel = varargin{1};\n');
fprintf(fileOut, '\t\tversion = varargin{2};\n');
fprintf(fileOut, '\tcase 1\n');
fprintf(fileOut, '\t\tlevel = varargin{1};\n');
fprintf(fileOut, '\t\tif (level == 1)\n');
fprintf(fileOut, '\t\t\tversion = 2;\n');
fprintf(fileOut, '\t\telseif (level == 2)\n');
fprintf(fileOut, '\t\t\tversion = 4;\n');
fprintf(fileOut, '\t\telse\n');
fprintf(fileOut, '\t\t\tversion = 1;\n');
fprintf(fileOut, '\t\tend;\n');
fprintf(fileOut, '\totherwise\n');
fprintf(fileOut, '\t\tlevel = 3;\n');
fprintf(fileOut, '\t\tversion = 1;\n');
fprintf(fileOut, 'end;\n\n');

fprintf(fileOut, 'if ~isValidLevelVersionCombination(level, version)\n');
fprintf(fileOut, '\terror(''invalid level/version combination'');\n');
fprintf(fileOut, 'end;\n\n');

fprintf(fileOut, '%%get fields and values and create the structure\n\n');
fprintf(fileOut, '[fieldnames, num] = get%sFieldnames(level, version);\n', name);
fprintf(fileOut, 'if (num > 0)\n');
fprintf(fileOut, '\tvalues = get%sDefaultValues(level, version);\n', name);
fprintf(fileOut, '\t%s = cell2struct(values, fieldnames, 2);\n\n', name);

fprintf(fileOut, '\t%%add level and version\n\n');
fprintf(fileOut, '\t%s.level = level;\n', name);
fprintf(fileOut, '\t%s.version = version;\n\n', name);

fprintf(fileOut, '%%check correct structure\n\n');
fprintf(fileOut, '\tif ~isSBML_%s(%s, level, version)\n', name, name);
fprintf(fileOut, '\t\t%s = struct();\n', name);
fprintf(fileOut, '\t\twarning(''Warn:BadStruct'', ''Failed to create %s'');\n', name);
fprintf(fileOut, '\tend;\n\n');

fprintf(fileOut, 'else\n');
fprintf(fileOut, '\t%s = [];\n', name);
fprintf(fileOut, '\twarning(''Warn:InvalidLV'', ''%s not an element in SBML L%%dV%%d'', level, version);\n', name);
fprintf(fileOut, 'end;\n\n');



fclose(fileOut);

cd ..;