#!/bin/sh

# Colorize and add text parameters
red=$(tput setaf 1) # red
grn=$(tput setaf 2) # green
cya=$(tput setaf 6) # cyan
txtbld=$(tput bold) # Bold
bldred=${txtbld}$(tput setaf 1) # red
bldgrn=${txtbld}$(tput setaf 2) # green
bldblu=${txtbld}$(tput setaf 4) # blue
bldcya=${txtbld}$(tput setaf 6) # cyan
txtrst=$(tput sgr0) # Reset

out_folder=/home/khaon/out/temasek;
device_name=manta;

# This has to be the path to your package rom
pathToTheRom=$out_folder/target/product/$device_name/cm-12.1-*-UNOFFICIAL-*.zip;

output_folder=~/android/Packages/roms/manta_ota.xml;

VersionName="17.5";
md5=`md5sum $pathToTheRom | cut -d ' ' -f 1`;
todayDate=`date +%F | sed s@-@@g`;
# Change this if using another versionNumber way
versionNumber=$todayDate;
size=`wc -c $pathToTheRom | cut -d ' ' -f 1`;
websiteURL="http://forum.xda-developers.com/nexus-10/development/rom-optipop-f2fs-ubertc-4-9-3-t3086601";

(cat << EOF) > $output_folder;
<?xml version="1.0" encoding="UTF-8"?>
<ROM>
  <RomName>Temasek-manta</RomName>
  <VersionName>$VersionName</VersionName>
  <VersionNumber type="integer">$versionNumber</VersionNumber>
  <DirectUrl> <![CDATA[http://46.105.101.215/khaon/roms/cm-12.1-$versionNumber-UNOFFICIAL-by.temasek-manta.zip]]></DirectUrl>
  <HttpUrl nil="true" />
  <Android>5.1.1</Android>
  <CheckMD5>$md5</CheckMD5>
  <FileSize type="integer">$size</FileSize>
  <Developer nil="true"/>
  <WebsiteURL><![CDATA[$websiteURL]]></WebsiteURL>
  <DonateURL nil="true" />
  <Changelog>$VersionName</Changelog>
</ROM>

EOF

