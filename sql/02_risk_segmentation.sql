select 
account_id,
customer_id,
utilization_ratio,
max_dpd,
pd_score,
case 
when max_dpd >= 90 then 'Default'
when max_dpd >= 60 then 'High Risk'
when max_dpd >= 30 then 'Medium Risk'
when utilization_ratio >= 0.80 then 'Watchlist'
else 'Low Risk'
end as risk_segment
from (
select 
a.account_id,
a.customer_id,
round(cast(a.current_balance as double) / a.credit_limit, 4) as utilization_ratio,
max(p.days_past_due) as max_dpd,
r.pd_score
from accounts a 
left join payments p on a.account_id = p.account_id
left join risk_scores r on a.customer_id= r.customer_id
group by 
a.account_id,
a.customer_id,
a.credit_limit,
a.current_balance,
r.pd_score
) t;