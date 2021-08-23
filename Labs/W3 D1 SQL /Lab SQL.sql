#1.
select amount from bank.loan order by amount asc limit 3;
#2.
select distinct status from bank.loan order by status;
#3.
select loan_id, payments from bank.loan order by payments desc limit 3;
#4.
select account_id, amount from bank.loan order by account_id asc limit 5;
#5.
select account_id, amount from bank.loan where duration = 60 order by amount asc limit 5;
#6.
select distinct k_symbol from bank.`order` order by k_symbol asc;
#7.
select order_id from bank.`order` where account_id = 34;
select distinct account_id from bank.`order` where order_id >= 29540 and order_id <= 29560;
select amount from bank.`order` where account_to = 30067122;
select trans_id, `date`, `type`, amount from bank.trans where account_id = 793 order by date desc limit 10;
select district_id, count(client_id) as no_of_clients 
from bank.client group by district_id having district_id < 10 order by district_id asc;
select type, count(card_id) as number_of_cards from bank.card group by type order by number_of_cards desc;
select account_id, sum(amount) as total_loan from bank.loan 
group by account_id order by total_loan desc limit 10;
select date, count(loan_id) from bank.loan where date < 930907 group by date order by date desc;
#17
select date, duration, count(loan_id) as no_loans from bank.loan 
group by date, duration having date > 971201 and date < 971231 order by date, duration;
#18
select account_id, type, sum(amount) as total_amount from bank.trans 
where account_id = 396 group by type order by type asc;
#19
SELECT account_id,
    IF(`type` = 'PRIJEM',
        'INCOMING',
        'OUTGOING') AS transaction_type,
    ROUND(SUM(amount)) AS total_amount
FROM bank.trans WHERE account_id = 396 GROUP BY type ORDER BY type ASC;
#20
select account_id, floor(sum(if(type = "PRIJEM",amount,0))) as "INCOMING", 
floor(sum(if(type = "VYDAJ",amount,0))) as "OUTGOING",
floor(sum(if(type = "PRIJEM",amount,0))) - floor(sum(if(type = "VYDAJ",amount,0))) as "DIFFERENCE" 
from bank.trans where account_id = 396 GROUP BY account_id;
#21


select customer_id, first_name from  rental, customer where rental.customer_id=customer.customer_id;
select *,amount - payments as balance from bank.loan;
select loan_id, account_id, duration, status, (amount - payments)/1000 as "Balance in thousands" from bank.loan;
select duration%2 from bank.loan;
select * from bank.loan where amount >100000 and amount <200000;
select distinct A2, A4 from bank.district where A2 in ("Benesov","Beroun") or A4 < 75000;
select * from bank.loan
where status not in ("B", "b") and amount <> 100000;
#df[(!df["status"].isin(["B", "b"])) & (df["amount"]!=100000]
select * from bank.account
where district_id in (1,2,3,4,5);
select avg(amount) as Average, status from bank.loan
group by status
order by Average asc;
select distinct A2 from bank.district
where A2 in ("Benesov", "Beroun") or A4 < 75000
order by A2
limit 10;
select *, length(k_symbol) as "symbol_length" from bank.order;
select substring("Hello world", 7,3);
select max(15);
select * from bank.district
where A3 like "north%";
select * from bank.district where A2 regexp "^B";
select * from bank.district where A2 regexp "ov$";
select client_id from bank.client where district_id = 1 limit 5;
select max(client_id) from bank.client where district_id = 72 limit 5;