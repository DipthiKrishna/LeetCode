WITH a1 AS (
        SELECT question_id,
               SUM(CASE WHEN action = 'answer' THEN 1 ELSE 0 END)*1.0 / NULLIF(SUM(CASE WHEN action = 'show' THEN 1 ELSE 0 END),0) AS answer_rate
        FROM SurveyLog
        GROUP BY question_id)
SELECT question_id AS survey_log
FROM (
    SELECT question_id,
           RANK() OVER (ORDER BY answer_rate DESC, question_id ASC) AS rnk
    FROM a1
) AS ranked_questions
WHERE rnk = 1;

