<!-- Day 18: Ranking Window Functions

Ranking Functions

Ranking functions assign positions to rows based on a sorting rule.

ROW_NUMBER()

- Unique number for every row.
- Does not consider ties.

RANK()

- Equal values receive the same rank.
- Skips the next rank after a tie.

DENSE_RANK()

- Equal values receive the same rank.
- Does not skip ranks.

NTILE(n)

Divides rows into `n` equal groups.

PERCENT_RANK()

Returns the relative rank between 0 and 1.

CUME_DIST()

Returns the cumulative distribution.

Syntax

ROW_NUMBER() OVER(
    PARTITION BY customer_id
    ORDER BY amount DESC
)

Difference

 Function  Duplicate Values  Skips Rank 
ROW_NUMBER       No           No 
RANK             Yes          Yes 
DENSE_RANK       Yes          No 

Common Uses

- Latest record per customer
- Top N records
- Duplicate removal
- Ranking reports
- Percentile analysis

Key Takeaways

- `ROW_NUMBER()` is ideal when only one row should be selected.
- `RANK()` preserves ties but leaves gaps.
- `DENSE_RANK()` preserves ties without gaps.
- Always think carefully about whether ties should share the same position. -->