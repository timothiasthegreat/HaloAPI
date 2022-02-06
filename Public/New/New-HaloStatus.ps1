Function New-HaloStatus {
    <#
        .SYNOPSIS
            Creates a status via the Halo API.
        .DESCRIPTION
            Function to send a status creation request to the Halo API
        .OUTPUTS
            Outputs an object containing the response from the web request.
    #>
    [CmdletBinding( SupportsShouldProcess = $True )]
    [OutputType([Object])]
    Param (
        # Object containing properties and values used to create a new status.
        [Parameter( Mandatory = $True )]
        [Object]$Status
    )
    Invoke-HaloPreFlightCheck
    try {
        if ($PSCmdlet.ShouldProcess("Status '$($Status.name)'", 'Create')) {
            New-HaloPOSTRequest -Object $Status -Endpoint 'status'
        }
    } catch {
        New-HaloError -ErrorRecord $_
    }
}