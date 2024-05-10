$counter = 0
foreach ($file in Get-ChildItem -Path $pwd -Filter *.url) {
	$content = Get-Content -Path $file
	Write-Host $file
	$gameid = ""
	$iconname = ""

	if ("$content" -match "URL=steam://rungameid/(\S+)") {
		$gameid = $Matches[1]
		Write-Host "`tgameid: $gameid"
	}
	else {
		Write-Host "`tNo steam gameid in url file."
		Continue
	}

	if ("$content" -match "IconFile=C:\\Program Files \(x86\)\\Steam\\steam\\games\\(\S+)\b") {
		$iconname = $Matches[1]
		Write-Host "`tIcon file name: $iconname"
		if (Test-Path "C:\Program Files (x86)\Steam\steam\games\$iconname") {
			Write-Host "`tIcon file already exists."
			Continue
		}
	}
	else {
		Write-Host "`tNo steam icon file path in url file."
		Continue
	}

	$url = "https://cdn.cloudflare.steamstatic.com/steamcommunity/public/images/apps/$gameid/$iconname"
	Write-Host "`tIcon file url: $url"

	Invoke-WebRequest -Uri $url -OutFile "C:\Program Files (x86)\Steam\steam\games\$iconname"
	$counter++
}

Write-Host ""
if ($counter -eq "0") {
	Write-Host "No icon files recovered."
	Write-Host "They were either already in C:\Program Files (x86)\Steam\steam\games,"
	Write-Host "or there are no valid steam game url shortcuts in the current directory."
}
elseif ($counter -eq "1") {
	Write-Host "A single icon file downloaded successfully"
}
else {
	Write-Host "$counter icon files downloaded successfully"
}


