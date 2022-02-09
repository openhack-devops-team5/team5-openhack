#https://openhackc7p18aw4poi.azurewebsites.net/api/version/poi, $(Build.BuildId)
Param(
    [string] [Parameter(Mandatory=$true)] $ApiName,
    [string] [Parameter(Mandatory=$true)] $Version,
    [boolean] [Parameter(Mandatory=$false)] $Production = $false
    )
  $R = Invoke-WebRequest -URI "https://openhackc7p18aw4$ApiName$($Production ? '' : '-staging').azurewebsites.net/api/version/$ApiName"
  $reportedVersion = $R.Content

  if ($reportedVersion -eq $Version) {
    exit 0;
  }

  exit 1; #if failed
}
