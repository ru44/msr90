<# 
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#>

Clear-Host
Write-Host "CardReader MSR90"

while ($true) {
    Write-Host "Please Swipe Your Card (Enter to Exit):"
    $data = Read-Host

    if ([string]::IsNullOrWhiteSpace($data)) {
        Write-Host "Exiting"
        break
    }

    if (-not $data.StartsWith("%B")) {
        Write-Host "Invalid card data. Please try again."
        continue
    }

    Clear-Host

    $track = $data.Substring(2) # Remove %B
    $fields = $track -split '\^'
    $cardNumber = $fields[0]
    $nameParts = $fields[1] -split '/'
    $lastName = $nameParts[0]
    $firstName = $nameParts[1]
    $exp = $fields[2]
    # Track 1 stores the expiry as YYMM
    $expDate = "$($exp.Substring(2,2))/$($exp.Substring(0,2))"

    Write-Host "Card Number:     $cardNumber"
    Write-Host "Card Holder:     $firstName $lastName"
    Write-Host "Expiration Date: $expDate"
    Write-Host "----------------------------"
}
