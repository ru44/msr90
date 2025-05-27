#!/usr/bin/env fish

# ============================================================================
#     This program is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
#
#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
#
#     You should have received a copy of the GNU General Public License
#     along with this program.  If not, see <http://www.gnu.org/licenses/>.
# ============================================================================
    
clear
echo "CardReader MSR90"

while true
    echo "Please Swipe Your Card (Enter to Exit):"
    read data

    if test -z "$data"
        echo "Exiting"
        break
    end

    if not string match -qr "^%B" -- "$data"
        echo "Invalid card data. Please try again."
        continue
    end

    clear

    set track (string replace -r '^%B' '' -- "$data")
    set fields (string split '^' -- "$track")
    set card_number $fields[1]
    set name $fields[2]
    set exp $fields[3]

    set name_parts (string split '/' -- "$name")
    set last $name_parts[1]
    set first $name_parts[2]

    set exp_month (string sub -s 1 -l 2 "$exp")
    set exp_year (string sub -s 3 -l 2 "$exp")
    set exp_date "$exp_month/$exp_year"

    echo "Card Number:     $card_number"
    echo "Card Holder:     $first $last"
    echo "Expiration Date: $exp_date"
    echo "----------------------------"
end
