SELECT 
    sub2.au_id,
    SUM(sub2.sum_royalty) AS royalty,
    SUM(titles.advance) AS advance,
    SUM(sub2.sum_royalty) + SUM(titles.advance) AS revenue
FROM
   /* (SELECT 
        sub1.au_id,
            sub1.title_id,
            sub1.au_fname,
            sub1.au_lname,
            SUM(sub1.sales_royalty) AS sum_royalty
    FROM */
        (SELECT 
        authors.au_id,
            titleauthor.title_id,
            authors.au_fname,
            authors.au_lname,
            sum(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS sum_royalty -- sales_royalty
		FROM
			authors
		INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
		INNER JOIN sales ON sales.title_id = titleauthor.title_id
		INNER JOIN titles ON sales.title_id = titles.title_id
		-- ORDER BY au_id -- ) sub2 -- sub1
        
    GROUP BY au_id , title_id
    ORDER BY au_id) sub2

INNER JOIN
    titles ON sub2.title_id = titles.title_id
GROUP BY au_id
ORDER BY revenue DESC
LIMIT 3;		
