#!/home/captain/miniconda3/bin/python

from docling.document_converter import DocumentConverter
import sys

converter = DocumentConverter()

def pdfToMdConvert():
    source = sys.argv[1]
    result = converter.convert(source)

    print(result.document.export_to_markdown())

pdfToMdConvert()
