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

# Codename of your device
device_name=manta;

# the link to the root of your android build output folder
output_folder=/home/khaon/out/aosp_master;

# This has to be the path to your package rom
pathToTheRom=$output_folder/target/product/$device_name/aosp_manta-ota-eng.khaon.zip;
romName=`basename $pathToTheRom`;

# Path to your xml ota file
ota_file=~/android/Packages/roms/aosp_master_branch/OTA.xml

VersionName="Android Master Branch";

md5=`md5sum $pathToTheRom | cut -d ' ' -f 1`;
todayDate=`date +%F%H | sed s@-@@g`;

# Change this if using another versionNumber way

versionNumber=$todayDate;
size=`wc -c $pathToTheRom | cut -d ' ' -f 1`;
websiteURL="http://forum.xda-developers.com/nexus-10/development/rom-optipop-f2fs-ubertc-4-9-3-t3086601";
downloadUrl=http://nickv.xyz/khaon/roms/aosp_master_branch/$romName

(cat << EOF) > $ota_file;
<?xml version="1.0" encoding="UTF-8"?>
<ROM>
  <RomName>AOSP-manta-Master-Branch</RomName>
  <VersionName>$VersionName</VersionName>
  <VersionNumber type="integer">$versionNumber</VersionNumber>
  <DirectUrl> <![CDATA[$downloadUrl]]></DirectUrl>
  <HttpUrl nil="true" />
  <Android>6.0.0</Android>
  <CheckMD5>$md5</CheckMD5>
  <FileSize type="integer">$size</FileSize>
  <Developer nil="true"/>
  <WebsiteURL><![CDATA[$websiteURL]]></WebsiteURL>
  <DonateURL nil="true" />
  <Changelog>$VersionName</Changelog>
</ROM>

EOF

