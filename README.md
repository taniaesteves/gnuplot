# Gnuplot scrips


## DIO (Extended) plots

### Usage
```
bash gen_dio_micro_plots.sh <plot> [open]
```

#### Plots:
- `rw` (Comparison with related work experiments)
- `bs_sysdig` (Sysdig batch size experiments)
- `bs_dio` (DIO batch size experiments)
- `rb` (DIO ring buffer size experiments)
- `filters` (DIO filters experiments)
- `rt` (DIO rate limiting experiments)
- `times` (Inline vs offline experiments)
- `use_cases` (Use cases experiments)
- `all` (Generates all the above plots)

---

## CRIBA plots

### Usage
```
bash gen_criba_plots.sh <plot> [open]
```

#### Plots:
- `dd` (dataset distribution plot)
- `de` (dataset extensions plot)
- `all` (Generates all the above plots)

---

## F-Functions plots

### Usage
```
bash gen_ffunctions_plots.sh <plot> [open]
```

#### Plots:
- `latencies` (latencies plot)
- `all` (Generates all the above plots)

---