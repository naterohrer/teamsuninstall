# MS Teams Version control (for non-primary user profiles)
Since MS Teams updates the application per user profile, this script was written to delete the non-primary user's application version so it doesnt interfere with vulnerability scans.
You can manually do this as a local admin, simply delete the 'current' directory in %userprofile%\AppData\Local\Microsoft\Teams\ . Once the user logs in again, the current folder will regenerate with the updated Teams version.
