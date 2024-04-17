# Prompt the user to enter a password
$password = Read-Host -Prompt "Enter your password" -AsSecureString

# Convert the secure string password to plain text
$plaintextPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))

# Specify the file path where you want to save the password on the desktop
$desktopPath = [System.IO.Path]::Combine($env:USERPROFILE, "Desktop")
$filePath = Join-Path -Path $desktopPath -ChildPath "Password.txt"

# Write the password to a plain text file
$plaintextPassword | Out-File -FilePath $filePath -Encoding ASCII

Write-Host "Password saved to $filePath."
