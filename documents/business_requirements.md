# Business Requirements

## Functional Requirements

1. Ingest credit card portfolio data including:
   - Customer information
   - Account balances
   - Payment history
   - Risk scores

2. Calculate key risk metrics:
   - Utilization Ratio
   - Days Past Due (DPD)
   - Probability of Default (PD)

3. Classify accounts into risk segments:
   - Default
   - High Risk
   - Medium Risk
   - Watchlist
   - Low Risk

4. Compute Expected Loss using:
   Expected Loss = PD × EAD × LGD

5. Aggregate portfolio metrics:
   - Total exposure by segment
   - Total expected loss by segment
   - Number of accounts per segment

6. Build a dashboard for executive reporting

---

## Non-Functional Requirements

- Scalable cloud-based solution
- Secure access via IAM roles
- Serverless querying using Athena
- Near real-time analysis capability