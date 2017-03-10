#Add users from spreadsheet to a local group
$path = "C:\Users\UKIStudent\Desktop\roster.xlsx"
$excel = New-Object -ComObject Excel.Application
$excel.Visible = $false
$wb = $excel.Workbooks.Open($path)
$sheet = $wb.Worksheets.Item("Sheet1")

$rowMax = ($sheet.UsedRange.Rows).count

$rowFisrtName,$colFirstName = 1,1
$rowLastName,$colLastName = 1,2

clear
Try{Get-LocalGroup -Name 'Powershell'-ErrorAction Stop}
Catch{New-LocalGroup 'Powershell';Write-Host 'Created Powershell Group'}


for($i=1;$i -le $rowMax; $i++){
    $firstName = $sheet.Cells.Item($rowFirstName + $i, $colFirstName).Text
    $lastName = $sheet.Cells.Item($rowLastName + $i, $colLastName).Text
    $member = "$firstName"
    Write-Output "adding $firstName to the powershell group"
    New-LocalUser -Name $member -NoPassword
    Add-LocalGroupMember -Member $member -Group 'Powershell'
}
$wb.Close()
