/*
  This solution identifies the best candidate for each project based on:
  1. Possession of all required skills.
  2. A calculated score (Base 100 + bonuses/penalties).
  3. Tie-breaking rules (Highest score first, then lowest candidate_id).
*/

WITH ProjectRequirements AS (
    -- Step 1: Determine the total number of skills each project needs
    SELECT 
        project_id, 
        COUNT(skill) AS skills_needed
    FROM Projects
    GROUP BY project_id
),

QualifiedCandidates AS (
    -- Step 2: Match candidates to projects and calculate their scores
    SELECT 
        p.project_id,
        c.candidate_id,
        -- Scoring: 100 base + 10 for proficiency > importance - 5 for proficiency < importance
        100 + SUM(
            CASE 
                WHEN c.proficiency > p.importance THEN 10
                WHEN c.proficiency < p.importance THEN -5
                ELSE 0
            END
        ) AS score
    FROM Candidates c
    INNER JOIN Projects p 
        ON c.skill = p.skill
    INNER JOIN ProjectRequirements pr 
        ON p.project_id = pr.project_id
    GROUP BY 
        p.project_id, 
        c.candidate_id, 
        pr.skills_needed
    -- Filter: Only include candidates who have EVERY skill required for the project
    HAVING COUNT(c.skill) = pr.skills_needed
),

RankedResults AS (
    -- Step 3: Rank the candidates for each project based on the criteria
    SELECT 
        project_id,
        candidate_id,
        score,
        ROW_NUMBER() OVER (
            PARTITION BY project_id 
            ORDER BY score DESC, candidate_id ASC
        ) AS rank_pos
    FROM QualifiedCandidates
)

-- Step 4: Final output showing only the #1 candidate per project
SELECT 
    project_id,
    candidate_id,
    score
FROM RankedResults
WHERE rank_pos = 1
ORDER BY project_id ASC;