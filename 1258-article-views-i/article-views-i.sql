-- Article views
SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id;