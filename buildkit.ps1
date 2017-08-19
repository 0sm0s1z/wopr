#WOPR Build Script for Windows Hackers!
#Requires PowerShell v4 and up


#Check $host var for v4 and terminate and continue // else terminate and error msg

Set-ExecutionPolicy -F RemoteSigned
mkdir $HOME\Documents\WindowsPowerShell\
mkdir C:\Tools
mkdir C:\tmp
#Add file exists detection
echo "" > $HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 #THIS WILL KILL YOUR CURRENT PROFILE!!!

#Environment
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Tools\cmder\vendor\git-for-windows\mingw32\bin\", [EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Tools\cmder\vendor\git-for-windows\usr\bin\", [EnvironmentVariableTarget]::Machine)

#Config
#Disable Windows Defender // or setup exclusions
Add-MpPreference -ExclusionPath "C:\Tools"
Add-MpPreference -ExclusionPath $HOME\Desktop #!High Risk! Windows Defender Exclusion Setting
Add-MpPreference -ExclusionPath $HOME\Downloads #!High Risk! Windows Defender Exclusion Setting
Add-MpPreference -ExclusionPath $HOME\Documents #!High Risk! Windows Defender Exclusion Setting
Add-MpPreference -ExclusionPath "C:\Program Files"
Add-MpPreference -ExclusionPath "C:\Program Files (x86)"

#!!#Verify iwr working // else invoke iexplorer and continue
$ie = New-Object -ComObject InternetExplorer.Application
$ie.Navigate("http://www.bing.com")

#Package Manager
iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex


echo "Set-Alias pkg choco" >> $HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
echo 'Import-Module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1" -Force' >>  $HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
Set-Alias pkg Install-ChocolateyPackage
set-alias pkg choco


#Packages
choco install Atom -y
choco install GoogleChrome -y
cinst Firefox -y
choco install Cmder -y
choco install notepadplusplus -y
choco install vlc -y
choco install 7zip -y
choco install git -y
pkg install clink -y
pkg install virtualbox -y
pkg install VirtualBox.ExtensionPack -y
pkg install openssh -y
pkg install wireshark -y

###############
#Infosec Tools#
###############
cd C:\Tools
# pkg install nmap -y #Causes system crash???
pkg install zap -y


###
#Download packages for manual installation
wget http://www.oxid.it/downloads/ca_setup.exe -o ca_setup.exe
wget https://nmap.org/ncrack/dist/ncrack-0.5-setup.exe -o ncrack-0.5-setup.exe
wget https://download.sysinternals.com/files/SysinternalsSuite.zip -o SysinternalsSuite.zip
wget http://www.ollydbg.de/odbg201.zip -o odbg201.zip
wget http://downloads.volatilityfoundation.org/releases/2.6/volatility_2.6_win64_standalone.zip -o volatility_2.6_win64_standalone.zip
wget http://www.openwall.com/john/h/john179w2.zip -o john179w2.zip
wget https://hashcat.net/files/hashcat-3.6.0.7z -o hashcat-3.6.0.7z
#wget https://windows.metasploit.com/metasploitframework-latest.msi -o metasploitframework-latest.msi #large package//make optional 
wget https://github.com/BloodHoundAD/BloodHound/releases/download/1.2.1/BloodHound-win32-x64.zip -o BloodHound-win32-x64.zip

####
#Unpack & Build (allow cmd switch to disable unpack/install)
write-host [*] Building Packages... -foregroundcolor yellow
write-host Entering Cain & Able Setup -foregroundcolor yellow
.\ca_setup.exe #Requires graphical install in order to trigger winpcap... separate install and .\ca_setup.exe /S /v/qn  ???
.\ncrack-0.5-setup.exe /S /v/qn
expand-archive .\SysinternalsSuite.zip
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Tools\SysinternalsSuite", [EnvironmentVariableTarget]::Machine)
expand-archive odbg201.zip
move .\odbg201\ .\ollydbg
expand-archive volatility_2.6_win64_standalone.zip
move .\volatility_2.6_win64_standalone\volatility_2.6_win64_standalone\ .\volatility
move .\volatility\volatility_2.6_win64_standalone.exe .\volatility\volatility.exe
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Tools\volatility\", [EnvironmentVariableTarget]::Machine)
expand-archive john179w2.zip -DestinationPath .\
move .\john179\ .\john
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Tools\john\run", [EnvironmentVariableTarget]::Machine)
7z.exe x .\hashcat-3.6.0.7z
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Tools\hashcat-3.6.0\", [EnvironmentVariableTarget]::Machine)
expand-archive BloodHound-win32-x64.zip
move .\BloodHound-win32-x64 .\BloodHound

