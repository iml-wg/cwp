import csv

if __name__ == '__main__':
    authors = []

    with open('author_list.csv') as csvfile:
        reader = csv.DictReader(csvfile)
        authors = [{'first_name': row['first_name'],
                    'last_name': row['last_name'],
                    'institution': row['institution']} for row in reader]

    authors = sorted(authors, key=lambda k: k['last_name'])

    # list of the unique institutions ordered as the authors are
    institutions = []
    for author in authors:
        if author['institution'] not in institutions:
            institutions.append(author['institution'])

    # Get the number of the author's institution and write to string
    latex_file_string = ''
    for author in authors:
        author['institution_index'] = institutions.index(
            author['institution']) + 1
        latex_file_string += str(author['first_name']) + ', ' + str(author['last_name']) + \
            '$^{' + str(author['institution_index']) + '}$;\n'

    latex_file_string += '\\bigskip\n'

    for institution in institutions:
        latex_file_string += '\\par {\\footnotesize $^{' + \
            str(institutions.index(institution) + 1) + \
            '}$ ' + str(institution) + '}\n'

    latex_file_string += '\n\\clearpage\n'

    with open('src/authors.tex', 'w') as out_file:
        out_file.write(latex_file_string)
