Set-ExecutionPolicy -F RemoteSigned
mkdir $HOME\Documents\WindowsPowerShell\
echo "" > $HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

#Environment
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Tools\cmder\vendor\git-for-windows\mingw32\bin\", [EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Tools\cmder\vendor\git-for-windows\usr\bin\", [EnvironmentVariableTarget]::Machine)

#Config
#Disable Windows Defender


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
pkg install win32-openssh -y
pkg install wireshark -y



#Infosec Tools
cd C:\Tools
pkg install nmap -y
pkg install zap -y
$ie = New-Object -ComObject InternetExplorer.Application
$ie.Navigate("http://www.bing.com")
wget http://www.oxid.it/downloads/ca_setup.exe
wget https://nmap.org/ncrack/dist/ncrack-0.5-setup.exe
#https://github.com/CISOfy/lynis
wget https://download.sysinternals.com/files/SysinternalsSuite.zip
wget http://www.ollydbg.de/odbg201.zip
wget http://downloads.volatilityfoundation.org/releases/2.6/volatility_2.6_win64_standalone.zip
wget http://www.openwall.com/john/h/john179w2.zip
wget https://hashcat.net/files/hashcat-3.30.7z
wget http://www.fastandeasyhacking.com/download/armitage150813.zip
wget https://windows.metasploit.com/metasploitframework-latest.msi

 #Git Tools
 cd C:\Tools
 git clone https://github.com/Acheron-VAF/Acheron.git
 git clone https://github.com/Subterfuge-Framework/Subterfuge.git 
 #Unsupported on Win (try ubuntu subsys)
 git clone https://github.com/upgoingstar/datasploit.git
 git clone https://github.com/EmpireProject/Empire.git
 git clone https://github.com/EmpireProject/EmPyre.git
 git clone https://github.com/beefproject/beef.git 
 #Unsupported on Win (try ubuntu subsys)
 git clone https://github.com/sullo/nikto.git #Extra Conf
 git clone https://github.com/wpscanteam/wpscan.git 
 #Unsupported on Win (try ubuntu subsys)
 git clone https://github.com/vanhauser-thc/thc-hydra.git 
 #Cygwin support
 git clone https://github.com/infobyte/evilgrade.git 
 #strawberry perl
 git clone https://github.com/SpiderLabs/Responder.git
 git clone https://github.com/BloodHoundAD/BloodHound.git
 iwr https://github.com/BloodHoundAD/BloodHound/releases/download/1.2.1/BloodHound-win32-x64.zip
 git clone https://bitbucket.org/LaNMaSteR53/recon-ng.git
 git clone https://github.com/rbsec/sslscan.git
 git clone https://github.com/0sm0s1z/Threat-Emulation-Toolkit.git
 git clone https://github.com/trustedsec/social-engineer-toolkit.git 
 #Unsupported on Win (try ubuntu subsys)
 git clone https://github.com/google/rekall.git
 git clone git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
 git clone git clone https://github.com/offensive-security/exploit-database.git /opt/exploit-database 
 #Unsupported on Win (try ubuntu subsys)
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




#DevPackages
cinst nodejs.install -y
choco install npm -y
choco install python2 -y
choco install electron -y
cinst NETFramework4 -y



#Wordlists
git clone git.kali.org/packages/wordlists.git


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
