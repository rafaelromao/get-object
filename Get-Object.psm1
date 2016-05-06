function Get-Object() {
	$delimiter = "`t"
	foreach ($inputObject in $args[0]) {
		$returnObject = New-Object PSObject

		$matches = $null
		$matchCount = 0

		## If so, split the input on that delimiter
		$matches = $InputObject -split $delimiter
		$matchCount = $matches.Length
		$startIndex = 0

		## Go through all of the matches, and add them as notes to the output
		## object.
		for($counter = $startIndex; $counter -lt $matchCount; $counter++)
		{
			$currentPropertyName = "P$($counter - $startIndex + 1)"
			$currentPropertyType = [string]

			## Get the property name
			if($counter -lt $propertyName.Length)
			{
				if($propertyName[$counter])
				{
					$currentPropertyName = $propertyName[$counter - 1]
				}
			}

			## Get the property value
			if($counter -lt $propertyType.Length)
			{
				if($propertyType[$counter])
				{
					$currentPropertyType = $propertyType[$counter - 1]
				}
			}

			Add-Member -InputObject $returnObject NoteProperty `
				-Name $currentPropertyName `
				-Value ($matches[$counter].Trim() -as $currentPropertyType)
		}

		$returnObject
	}
}