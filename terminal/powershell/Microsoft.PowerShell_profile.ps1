# Alias

if (!(Test-Path alias:l))
{
    New-Alias l Get-ChildItem
}
if (!(Test-Path alias:vim))
{
    New-Alias vim "C:/Program Files (x86)/Vim/vim80/./vim.exe"
}

# Functions

Function Edit-Profile
{
    vim $profile
}

# To edit Vim settings
Function Edit-Vimrc
{
    vim $HOME\_vimrc
}

# Colors

Import-Module PSColor

$global:PSColor = @{
    File = @{
        Default    = @{ Color = 'White' }
        Directory  = @{ Color = 'Cyan'}
        Hidden     = @{ Color = 'DarkGray'; Pattern = '^\.' }
        Code       = @{ Color = 'Magenta'; Pattern = '\.(java|c|cpp|cs|js|css|html)$' }
        Executable = @{ Color = 'Red'; Pattern = '\.(exe|bat|cmd|py|pl|ps1|psm1|vbs|rb|reg)$' }
        Text       = @{ Color = 'Yellow'; Pattern = '\.(txt|cfg|conf|ini|csv|log|config|xml|yml|md|markdown)$' }
        Compressed = @{ Color = 'Green'; Pattern = '\.(zip|tar|gz|rar|jar|war)$' }
    }
    Service = @{
        Default = @{ Color = 'White' }
        Running = @{ Color = 'DarkGreen' }
        Stopped = @{ Color = 'DarkRed' }
    }
    Match = @{
        Default    = @{ Color = 'White' }
        Path       = @{ Color = 'Cyan'}
        LineNumber = @{ Color = 'Yellow' }
        Line       = @{ Color = 'White' }
    }
}

Push-Location (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)

# Posh-Git

Import-Module posh-git


function Test-Administrator {
    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

# Prompt
function global:prompt {
    $realLASTEXITCODE = $LASTEXITCODE

    if ($Error.Count -ne 0) {
        Write-Host " " -NoNewLine
        Write-Host " X ERR " -NoNewLine -BackgroundColor DarkRed -ForegroundColor Yellow
        $Error.Clear()
    }

    # Show username. Prefix with (Elevated) for Admin sessions
    if (Test-Administrator) {  
        Write-Host "(Elevated) " -NoNewline -ForegroundColor White
    }
    Write-Host "[$ENV:USERNAME]" -NoNewline -ForegroundColor DarkYellow

    # Write Git information
    if ((Get-Command "Get-GitDirectory" -ErrorAction Ignore) -ne $null) {
        if (Get-GitDirectory -ne $null) {
            Write-Host (Write-VcsStatus) -NoNewLine
        }
    }

    # Write the current directory, with home folder normalized to ~
    $currentPath = (get-location).Path.replace($home, "~")
    $idx = $currentPath.IndexOf("::")
    if ($idx -gt -1) { $currentPath = $currentPath.Substring($idx + 2) }

    Write-Host " " -NoNewLine
    Write-Host " ?" -NoNewLine -BackgroundColor DarkGreen -ForegroundColor Yellow
    Write-Host " $currentPath " -NoNewLine -BackgroundColor DarkGreen -ForegroundColor White
    Write-Host
    
    # Different prompt for Powershell or Powershell core
    #   $isDesktop = ($PSVersionTable.PSEdition -eq "Desktop")
    # 
    #   if ($isDesktop) {
    #       Write-Host " PS>" -NoNewLine -ForegroundColor DarkGray
    #   }
    #   else {
    #       Write-Host " PS-core>" -NoNewLine -ForegroundColor DarkGray
    #   }
    #

    Write-Host ">" -nonewline -ForegroundColor DarkGray

    $global:LASTEXITCODE = $realLASTEXITCODE
    return " "
}


Pop-Location

Start-SshAgent -Quiet

# Git Aliases

. $HOME\.powershell_profile_scripts\posh-git-alias.ps1

# PSReadline

Import-Module PSReadLine

Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -HistorySaveStyle SaveIncrementally
Set-PSReadLineOption -MaximumHistoryCount 4000
# history substring search
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# Tab completion
Set-PSReadlineKeyHandler -Chord 'Shift+Tab' -Function Complete
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
