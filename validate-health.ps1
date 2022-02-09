Param(
    [string] [Parameter(Mandatory=$true)] $Uri,
    )
  $R = Invoke-WebRequest -URI $Uri

  if ($R.StatusCode -eq 200) {
    exit 0;
  }

  exit 1; #if failed
}
