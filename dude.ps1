# Create a WSH Shell object
$wshell = New-Object -ComObject Wscript.Shell

# Display the pop-up notification
$wshell.Popup("Your notification message here", 0, "Notification Title", 0x0)
