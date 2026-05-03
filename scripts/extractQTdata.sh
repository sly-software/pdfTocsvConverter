#!/usr/bin/bash
#!/home/captain/miniconda3/bin/python

# you need docling to run this code
# best to do is to create a python environment and install docling
# via pip then activate it and run this script follow steps below
#**************************************
# python venv -m doclin
# source .docling/bin/activate
# pip install docling
#**************************************


filePath=$(realpath $1)
fileToProces=$(basename $filePath .pdf)

# It will create "samples.tables.csv" file for further manipulation
python3 pdfToMd.py $filePath | grep "^|" | python3 get.tables.py

# Remove VAT and duplicates header colums and save to ${fileToProces}.csv
cat samples.tables.csv | \
grep "VAT" | \
head -n1 > ../output/${fileToProces}.csv && cat samples.tables.csv | \
grep -v "VAT" >> ../output/${fileToProces}.csv


## Error detection
if [ $? -eq 0 ]; then
    echo "PDF Extracted successfully!"

    # Cleanup intermediate files
    rm samples.tables.csv
else
    echo "Error: The python script crashed. Did you activate the correct .env"
    exit 1
fi
