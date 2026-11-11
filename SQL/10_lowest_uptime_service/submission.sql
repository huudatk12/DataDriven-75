WITH CTE AS(
  SELECT svc_name,
  MIN(uptime) AS min_uptime,
  DENSE_RANK() OVER (ORDER BY MIN(uptime)) AS rnk
  FROM svc_health
  GROUP BY svc_name
  ORDER BY uptime
)
SELECT svc_name, min_uptime
FROM CTE
WHERE rnk <= 10
