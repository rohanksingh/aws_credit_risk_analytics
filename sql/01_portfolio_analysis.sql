select a.account_id,
	a.customer_id,
	a.credit_limit,
	a.current_balance,
	round(
		cast(a.current_balance as double) / a.credit_limit,
		4
	) as utilization_ratio,
	max(p.days_past_due) as max_dpd,
	r.bureau_score,
	r.pd_score
from accounts a
	left join payments p on a.account_id = p.account_id
	left join risk_scores r on a.customer_id = r.customer_id
group by a.account_id,
	a.customer_id,
	a.credit_limit,
	a.current_balance,
	r.bureau_score,
	r.pd_score;