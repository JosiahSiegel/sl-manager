#!/bin/bash

FILE=./etc/config_viz.sh
if [[ ! -f $FILE ]]; then
echo -e "
## CREATE MISSING FILE: etc/config_viz.sh

=======================
#!/bin/bash

RESOURCE_GROUP=\"my-rg\"
OUT_FILE=\"/mnt\${PWD}/etc/viz.png\"
USER_ID=\"user@microsoft.com\"
SUB_NAME=\"My-Sub\"
THEME=\"neon\"
DEPTH=\"2\"
VERBOSITY=\"2\"
FORMAT=\"png\"
"
exit
fi

source $FILE

wsl -d $1 -u $3 -e bash -c \
' \
sudo apt-get install -y wget apt-transport-https software-properties-common; \
wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O ~/packages-microsoft-prod.deb; \
sudo dpkg -i ~/packages-microsoft-prod.deb; \
sudo apt-get update; \
sudo apt-get install powershell -y; \
sudo apt install graphviz -y; \
sudo pwsh -Command "& { \
Set-PSRepository PSGallery -InstallationPolicy Trusted; \
Register-PackageSource -provider NuGet -Name nugetRepository -location https://www.nuget.org/api/v2 -Trusted -Force; \
Import-PackageProvider NuGet; \
Install-Module PowerShellGet -SkipPublisherCheck; \
Install-Module PSReadLine; \
Install-Module -Name Az -AllowClobber; \
Install-Module -Name AzViz -AllowClobber -Confirm:\$False; \
Import-Module AzViz; \
\$azProfile = [Microsoft.Azure.Commands.Common.Authentication.Abstractions.AzureRmProfileProvider]::Instance.Profile; \
\$currentAzureContext = Get-AzContext; \
\$profileClient = New-Object Microsoft.Azure.Commands.ResourceManager.Common.RMProfileClient(\$azProfile); \
if(\$currentAzureContext.Tenant.TenantId) { \
    \$token = \$profileClient.AcquireAccessToken(\$currentAzureContext.Tenant.TenantId); \
    if(\$token.UserId -ne \"'${USER_ID?}'\") { \
        Connect-AzAccount -UseDeviceAuthentication; \
    } \
    Set-AzContext -SubscriptionName \"'${SUB_NAME?}'\"; \
} else { \
    Connect-AzAccount -UseDeviceAuthentication; \
    Set-AzContext -SubscriptionName \"'${SUB_NAME?}'\"; \
}; \
Export-AzViz -ResourceGroup '${RESOURCE_GROUP?}' -Theme '${THEME?}' -OutputFormat '${FORMAT?}' -CategoryDepth '${DEPTH?}' -LabelVerbosity '${VERBOSITY?}' -OutputFilePath '${OUT_FILE?}'; \
}"
'
