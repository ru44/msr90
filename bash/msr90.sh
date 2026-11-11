#!/bin/sh

:<<'info'
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
info

clear
echo "CardReader MSR90"

while true; do
    echo "Please Swipe Your Card (Enter to Exit):"
    read data

    if [ -z "$data" ]; then
        echo "Exiting"
        exit 0
    fi

    echo "$data" | grep -q "^%B"
    if [ $? -ne 0 ]; then
        echo "Invalid card data. Please try again."
        continue
    fi

    clear

    # Remove leading %B and split fields
    track1=$(echo "$data" | sed 's/^%B//')
    card_number=$(echo "$track1" | cut -d'^' -f1)
    name=$(echo "$track1" | cut -d'^' -f2)
    exp=$(echo "$track1" | cut -d'^' -f3)

    first=$(echo "$name" | cut -d'/' -f2)
    last=$(echo "$name" | cut -d'/' -f1)

    # Track 1 stores the expiry as YYMM
    exp_year=$(echo "$exp" | cut -c1-2)
    exp_month=$(echo "$exp" | cut -c3-4)
    expdate="$exp_month/$exp_year"

    echo "Card Number:     $card_number"
    echo "Card Holder:     $first $last"
    echo "Expiration Date: $expdate"
    echo "----------------------------"
done
