use sales;

show tables;

select * from date;
select * from transactions;

-- total sales by years
select d.year, sum(sales_amount) as total_sales from transactions as t
inner join date as d
on t.order_date = d.date
group by d.year;

#removing \r from powerbi using py script

select * from date
where date_yy_mmm like "%\r";
set sql_safe_updates = 0;

update date
set date_yy_mmm =  replace(date_yy_mmm,"\r", "");
-- where date_yy_mmm like "%\r";

alter table transactions
add column loss_margin double;


SET SQL_SAFE_UPDATES = 0;

update transactions t
set loss_margin = if(profit_margin < 0, abs(profit_margin), 0);

update transactions t
set profit_margin = if(profit_margin > 0, profit_margin, 0);


select * from transactions as t
inner join date as d
on t.order_date = d.date;

DESCRIBE `products`;