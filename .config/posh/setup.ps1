$profile_dir = $(Split-Path $PROFILE)
if (-not (Test-Path $profile_dir)) {
    New-Item -ItemType Directory -Path $profile_dir
}
echo '. $HOME\.config\posh\profile.ps1' >> $PROFILE

Install-RSResource posh-git
Install-RSResource Abbr
