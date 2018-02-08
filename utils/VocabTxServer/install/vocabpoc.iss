; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{9FD61024-BC9A-4226-ADA5-E72254250B6C}
AppName=Vocab PoC Terminology Server
AppVersion=0.1
AppVerName=0.0.6 (FHIR Version 1.0.2.7475)
AppPublisher=Health Intersections
AppPublisherURL=http://www.healthintersections.com.au/FhirServer
AppSupportURL=http://www.healthintersections.com.au/FhirServer
AppUpdatesURL=http://www.healthintersections.com.au/FhirServer
DefaultDirName={pf}\Vocab PoC Terminology Server
DefaultGroupName=FHIR Applications
AllowNoIcons=yes
LicenseFile=C:\work\fhirserver\utils\VocabTxServer\licence.txt
OutputDir=C:\work\fhirserver\utils\VocabTxServer\install
OutputBaseFilename=vocabpoc-install-0.0.6
SetupIconFile=C:\work\fhirserver\utils\VocabTxServer\VocabTxServer_Icon.ico
Compression=lzma
SolidCompression=yes
ArchitecturesInstallIn64BitMode=x64
ArchitecturesAllowed=x64

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "C:\work\fhirserver\utils\VocabTxServer\install\VocabTxServer.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\work\fhirserver\utils\VocabTxServer\install\osx\VocabTxServer.app\Contents\MacOS\ucum-essence.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\work\fhirserver\utils\VocabTxServer\install\osx\VocabTxServer.app\Contents\MacOS\web.zip"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\work\fhirserver\utils\VocabTxServer\install\osx\VocabTxServer.app\Contents\MacOS\lang.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\work\fhirserver\utils\VocabTxServer\install\osx\VocabTxServer.app\Contents\MacOS\loinc_263.cache"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\Vocab PoC Terminology Server"; Filename: "{app}\VocabTxServer.exe"
Name: "{group}\{cm:ProgramOnTheWeb,Vocab PoC Terminology Server}"; Filename: "http://www.healthintersections.com.au/FhirServer"

[Run]
Filename: "{app}\VocabTxServer.exe"; Description: "{cm:LaunchProgram,Vocab PoC Terminology Server}"; Flags: nowait postinstall skipifsilent

