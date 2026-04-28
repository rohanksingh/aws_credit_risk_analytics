select 
risk_segment,
count(*) as accounts,
round(sum(current_balance), 2) as total_exposure,
round(sum(current_balance * pd_score * 0.85), 2) as total_expected_loss
from (
select 
a.account_id,
a.current_balance,
r.pd_score,
case 
when max(p.days_past_due) >= 90 then 'Default'
when max(p.days_past_due) >=60 then 'High Risk'
when max(p.days_past_due) >= 30 then 'Medium Risk'
when round(cast(a.current_balance as double) / a.credit_limit, 4) >= 0.80 then 'Watchlist'
else 'Low Risk'
end as risk_segment
from accounts a
left join payments p on a.account_id = p.account_id
left join risk_scores r on a.customer_id = r.customer_id
group by 
a.account_id,
a.current_balance,
r.pd_score,
a.credit_limit
) t
group by risk_segment
order by total_expected_loss desc;