####
write-host [*]Build Complete -foregroundcolor yellow
write-host [*]Cleaning up package files -foregroundcolor yellow
rm .\ca_setup.exe
rm .\ncrack-0.5-setup.exe
rm .\SysinternalsSuite.zip
rm .\odbg201.zip
rm .\volatility_2.6_win64_standalone.zip
rm .\john179w2.zip
rm .\hashcat-3.6.0.7z
rm .\BloodHound-win32-x64.zip

####
write-host [*]Downloading Git Repos -foregroundcolor yellow
#Git Tools
#!!#Verify git working // else check/fix path and continue
cd C:\Tools
git clone https://github.com/rsmudge/armitage.git
git clone https://github.com/Acheron-VAF/Acheron.git
git clone https://github.com/Subterfuge-Framework/Subterfuge.git 
git clone https://github.com/upgoingstar/datasploit.git
git clone https://github.com/EmpireProject/Empire.git
git clone https://github.com/EmpireProject/EmPyre.git
git clone https://github.com/beefproject/beef.git 
git clone https://github.com/sullo/nikto.git #Extra Conf
git clone https://github.com/wpscanteam/wpscan.git 
#git clone https://github.com/vanhauser-thc/thc-hydra.git 
#Cygwin support
git clone https://github.com/infobyte/evilgrade.git 
#strawberry perl
git clone https://github.com/SpiderLabs/Responder.git
git clone https://bitbucket.org/LaNMaSteR53/recon-ng.git
git clone https://github.com/rbsec/sslscan.git
git clone https://github.com/0sm0s1z/Threat-Emulation-Toolkit.git
git clone https://github.com/trustedsec/social-engineer-toolkit.git 
git clone https://github.com/google/rekall.git
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git -b sqlmap-dev
git clone https://github.com/offensive-security/exploit-database.git /opt/exploit-database 
git clone https://github.com/epinna/weevely3.git


#Scripts
mkdir C:\Tools\Scripts
cd C:\Tools\Scripts
git clone https://github.com/PowerShellMafia/PowerSploit.git
git clone https://github.com/samratashok/nishang.git
git clone https://github.com/davehull/Kansa.git
git clone https://github.com/mattifestation/PowerShellArsenal.git
git clone https://github.com/davehull/Kansa.git
git clone https://github.com/darkoperator/Posh-VirusTotal.git
git clone https://github.com/0sm0s1z/Invoke-SelfSignedWebRequest.git


#Load Librarys into PS Profile // Requires full Windows Defender Disable
#Set-MpPreference -DisableRealtimeMonitoring $true
#echo '$scriptingdir="C:\Tools\Scripts\"' >> $HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
#echo 'ls -R "${scriptingdir}\*.psm1 | %{$_|Import-Module}' >> $HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
#Display loaded cmdlets 
echo 'ls -r ${scriptingdir}\*.psm1 | % {gcm -mod $_.BaseName}' >> $HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1


#Add if desired // specification cmd switch
#DevPackages
cinst nodejs.install -y
choco install npm -y
choco install python2 -y
choco install electron -y
#cinst NETFramework4 -y


#Dev Projects
mkdir C:\Tools\Dev
cd C:\Tools\Dev
git clone https://github.com/BloodHoundAD/BloodHound.git
cd C:\Tools


#Wordlists
git clone git://git.kali.org/packages/wordlists.git



#####
#Upcoming Updates
#####
#Invoke-NukeItFromOrbit
#Create WOPR manifest for other tools to consume over dependencies
#Detect/Build to arch?
#error msg: Unsupported on Win (try ubuntu subsys)

#Pkg mgr cheatsheet
#Tool List
#clink
#virtualbox
#VirtualBox.ExtensionPack
#win32-openssh
#wireshark
#nmap
#zap
#Firefox
#nodejs.install
#NETFramework4
#Atom
#GoogleChrome
#Cmder
#notepadplusplus
#vlc
#7zip
#git
#npm
#python2
#electron
#chocolatey
#cain
#nmap
#ncrack
#odbg201
#iwr http:
#volatility_2
#john
#hashcat
#armitage150813
#metasploitframework-latest
#BloodHoundAD
#BloodHound
#Acheron-VAF
#Subterfuge-Framework
#datasploit
#Empire
#EmPyre
#beef
#nikto
#wpscan
#thc-hydra
#evilgrade
#Responder
#recon-ng
#sslscan
#Threat-Emulation-Toolkit
#rekall
#sqlmap
#exploit-database
#weevely3
#PowerSploit
#nishang
#Kansa
#PowerShellArsenal
#Posh-VirusTotal
#Invoke-SelfSignedWebRequest
