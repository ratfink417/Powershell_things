#Gives you the option to check the status of a service or quit the program.
#if the user submits an invalid service name, the program gracefully errors out
#stating that their input was not valid and returns to the front menu

function Service-Select($service)
{
    
    Try
    {
        $service = Get-Service $service -ErrorAction Stop
        $name = $service.Name 
        $status = $service.Status
        "$name is $status" 
    }

    Catch{Write-Output "$service is not a service"}
}

function menu
{
 param([string]$Title = 'Menu Options')   
 cls
 Write-Host "==================$Title=================="

 Write-Host "1: Check Service Status"
 Write-Host "2: Exit the program"
}

do
{
menu
$input = Read-Host "What you wanna do boss?"
if($input -eq 1)
   {
    $srv = Read-Host "Service Name "
    #Get-Service $srv -ErrorAction SilentlyContinue
    Service-Select $srv
   }
    pause
}
until($input -eq '2')





