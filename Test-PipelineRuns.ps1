using namespace System



function WriteValue
(	[string]$name
, $arg
)
{
	"${name}: $arg ($($null -eq $arg ? 'null' : $arg.GetType().Name))"
}



function Test-Array
{
	param
	(	[Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true)][int[]]$Argument
	,	[Parameter(Mandatory = $true, Position = 1)][string]$Title
	, [Parameter(Mandatory = $false, Position = 2)][ConsoleColor]$Color = [ConsoleColor]::Yellow
	)

	begin
	{
		''
		Write-Host -ForegroundColor $Color $Title

		'/== begin ==================================================\'
		"$(WriteValue '$_' $_), $(WriteValue '$PSItem' $PSItem), $(WriteValue '$Argument' $Argument)"
	}

	process
	{
		'=== process ================================================='
		"$(WriteValue '$_' $_), $(WriteValue '$PSItem' $PSItem), $(WriteValue '$Argument' $Argument)"
	}

	end
	{
		'\== end ====================================================/'
		"$(WriteValue '$_' $_), $(WriteValue '$PSItem' $PSItem), $(WriteValue '$Argument' $Argument)"
	}
}



function Test-SingleValue
{
	param
	(	[Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true)][int]$Argument
	,	[Parameter(Mandatory = $true, Position = 1)][string]$Title
	, [Parameter(Mandatory = $false, Position = 2)][ConsoleColor]$Color = [ConsoleColor]::Yellow
	)

	begin
	{
		''
		Write-Host -ForegroundColor $Color $Title

		'/== begin ==================================================\'
		"$(WriteValue '$_' $_), $(WriteValue '$PSItem' $PSItem), $(WriteValue '$Argument' $Argument)"
	}

	process
	{
		'=== process ================================================='
		"$(WriteValue '$_' $_), $(WriteValue '$PSItem' $PSItem), $(WriteValue '$Argument' $Argument)"
	}

	end
	{
		'\== end ====================================================/'
		"$(WriteValue '$_' $_), $(WriteValue '$PSItem' $PSItem), $(WriteValue '$Argument' $Argument)"
	}
}



[int[]]$array = 1..4
[int]$value = 8

$array | Test-Array -Title 'Test-Array using array in pipeline' -Color Green
Test-Array -Argument $array -Title 'Test-Array using array argument' -Color Yellow
$array | Test-SingleValue -Title 'Test-SingleValue using array in pipeline' -Color Cyan
Test-SingleValue -Argument $array -Title 'Test-SingleValue using array argument' -Color Magenta

$value | Test-Array -Title 'Test-Array using value in pipeline' -Color Green
Test-Array -Argument $value -Title 'Test-Array using value argument' -Color Yellow
$value | Test-SingleValue -Title 'Test-SingleValue using value in pipeline' -Color Cyan
Test-SingleValue -Argument $value -Title 'Test-SingleValue using value argument' -Color Magenta

$null | Test-Array -Title 'Test-Array using $null in pipeline' -Color Green
Test-Array -Argument $null -Title 'Test-Array using $null argument' -Color Yellow
$null | Test-SingleValue -Title 'Test-SingleValue using $null in pipeline' -Color Cyan
Test-SingleValue -Argument $null -Title 'Test-SingleValue using $null argument' -Color Magenta
