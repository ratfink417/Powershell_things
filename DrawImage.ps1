# Uses the Reflection api to load dlls from windows to perform drawing functions and plaster an image on the screen



$path = Read-Host "path to image "
[Reflection.Assembly]::LoadWithPartialName('System.Drawing')
[Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')

$image = New-Object System.Drawing.Bitmap($path)

$clear_win = New-Object System.Windows.Forms.Form
$clear_win.BackgroundImage = $image
$clear_win.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::None
$clear_win.Bounds = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
$clear_win.TopMost = $true

[System.Windows.Forms.Application]::EnableVisualStyles()
[System.Windows.Forms.Application]::Run($clear_win)
while($true)
{
$clear_win.TopMost = $true
Write-Output $clear_win.FormClosed
#if($clear_win.FormClosed -eq $true){[System.Windows.Forms.Application]::Run($clear_win)}
}
