% release a single package while development (p-file)

% -------------------------------------------------------------------------
% some config

ModuleName = 'Scope';    % name of class file
%ModuleName = 'FGen'; 
VersionID  = 'part';

% copy released files also to Support directory? 
copyFilesToSupportDir = 1;   % true (1) or false (0)

% -------------------------------------------------------------------------
% actual code to create a new release
% -------------------------------------------------------------------------
% save path to current directory
ThisDir    = pwd;
% path to source and release directories
SourceDir  = fullfile(ThisDir, '..', 'Modules', ModuleName);
ReleaseDir = fullfile(ThisDir, [ModuleName '_v' VersionID '_release']);

% pcode cannot handle '..' in path string
cd(SourceDir);
SourceDir = pwd;
cd(ThisDir);

% -------------------------------------------------------------------------
%workSourceDir  = fullfile(SourceDir,  ['+' ModuleName], '+RS', '+RTB2000');
%workReleaseDir = fullfile(ReleaseDir, ['+' ModuleName], '+RS', '+RTB2000');
%workSourceDir  = fullfile(SourceDir,  ['+' ModuleName], '+Siglent', '+SDG6000X');
%workReleaseDir = fullfile(ReleaseDir, ['+' ModuleName], '+Siglent', '+SDG6000X');
%workSourceDir  = fullfile(SourceDir,  ['+' ModuleName], '+Rigol', '+DS2072A');
%workReleaseDir = fullfile(ReleaseDir, ['+' ModuleName], '+Rigol', '+DS2072A');
%workSourceDir  = fullfile(SourceDir,  ['+' ModuleName], '+Siglent', '+SDS2000X');
%workReleaseDir = fullfile(ReleaseDir, ['+' ModuleName], '+Siglent', '+SDS2000X');
workSourceDir  = fullfile(SourceDir,  ['+' ModuleName], '+Siglent', '+SDS1000X_E');
workReleaseDir = fullfile(ReleaseDir, ['+' ModuleName], '+Siglent', '+SDS1000X_E');
mkdir(workReleaseDir);
cd(workReleaseDir);

% create p-files out of original m-files
pcode(fullfile(workSourceDir, 'ScopeMacros.m'));
%pcode(fullfile(workSourceDir, 'FGenMacros.m'));

% -------------------------------------------------------------------------
% return to original path
cd(ThisDir);

% -------------------------------------------------------------------------
% finally optionally copy released files to Support directory 
% (dir which is added to Matlab search path using 'pathtool')
if copyFilesToSupportDir
    SupportDir  = fullfile(ThisDir, '..', 'Support');
    copyfile(ReleaseDir, SupportDir);
end

return % end of script