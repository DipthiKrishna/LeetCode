-- to find invalid teets
SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;
