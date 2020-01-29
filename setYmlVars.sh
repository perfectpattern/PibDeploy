#!/bin/bash

# Check if ~/docker-compose.yml exists
if [[ -z $(cat ~/docker-compose.yml 2>/dev/null) ]]; then
   echo "You need to have the docker-compose.yml in your home folder"
   exit 1
fi

echo "This script asks for all login credentials one by one."
echo "Please do not enter an empty string"

echo "SPO URL:"
read surl
if [[ -z "$surl" ]]; then
   echo "No input detected! Please re-run this script and do not enter an empty string."
   exit 1
else
   # remove both leading and trailing spaces 
   surl="$(echo -e "${surl}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
fi
echo "SPO Tenant:"
read stenant
if [[ -z "$stenant" ]]; then
   echo "No input detected! Please re-run the script and do not enter an empty string."
   exit 1
else
   # remove both leading and trailing spaces 
   stenant="$(echo -e "${stenant}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
fi
echo "SPO User:"
read suser
if [[ -z "$suser" ]]; then
   echo "No input detected! Please re-run the script and do not enter an empty string."
   exit 1
else
   # remove both leading and trailing spaces 
   suser="$(echo -e "${suser}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
fi
echo "SPO Password:"
read spwd
if [[ -z "$spwd" ]]; then
   echo "No input detected! Please re-run the script and do not enter an empty string."
   exit 1
else
   # remove both leading and trailing spaces 
   spwd="$(echo -e "${spwd}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
fi
echo "SPO Workspace ID:"
read swsid
if [[ -z "$swsid" ]]; then
   echo "No input detected! Please re-run the script and do not enter an empty string."
   exit 1
else
   # remove both leading and trailing spaces 
   swsid="$(echo -e "${swsid}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
fi
echo "SPO Integration Name:"
read sin
if [[ -z "$sin" ]]; then
   echo "No input detected! Please re-run the script and do not enter an empty string."
   exit 1
else
   # remove both leading and trailing spaces 
   sin="$(echo -e "${sin}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
fi
echo "SPO Integration Location:"
read sil
if [[ -z "$sil" ]]; then
   echo "No input detected! Please re-run the script and do not enter an empty string."
   exit 1
else
   # remove both leading and trailing spaces 
   sil="$(echo -e "${sil}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
fi
echo "Site Code:"
read sitecode
if [[ -z "$sitecode" ]]; then
   echo "No input detected! Please re-run the script and do not enter an empty string."
   exit 1
else
   # remove both leading and trailing spaces 
   sitecode="$(echo -e "${sitecode}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
fi
echo "Profile:"
read profile
if [[ -z "$profile" ]]; then
   echo "No input detected! Please re-run the script and do not enter an empty string."
   exit 1
else
   # remove both leading and trailing spaces 
   profile="$(echo -e "${profile}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
fi
echo "ElasticSearch User:"
read euser
if [[ -z "$euser" ]]; then
   echo "No input detected! Please re-run the script and do not enter an empty string."
   exit 1
else
   # remove both leading and trailing spaces 
   euser="$(echo -e "${euser}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
fi
echo "ElasticSearch Password:"
read epwd
if [[ -z "$epwd" ]]; then
   echo "No input detected! Please re-run the script and do not enter an empty string."
   exit 1
else
   # remove both leading and trailing spaces 
   epwd="$(echo -e "${epwd}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
   u="$(echo -e "${u}" | sed -e 's///\//')"
fi

echo ""
echo ""
echo "You entered the following credentials:"

echo -n "SPO URL: "
echo $surl
echo -n "SPO Tenant: "
echo $stenant
echo -n "SPO User: "
echo $suser
echo -n "SPO Password: "
echo $spwd
echo -n "SPO Workspace ID: "
echo $swsid
echo -n "SPO Integration Name: "
echo $sin
echo -n "SPO Integration Location: "
echo $sil
echo -n "Site Code: "
echo $sitecode
echo -n "Profile: "
echo $profile
echo -n "ElasticSearch User: "
echo $euser
echo -n "ElasticSearch Password: "
echo $epwd

echo ""
echo "If there is anything incorrect, please re-run this script."
echo ""

# Create new yml file
newymlfile=~/docker-compose-run.yml
rm -f $newymlfile
cp ~/docker-compose.yml $newymlfile || { echo "Failed to create new YAML file!" ; exit 1; }
echo "A new YAML file was created"

# Put variables in place
sed -i 's,SPO_URL=<REPLACE>,SPO_URL='"$surl"',g' ~/docker-compose-run.yml || { echo 'Failed to set variable in new YAML file!' ; exit 1; }
sed -i 's,SPO_TENANT=<REPLACE>,SPO_TENANT='"$stenant"',g' ~/docker-compose-run.yml || { echo 'Failed to set variable in new YAML file!' ; exit 1; }
sed -i 's,SPO_USER=<REPLACE>,SPO_USER='"$suser"',g' ~/docker-compose-run.yml || { echo 'Failed to set variable in new YAML file!' ; exit 1; }
sed -i 's,SPO_PASSWORD=<REPLACE>,SPO_PASSWORD='"$spwd"',g' ~/docker-compose-run.yml || { echo 'Failed to set variable in new YAML file!' ; exit 1; }
sed -i 's,SPO_WORKSPACE_ID=<REPLACE>,SPO_WORKSPACE_ID='"$swsid"',g' ~/docker-compose-run.yml || { echo 'Failed to set variable in new YAML file!' ; exit 1; }
sed -i 's,INTEGRATION_NAME=<REPLACE>,INTEGRATION_NAME='"$sin"',g' ~/docker-compose-run.yml || { echo 'Failed to set variable in new YAML file!' ; exit 1; }
sed -i 's,INTEGRATION_LOCATION=<REPLACE>,INTEGRATION_LOCATION='"$sil"',g' ~/docker-compose-run.yml || { echo 'Failed to set variable in new YAML file!' ; exit 1; }
sed -i 's,SITE_CODE=<REPLACE>,SITE_CODE='"$sitecode"',g' ~/docker-compose-run.yml || { echo 'Failed to set variable in new YAML file!' ; exit 1; }
sed -i 's,PROFILE=<REPLACE>,PROFILE='"$profile"',g' ~/docker-compose-run.yml || { echo 'Failed to set variable in new YAML file!' ; exit 1; }
sed -i 's,ELASTIC_SEARCH_USER=<REPLACE>,ELASTIC_SEARCH_USER='"$euser"',g' ~/docker-compose-run.yml || { echo 'Failed to set variable in new YAML file!' ; exit 1; }
sed -i 's,ELASTIC_SEARCH_PWD=<REPLACE>,ELASTIC_SEARCH_PWD='"$epwd"',g' ~/docker-compose-run.yml || { echo 'Failed to set variable in new YAML file!' ; exit 1; }

echo "Variables were successfully changed in new YAML file"

echo "The new YAML file was written to $newymlfile"

echo "Done!"
