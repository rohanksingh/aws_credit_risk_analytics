flowchart TD
    A[Power BI Desktop] --> B[ODBC Driver]
    B --> C[Amazon Athena]
    C --> D[AWS Glue Data Catalog]
    D --> E[Amazon S3 Data Lake]
    C --> F[S3 Athena Query Results]
    A --> G[Credit Risk Dashboard]

    G --> H[Total Exposure KPI]
    G --> I[Total Expected Loss KPI]
    G --> J[Expected Loss by Segment]
    G --> K[Risk Segment Summary Table]