; InstagramScraper InnoSetup Compiler 
; This software is property of Gabriel Freire. All Rights reserved.
; Copyright 2019
; Requires InnoSetup Latest (5.5 tested)
; This script compiles the setup file for InstagramScraper in the SETUP folder

#define MyAppName "InstagramScraper"
#define MyAppVersion "1.0"
#define ApplicationVersion GetStringFileInfo("C:\Users\gabriel.freire\Documents\workspace\InstagramScraper\src\builddir\InstagramScraper\bin\InstagramScraper.exe", "FileVersion")
#define MyAppPublisher "Gabriel Freire"
#define MyAppURL "http://www.gabrielfreire.com.br"
#define MyAppExeName "InstagramScraper.exe"


[Setup]
AppId={{802D0907-22CE-4E43-8FAB-017F687159C4}
AppName={#MyAppName}
AppVersion={#ApplicationVersion}
AppVerName={#MyAppName}
VersionInfoVersion={#ApplicationVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DisableDirPage=yes
DisableProgramGroupPage=yes
OutputDir=.\
OutputBaseFilename=InstagramScraperSetup
; SetupIconFile=.\IMSTray\setup.ico
UninstallDisplayIcon={app}\{#MyAppExeName}
Compression=lzma
SolidCompression=yes
; Tell Windows Explorer to reload the environment
ChangesEnvironment=yes

[CustomMessages]
AppAddPath=Add application directory to PATH variable (recommended)

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: modifypath; Description:{cm:AppAddPath}; Flags: unchecked

[Registry]
Root: HKCU; Subkey: "Environment"; ValueType:expandsz; ValueName: "Path"; ValueData: "{olddata};{app}\bin"; Flags: preservestringtype

[Files]
Source: "C:\Users\gabriel.freire\Documents\workspace\InstagramScraper\src\builddir\InstagramScraper\bin\*"; DestDir: "{app}\bin"; Flags: ignoreversion
Source: "C:\Users\gabriel.freire\Documents\workspace\InstagramScraper\src\builddir\InstagramScraper\res\*"; DestDir: "{app}\res"; Flags: ignoreversion
Source: "C:\Users\gabriel.freire\Documents\workspace\InstagramScraper\src\builddir\InstagramScraper\lib\*"; DestDir: "{app}\lib"; Flags: ignoreversion

[Code]

var CancelWithoutPrompt: boolean;

function InitializeSetup(): Boolean;
begin
CancelWithoutPrompt := false;
result := true;
Log('{#ApplicationVersion}');
end;

procedure CancelButtonClick(CurPageID: Integer; var Cancel, Confirm: Boolean);
begin
if CurPageID=wpInstalling then
	Confirm := not CancelWithoutPrompt;
end;

[Icons]
Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{commonstartup}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}";

