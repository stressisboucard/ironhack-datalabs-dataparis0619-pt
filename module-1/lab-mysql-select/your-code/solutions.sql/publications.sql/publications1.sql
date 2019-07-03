    
SELECT 
    authors.au_id,
    titleauthor.title_id,
    authors.au_fname,
    authors.au_lname,
    titles.title
FROM
    authors
        INNER JOIN
    titleauthor ON authors.au_id = titleauthor.au_id
        INNER JOIN
    titles ON titles.title_id = titleauthor.title_id
	

