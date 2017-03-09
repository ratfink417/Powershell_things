#Iterates through rows and columns of an excel spreadsheet

$path = "C:\Users\UKIStudent\Documents\Book1.xlsx"
$excel = New-Object -ComObject Excel.Application
$excel.Visible = $false
$wb = $excel.Workbooks.Open($path)
$sheet = $wb.Worksheets.Item("Sheet1")

$rowMax = ($sheet.UsedRange.Rows).count


$rowName,$colName = 1,1
$rowAge,$colAge = 1,2
$rowCity,$colCity = 1,3
$rowGay, $colGay = 1,4

clear

for($i=1;$i -le $rowMax; $i++){
    $name = $sheet.Cells.Item($rowName + $i, $colName).Text
    $age = $sheet.Cells.Item($rowName + $i, $colAge).Text
    $city = $sheet.Cells.Item($rowName + $i, $colCity).Text

    Write-Output "$name $age $city"
}
$wb.Close()
