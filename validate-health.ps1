#https://openhackc7p18aw4poi.azurewebsites.net/api/version/poi, $(Build.BuildId)
Param(
    [string] [Parameter(Mandatory=$true)] $ApiName,
    [boolean] [Parameter(Mandatory=$false)] $Production = $false
    )
  $R = Invoke-WebRequest -URI "https://openhackc7p18aw4$ApiName$($Production ? '' : '-staging').azurewebsites.net/api/version/$ApiName"

  if ($R.StatusCode -eq 200) {
    exit 0;
  }

  exit 1; #if failed
}
