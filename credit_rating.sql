WITH credit_history AS (
  SELECT
    ID,
    group_concat(STATUS, "") as HISTORY
  FROM credit_records
  GROUP BY ID
  ORDER BY ID, MONTHS_BALANCE
)
SELECT
  ID,
  HISTORY,
  (CASE
    WHEN HISTORY LIKE "%5%" THEN -1
    WHEN HISTORY REGEXP "\b(C|X|0)+\b" THEN 1
    ELSE 0 END
  )	AS RATING
FROM credit_history;

