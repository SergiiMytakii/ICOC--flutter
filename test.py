import pandas as pd



def show_usage_table():
  
    # Fetch usage data
    usage_data = [
        {'Date': '2024-02-14', 'Month': '2024-02', 'Tokens': 49595},
        {'Date': '2024-03-09', 'Month': '2024-03', 'Tokens': 7643},
        {'Date': '2024-03-07', 'Month': '2024-03', 'Tokens': 234}]

    if usage_data:
        rows = []

        # Initialize variables for current month
        current_month = None
        current_month_total = 0

        # Construct DataFrame rows
        for item in usage_data:
            print(item)
            if item['Month'] != current_month:
                # Add total for previous month
                if current_month:
                    rows.insert(0, {"Date": f"Total for{current_month}", "Tokens": current_month_total})

                # Update variables for new month
                current_month = item['Month']
                current_month_total = 0

            # Add daily usage to rows
            rows.append({"Date": item['Date'], "Tokens": item['Tokens']})

            # Update monthly total
            current_month_total += item['Tokens']
        if current_month:
            rows.append(0, {"Date": f"Total for {current_month}", "Tokens": current_month_total})

        # Add total for last month

    for row in rows:
        print(row)
      
show_usage_table()