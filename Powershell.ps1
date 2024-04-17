# Prompt the user to enter their username
$username = Read-Host -Prompt "Enter your username"

# Prompt the user to enter their password
$password = Read-Host -Prompt "Enter your password" -AsSecureString

# Convert the secure string password to plaintext
$plaintextPassword = ConvertFrom-SecureString -SecureString $password

# Specify the file path where you want to save the credentials on the desktop
$desktopPath = [System.IO.Path]::Combine($env:USERPROFILE, "Desktop")
$filePath = Join-Path -Path $desktopPath -ChildPath "Credentials.txt"

# Create a string containing the username and password
$credentialString = "Username: $username`nPassword: $plaintextPassword"

# Write the credential string to a text file
$credentialString | Out-File -FilePath $filePath -Encoding ASCII

Write-Host "Credentials saved to $filePath."
