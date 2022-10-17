# import target systems
param(
    $Servers = (get-content -Path "hosts.txt")
)

#Method 1
# Get logged in user and delete everyone else's teams version
# Function body.
ForEach($server in $Servers) {
  $logged_user = Get-WmiObject –ComputerName $server –Class Win32_ComputerSystem | Select-Object UserName
  $instance = New-PSSession -ComputerName $server
  
  #loop home dirs in C:\users
  $profiles = Get-ChildItem –Path "C:\Users"

	Foreach ($user in $profiles) { 
		#delete 'current' folder in path if $user isnt equal to logged in profile
		if ($user -eq $logged_user){
			# do nothing
		}else{
			Remove-Item "C:\Users\$user\AppData\Local\Microsoft\Teams\current -Recurse -Force"
		}
	}
}

# Method 2
# Delete all profile teams
ForEach($server in $Servers) {
  #Connect to system
  $instance = New-PSSession -ComputerName $server
 
  #loop home dirs in C:\users
  $profiles = Get-ChildItem –Path "C:\Users"

	Foreach ($user in $profiles) { 
		#delete 'current' folder in path
		
		Remove-Item "C:\Users\$user\AppData\Local\Microsoft\Teams\current -Recurse -Force"

	}
}