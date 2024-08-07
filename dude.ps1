Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Hello World GUI'
$form.Size = New-Object System.Drawing.Size(300,200)
$form.StartPosition = 'CenterScreen'

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Hello, World!'
$label.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$label.Font = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Bold)

$button = New-Object System.Windows.Forms.Button
$button.Location = New-Object System.Drawing.Point(100,100)
$button.Size = New-Object System.Drawing.Size(100,30)
$button.Text = 'Close'
$button.Add_Click({ $form.Close() })

$form.Controls.Add($label)
$form.Controls.Add($button)

$form.Topmost = $true

$form.ShowDialog()
