-- Exploratory Data Analysis 
Select *
From Layoffs_Staging2;

Select Max(Total_laid_off), Max(percentage_laid_off)
From Layoffs_Staging2;

Select *
From Layoffs_Staging2
where percentage_laid_off = 1
order by total_laid_off DESC;

Select *
From Layoffs_Staging2
where percentage_laid_off = 1
order by funds_raised_millions DESC;

Select company, sum(total_laid_off)
From Layoffs_Staging2
Group by company
order by 2 desc;

Select min(`date`), max(`date`)
From Layoffs_Staging2;

Select industry, sum(total_laid_off)
From Layoffs_Staging2
Group by industry
order by 2 desc;

Select country, sum(total_laid_off)
From Layoffs_Staging2
Group by country 
order by 2 desc;

Select `date`, sum(total_laid_off)
From Layoffs_Staging2
Group by `date`
order by 2 desc;

Select year(`date`), sum(total_laid_off)
From Layoffs_Staging2
Group by year(`date`)
order by 2 desc;

Select Stage, sum(total_laid_off)
From Layoffs_Staging2
Group by Stage
order by 2 desc;

Select Stage, sum(percentage_laid_off)
From Layoffs_Staging2
Group by Stage
order by 2 desc;

Select company, sum(percentage_laid_off)
From Layoffs_Staging2
Group by company
order by 2 desc;

# Progress of layoffs 
Select substring(`date`,6,2)as `month`, sum(total_laid_off)
From Layoffs_Staging2
group by substring(`date`,6,2);

Select substring(`date`,1,7)as `Month`, sum(total_laid_off)
From Layoffs_Staging2
where substring(`date`,1,7) is not null
group by `Month`
order by 1 ASC;

With Rolling_Total As 
(
Select substring(`date`,1,7)as `Month`, sum(total_laid_off) as total_off 
From Layoffs_Staging2
where substring(`date`,1,7) is not null
group by `Month`
order by 1 ASC
)
Select `Month`, total_off,
Sum(total_off) over (order by `Month`) as rolling_total 
From Rolling_Total;

Select company, year(`date`), sum(total_laid_off)
From Layoffs_Staging2
Group by company, year(`date`)
order by company asc;


Select company, year(`date`), sum(total_laid_off)
From Layoffs_Staging2
Group by company, year(`date`)
order by 3 desc;

With company_year (company, year, total_laid_off) as 
(Select company, year(`date`), sum(total_laid_off)
From Layoffs_Staging2
Group by company, year(`date`)
)
Select*
From company_year;

With company_year (company, year, total_laid_off) as 
(Select company, year(`date`), sum(total_laid_off)
From Layoffs_Staging2
Group by company, year(`date`)
)
Select*,
 dense_rank() over (partition by year order by total_laid_off desc)as ranking 
From company_year
Where year is not null
order by Ranking asc;

With company_year (company, year, total_laid_off) as 
(Select company, year(`date`), sum(total_laid_off)
From Layoffs_Staging2
Group by company, year(`date`)
), Company_year_Rank As 
(Select*,
 dense_rank() over (partition by year order by total_laid_off desc)as ranking 
From company_year
Where year is not null)
Select*
from Company_year_Rank
;


With company_year (company, year, total_laid_off) as 
(Select company, year(`date`), sum(total_laid_off)
From Layoffs_Staging2
Group by company, year(`date`)
), Company_year_Rank As 
(Select*,
 dense_rank() over (partition by year order by total_laid_off desc)as ranking 
From company_year
Where year is not null)
Select*
from Company_year_Rank
where ranking <=5
;