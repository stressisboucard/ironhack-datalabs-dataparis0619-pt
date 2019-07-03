    
SELECT 
    authors.au_id,
    titleauthor.title_id,
    authors.au_fname,
    authors.au_lname,
    titles.title,
    publishers.pub_id,
    publishers.pub_name,
    count(titles.title) AS title
    
FROM
    authors
        INNER JOIN
    titleauthor ON authors.au_id = titleauthor.au_id
        INNER JOIN
    titles ON titles.title_id = titleauthor.title_id
        INNER JOIN
    publishers ON publishers.pub_id = titles.pub_id
group by publishers.pub_id, authors.au_id;
    
