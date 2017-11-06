Param
(
    [Parameter(Mandatory)]
    [string]$IPAddress
)
 
$geoIPRequest = Invoke-RestMethod -Method Get -Uri "http://geoip.nekudo.com/api/$IPAddress"
    
$IPObject = New-Object System.Object

$IPObject | Add-Member -Type NoteProperty -Name "IP" -Value $geoIPRequest.IP
$IPObject | Add-Member -Type NoteProperty -Name "City" -Value $geoIPRequest.City
$IPObject | Add-Member -Type NoteProperty -Name "Country" -Value $geoIPRequest.Country.Name
$IPObject | Add-Member -Type NoteProperty -Name "Code" -Value $geoIPRequest.Country.Code
$IPObject | Add-Member -Type NoteProperty -Name "Latitude" -Value $geoIPRequest.Location.Latitude
$IPObject | Add-Member -Type NoteProperty -Name "Longitude" -Value $geoIPRequest.Location.Longitude
$IPObject | Add-Member -Type NoteProperty -Name "TimeZone" -Value $geoIPRequest.Location.Time_zone

return $IPObject