#!/home/captain/miniconda3/bin/python

import csv
import sys

rows = []

def main():
    for line in sys.stdin:
        cleanLine = line.strip().strip('|')
            
        if not cleanLine:
            continue

        if '----' in cleanLine:
            continue

        if "Prepared fo" in cleanLine:
            continue

        if "Delivery" in cleanLine:
            continue

        if "delivery" in cleanLine:
            continue

        if "Freight" in cleanLine:
            continue

        if "freight" in cleanLine:
            continue

        cells = [cell.strip() for cell in cleanLine.split('|')]
        rows.append(cells)

    with open("samples.tables.csv", 'w', newline='') as fh:
        writer = csv.writer(fh)
        writer.writerows(rows)


if __name__== "__main__":
    main()

