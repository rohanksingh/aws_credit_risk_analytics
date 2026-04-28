select 
account_id,
customer_id,
current_balance as EAD,
pd_score as PD,
0.85 as LGD,
round(current_balance * pd_score * 0.85, 2) as expected_loss,
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
a.current_balance,
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