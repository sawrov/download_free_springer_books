# download_free_springer_books

This is a small script to download the  free books from springer listed in the pdf file.

I have copied the content of the pdf file to a text file pdf_to_text using ubuntu text editor.
The script extracts  http links from the initial file.
The links are then saved to a text file. The downloadable pdf links are then extracted again from these links. Finally wget
is used to download all the pdf files.


How to run

Make the bash file executable ( chmod +x download_all_available_books.sh)
Run the script.
