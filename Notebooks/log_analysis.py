# log_analysis.py
"""
Threat-Hunting Demo:
Parses Windows Security events and plots counts per hour.
"""

import pandas as pd
import matplotlib.pyplot as plt
import re
import os

# 1. Load the log file
log_path = os.path.join(os.path.dirname(__file__), '../Data/sample-windows-events.log')
df_records = []

with open(log_path, 'r') as f:
    for line in f:
        # Regex to extract timestamp and EventID
        m = re.match(r'^(?P<timestamp>\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}Z).*EventID=(?P<event_id>\d+)', line)
        if m:
            df_records.append({
                'timestamp': pd.to_datetime(m.group('timestamp')),
                'event_id': int(m.group('event_id'))
            })

df = pd.DataFrame(df_records)
if df.empty:
    raise ValueError("No valid events parsed from the log.")

# 2. Aggregate by hour
df['hour'] = df['timestamp'].dt.floor('H')
hourly_counts = df.groupby('hour').size().rename('count')

# 3. Plot results
plt.figure(figsize=(10, 5))
hourly_counts.plot(kind='bar')
plt.title("Windows Security Event Count by Hour")
plt.xlabel("Hour (UTC)")
plt.ylabel("Number of Events")
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()
