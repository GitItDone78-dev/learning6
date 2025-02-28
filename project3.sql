select * from actualdata;
select * from budgetdata;
SELECT 
    b.Department, 
    b.Year, 
    b.Budget_Amount, 
    a.Actual_Amount, 
    (a.Actual_Amount - b.Budget_Amount) AS Variance, 
    ROUND(((a.Actual_Amount - b.Budget_Amount) / b.Budget_Amount) * 100, 2) AS Variance_Percentage
FROM 
    budgetdata b
JOIN 
    actualdata a 
ON 
    b.Department = a.Department 
    AND b.Year = a.Year;
SELECT 
    b.Department, 
    b.Year, 
    b.Budget_Amount, 
    a.Actual_Amount, 
    (a.Actual_Amount - b.Budget_Amount) AS Variance, 
    ROUND(((a.Actual_Amount - b.Budget_Amount) / b.Budget_Amount) * 100, 2) AS Variance_Percentage
FROM 
    budgetdata b
JOIN 
    actualdata a 
ON 
    b.Department = a.Department 
    AND b.Year = a.Year
WHERE 
    (a.Actual_Amount - b.Budget_Amount) > 0
ORDER BY Variance DESC;

SELECT 
    b.Department, 
    b.Year, 
    b.Budget_Amount, 
    a.Actual_Amount, 
    (a.Actual_Amount - b.Budget_Amount) AS Variance, 
    ROUND(((a.Actual_Amount - b.Budget_Amount) / b.Budget_Amount) * 100, 2) AS Variance_Percentage
FROM 
    budgetdata b
JOIN 
    actualdata a 
ON 
    b.Department = a.Department 
    AND b.Year = a.Year
WHERE 
    (a.Actual_Amount - b.Budget_Amount) < 0
ORDER BY Variance ASC;

SELECT 
    b.Year, 
    SUM(b.Budget_Amount) AS Total_Budget, 
    SUM(a.Actual_Amount) AS Total_Actual, 
    SUM(a.Actual_Amount - b.Budget_Amount) AS Total_Variance,
    ROUND((SUM(a.Actual_Amount - b.Budget_Amount) / SUM(b.Budget_Amount)) * 100, 2) AS Total_Variance_Percentage
FROM 
    budgetdata b
JOIN 
    actualdata a 
ON 
    b.Department = a.Department 
    AND b.Year = a.Year
GROUP BY b.Year;

SELECT 
    b.Year, 
    AVG(a.Actual_Amount - b.Budget_Amount) AS Avg_Variance, 
    ROUND(AVG((a.Actual_Amount - b.Budget_Amount) / b.Budget_Amount) * 100, 2) AS Avg_Variance_Percentage
FROM 
    budgetdata b
JOIN 
    actualdata a 
ON 
    b.Department = a.Department 
    AND b.Year = a.Year
GROUP BY 
    b.Year
ORDER BY 
    b.Year;

