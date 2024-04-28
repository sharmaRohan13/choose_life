param (
    [int]$snooze = 5,
    [int]$iterations = 10,
    [string]$addiction = 'PORN'
)

function Main {
    $continue = Read-Host "Do you want to continue (y) or snooze (t)? [y/t]"
    
    if ($continue -eq "y") {
        Write-Host "Please type "QUIT $addiction, CHOOSE LIFE!" $iterations times:"
	Write-Host "Everytime you write a line, Close your eyes be conscious, think of a reason (life, mind, relationships, etc.):"
        for ($i = 0; $i -lt $iterations; $i++) {
            $inputText = Read-Host -Prompt "Line $($i + 1)"
            if ($inputText -ne "QUIT $addiction, CHOOSE LIFE!") {
                Write-Host "Incorrect input. Please type 'QUIT $addiction, CHOOSE LIFE!' exactly as instructed."
                $i--  # Decrement $i to retry the current line
            }
        }
        Write-Host "LET'S MAKE IT HAPPEN !!"
        $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    } elseif ($continue -eq "t") {
        $snoozeMinutes = Read-Host "Enter snooze time in minutes (max 30, default 5):"
        if ([string]::IsNullOrEmpty($snoozeMinutes)) {
            $snoozeMinutes = 5
        } elseif ($snoozeMinutes -lt 1 -or $snoozeMinutes -gt 30) {
            Write-Host "Invalid snooze time. Using default (5 minutes)."
            $snoozeMinutes = 5
        }
	$snoozeSeconds = [int]$snoozeMinutes * 60
        Write-Host "Snoozing for $snoozeMinutes minutes..."
        Start-Sleep -Seconds $snoozeSeconds
	Main
    } else {
        Write-Host "Invalid option. Please try again."
	Main
    }
}

Main
