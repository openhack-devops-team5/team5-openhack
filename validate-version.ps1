Param(
    [string] [Parameter(Mandatory=$true)] $Uri,
    [string] [Parameter(Mandatory=$true)] $Version,
    )
  $R = Invoke-WebRequest -URI $Uri
  $reportedVersion = $R.Content

  if ($reportedVersion -eq $Version) {
    exit 0;
  }

  exit 1; #if failed
}
