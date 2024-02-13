-- Dataset downloaded from https://www.kaggle.com/datasets/stackoverflow/stackoverflow/code
-- Preview the first five rows of the posts_questions table
SELECT * FROM posts_questions LIMIT 5;

-- Preview the first five rows of the posts_answers table
SELECT * FROM posts_answers LIMIT 5;

-- Query to find how long it takes for questions to receive answers
-- It filters for questions created in January 2018
SELECT 
    q.id AS q_id,
    MIN(TIMESTAMPDIFF(SECOND, q.creation_date, a.creation_date)) AS time_to_answer
FROM 
    posts_questions AS q
LEFT JOIN 
    posts_answers AS a ON q.id = a.parent_id
WHERE 
    q.creation_date >= '2018-01-01' AND q.creation_date < '2018-02-01'
GROUP BY 
    q_id
ORDER BY 
    time_to_answer;

-- Query to find users who have only asked questions or provided answers but not both
-- It uses a FULL JOIN and groups by the user_id to determine their first question and answer creation dates
SELECT 
    q.owner_user_id AS owner_user_id,
    MIN(q.creation_date) AS q_creation_date,
    MIN(a.creation_date) AS a_creation_date
FROM 
    posts_questions AS q
FULL JOIN 
    posts_answers AS a ON q.owner_user_id = a.owner_user_id 
WHERE 
    (q.creation_date >= '2019-01-01' AND q.creation_date < '2019-02-01') 
    OR 
    (a.creation_date >= '2019-01-01' AND a.creation_date < '2019-02-01')
GROUP BY 
    owner_user_id;

-- Query to check activity of users who joined the site in January 2019
SELECT 
    u.id AS id, 
    MIN(q.creation_date) AS q_creation_date, 
    MIN(a.creation_date) AS a_creation_date
FROM 
    users AS u
LEFT JOIN 
    posts_answers AS a ON a.owner_user_id = u.id
LEFT JOIN 
    posts_questions AS q ON q.owner_user_id = u.id
WHERE 
    u.creation_date >= '2019-01-01' AND u.creation_date < '2019-02-01'
GROUP BY 
    id;

-- Query to find how many distinct users posted on January 1, 2019
SELECT 
    DISTINCT owner_user_id 
FROM 
    posts_questions 
WHERE 
    DATE(creation_date) = '2019-01-01'
UNION 
SELECT 
    DISTINCT owner_user_id
FROM 
    posts_answers 
WHERE 
    DATE(creation_date) = '2019-01-01';
