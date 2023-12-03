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
    /* any 5 in history means this customer is risky */
    WHEN HISTORY LIKE "%5%" THEN "risky"
    /* only 0, C or X, so this customer is good */
    WHEN HISTORY REGEXP "\b(C|X|0)+\b" THEN "good"
    ELSE "moderate" END
  )	AS RATING
FROM credit_history;
