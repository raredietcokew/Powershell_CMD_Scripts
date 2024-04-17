# Prompt the user to enter their username
$username = Read-Host -Prompt "Enter your username"

# Prompt the user to enter a password
$password = Read-Host -Prompt "Enter your password" -AsSecureString

# Convert the secure string password to plain text
$plaintextPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))

# Specify the file path where you want to save the credentials on the desktop
$desktopPath = [System.IO.Path]::Combine($env:USERPROFILE, "Desktop")
$filePath = Join-Path -Path $desktopPath -ChildPath "Credentials.txt"

# Create a credential object with the username and password
$credential = New-Object System.Management.Automation.PSCredential ($username, $password)

# Export the credential object to a text file
$credential | Export-Clixml -Path $filePath

Write-Host "Credentials saved to $filePath."
