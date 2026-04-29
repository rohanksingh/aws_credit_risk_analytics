#### AWS Interaction Flow
```<> Mermaid

flowchart LR
    A[Credit Card CSV Files] --> B[Amazon S3 Raw Folder]
    B --> C[AWS Glue Crawler]
    C --> D[AWS Glue Data Catalog]
    D --> E[Amazon Athena]
    E --> F[SQL Portfolio Analysis]
    F --> G[Risk Segmentation Logic]
    G --> H[Expected Loss Calculation]
    H --> I[Risk Segment Mart Table]
    I --> J[Power BI Dashboard]

    B --> K[S3 Athena Results Folder]
    E --> K
```
