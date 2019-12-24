# Shows the amount of requests that happen during the specified unit of time
Select Year(`Hearing Date`) as Year, count(*) as `Requests per Year`
From `All Requests`
GROUP BY Year(`Hearing Date`)
ORDER BY YEAR(`Hearing Date`);

Select `Fiscal Year`, count(*) as `Requests per Fiscal Year`
From `All Requests`
GROUP BY `Fiscal Year`
ORDER BY `Fiscal Year`;

SELECT MONTHNAME(`Hearing Date`) as `Month`, count(*) as `Requests per Month`
From `All Requests`
GROUP BY MONTHNAME(`Hearing Date`)
ORDER BY MONTH(`Hearing Date`);

SELECT WEEKOFYEAR(`Hearing Date`) as `Week`, count(*) as `Requests per Week`
From `All Requests`
GROUP BY WEEKOFYEAR(`Hearing Date`)
ORDER BY WEEKOFYEAR(`Hearing Date`);

SELECT DAYNAME(`Hearing Date`) as `Weekday`, count(*) as `Requests per Weekday`
From `All Requests`
GROUP BY DAYNAME(`Hearing Date`)
ORDER BY WEEKDAY(`Hearing Date`);