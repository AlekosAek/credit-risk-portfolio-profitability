-- Credit Risk Analysis
-- LendingClub Dataset

-- 1. Default Rate by Loan Grade
SELECT
    grade,
    COUNT(*) AS total_loans,
    SUM(CASE
        WHEN loan_status IN ('Charged Off', 'Default')
        THEN 1 ELSE 0
    END) AS defaults,
    AVG(CASE
        WHEN loan_status IN ('Charged Off', 'Default')
        THEN 1.0 ELSE 0.0
    END) AS default_rate
FROM loans
WHERE loan_status IN ('Fully Paid', 'Charged Off', 'Default')
GROUP BY grade
ORDER BY grade;

-- 2. Default Rate by Year
SELECT
    SUBSTR(issue_d, -4) AS issue_year,
    COUNT(*) AS total_loans,
    AVG(CASE
        WHEN loan_status IN ('Charged Off', 'Default')
        THEN 1.0 ELSE 0.0
    END) AS default_rate
FROM loans
WHERE loan_status IN ('Fully Paid', 'Charged Off', 'Default')
GROUP BY issue_year
ORDER BY issue_year;

-- 3. Default Rate by Loan Term
SELECT
    term,
    COUNT(*) AS total_loans,
    AVG(CASE
        WHEN loan_status IN ('Charged Off', 'Default')
        THEN 1.0 ELSE 0.0
    END) AS default_rate,
    AVG(int_rate) AS avg_interest_rate
FROM loans
WHERE loan_status IN ('Fully Paid', 'Charged Off', 'Default')
GROUP BY term
ORDER BY term;