[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 

#Password generator too made by Benny and Stevo


Function Password([System.Windows.Forms.TextBox]$text_box){
    $array = ""
    $random = 0
    $i = 0
    $cs = 0
    $cl = 0
    $cu = 0
    $work = 0
    $password = 0
 
     while ($work -eq 0){
        while ($array.Length -lt 12) {
        $random = (65..90) + (97..122) + (33) + (35..38) + (42) + (64) | Get-Random -Count 1 | % {[char]$_}
        $array = (-join($array,$random))
        } 
        $cs = $array -replace '[abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ]',''
    
            if ($cs.Length -ge 2){
                $work = 1
                $password = $array
                clear
                $text_box.Text = $password
            }
            else {
                $work = 0
                $array = ""
                $random = 0
                $i = 0
                $cs = 0
                $cl = 0
                $cu = 0
                $work = 0
                
            }
    }
}

$objForm = New-Object System.Windows.Forms.Form 
$objForm.Text = "Password Generator"
$objForm.Size = New-Object System.Drawing.Size(300,300) 
$objForm.StartPosition = "CenterScreen"

$objForm.KeyPreview = $True
$objForm.Add_KeyDown({if ($_.KeyCode -eq "Enter") 
    {$x=$objTextBox.Text;$objForm.Close()}})
$objForm.Add_KeyDown({if ($_.KeyCode -eq "Escape") 
    {$objForm.Close()}})

#Generate button
$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Size(75,200)
$OKButton.Size = New-Object System.Drawing.Size(75,23)
$OKButton.Text = "Generate"
$OKButton.Add_Click({$x=$objTextBox.Text;Password($objTextBox)})
$objForm.Controls.Add($OKButton)

#Cancel Button
$CancelButton = New-Object System.Windows.Forms.Button
$CancelButton.Location = New-Object System.Drawing.Size(150,200)
$CancelButton.Size = New-Object System.Drawing.Size(75,23)
$CancelButton.Text = "Cancel"
$CancelButton.Add_Click({$objForm.Close()})
$objForm.Controls.Add($CancelButton)

$objLabel = New-Object System.Windows.Forms.Label
$objLabel.Location = New-Object System.Drawing.Size(10,20) 
$objLabel.Size = New-Object System.Drawing.Size(280,20) 
$objLabel.Text = "Your new password"
$objTextBox.Size = New-Object System.Drawing.Size(260,20) 
$objForm.Controls.Add($objLabel) 

#Password output box
$objTextBox = New-Object System.Windows.Forms.TextBox 
$objTextBox.Location = New-Object System.Drawing.Size(10,40)
$objTextBox.Size = New-Object System.Drawing.Size(260,40) 
$objForm.Controls.Add($objTextBox) 



$objForm.Topmost = $True

$objForm.Add_Shown({$objForm.Activate()})
[void] $objForm.ShowDialog()

$x
