SELECT 
    authors.au_id,
    titleauthor.title_id,
    authors.au_fname,
    authors.au_lname,
    SUM(sales.qty) AS total_sales
FROM
    authors
        INNER JOIN
    titleauthor ON authors.au_id = titleauthor.au_id
        INNER JOIN
    sales ON sales.title_id = titleauthor.title_id
GROUP BY authors.au_id , titleauthor.title_id , authors.au_fname , authors.au_lname
ORDER BY total_sales DESC
LIMIT 3

    
