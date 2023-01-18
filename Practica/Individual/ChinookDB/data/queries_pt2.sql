--ex1
SELECT 
    i.InvoiceId AS Id_factura,
    i.InvoiceDate AS Fecha_factura,
    i.BillingCountry AS Pais_factura,
    c.FirstName || " " || c.LastName AS Nombre_cliente
FROM invoices AS i
INNER JOIN customers AS c ON i.CustomerId = c.CustomerId
WHERE i.BillingCountry = "Brazil";

--ex2
SELECT 
    i.*
FROM invoices AS i
WHERE i.BillingCountry = "Brazil";

--ex3
SELECT
    i.*,
    e.FirstName || " " || e.LastName AS Nombre_empleado
FROM invoices AS i
INNER JOIN customers AS c ON i.CustomerId = c.CustomerId
INNER JOIN employees AS e ON c.SupportRepId = e.EmployeeId
WHERE e.Title = "Sales Support Agent";

SELECT
    i.*,
    e.FirstName || " " || e.LastName AS Nombre_empleado
FROM employees AS e
INNER JOIN customers AS c ON c.SupportRepId = e.EmployeeId
INNER JOIN invoices AS i ON i.CustomerId = c.CustomerId
WHERE e.Title = "Sales Support Agent";

--ex4
SELECT
    c.FirstName || " " || c.LastName AS Nombre_cliente,
    c.Country AS Pais_cliente,
    e.FirstName || " " || e.LastName AS Nombre_empleado,
    SUM(i.Total),
    COUNT(i.Total)
FROM invoices AS i
INNER JOIN customers AS c ON i.CustomerId = c.CustomerId
INNER JOIN employees AS e ON c.SupportRepId = e.EmployeeId
GROUP BY 1,2,3;

--ex5
SELECT 
    ii.*,
    t.Name
FROM invoice_items AS ii
INNER JOIN tracks AS t ON ii.TrackId = t.TrackId
;

--ex6
SELECT
    t.Name AS Cancion,
    m.Name AS Formato,
    a.Title AS Album,
    g.Name AS Genero
FROM tracks AS t
INNER JOIN media_types AS m ON t.MediaTypeId = m.MediaTypeId
INNER JOIN albums AS a ON t.AlbumId = a.AlbumId
INNER JOIN genres AS g ON t.GenreId = g.GenreId;

--ex7
SELECT
    p.Name AS Playlist,
    COUNT(pt.trackId) AS N_canciones
FROM playlist_track as pt
INNER JOIN playlists as p ON pt.PlaylistId = p.PlaylistId
GROUP BY Playlist
ORDER BY N_canciones DESC;

--ex8
SELECT
    e.FirstName || " " || e.LastName AS Nombre_empleado,
    ROUND(SUM(i.Total),2),
    COUNT(i.Total)
FROM invoices AS i
INNER JOIN customers AS c ON i.CustomerId = c.CustomerId
INNER JOIN employees AS e ON c.SupportRepId = e.EmployeeId
GROUP BY 1;

--ex9
SELECT
    e.FirstName || " " || e.LastName AS Nombre_empleado,
    ROUND(SUM(i.Total),2),
    COUNT(i.Total)
FROM invoices AS i
INNER JOIN customers AS c ON i.CustomerId = c.CustomerId
INNER JOIN employees AS e ON c.SupportRepId = e.EmployeeId
WHERE strftime("%Y", i.InvoiceDate) = "2009"
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

--ex10

SELECT 
    ar.Name AS Grupo,
    ROUND(SUM(i.Total),2)
FROM artists AS ar
INNER JOIN albums as al ON ar.ArtistId = al.ArtistId
INNER JOIN tracks as t ON t.AlbumId = al.AlbumId
INNER JOIN invoice_items as ii ON t.TrackId = ii.TrackId
INNER JOIN invoices as i ON i.InvoiceId = ii.InvoiceId
GROUP BY 1
ORDER BY 2 DESC;


    