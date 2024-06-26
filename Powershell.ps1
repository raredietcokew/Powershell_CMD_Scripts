# Prompt the user to enter their username
$username = Read-Host -Prompt "Enter your username"

# Prompt the user to enter their password
$password = Read-Host -Prompt "Enter your password" -AsSecureString

# Convert the secure string password to plain text
$plaintextPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))

# Specify the file path where you want to save the credentials on the D:\ drive
$filePath = "D:\Credentials.txt"

# Create a string containing the username and password
$credentialString = "Username: $username`nPassword: $plaintextPassword"

# Write the credential string to a text file
$credentialString | Out-File -FilePath $filePath -Encoding ASCII

Write-Host "Credentials saved to $filePath."
