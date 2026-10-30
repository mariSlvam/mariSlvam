import shutil

print("===== FILESYSTEM CHECK =====")

# Filesystem paths
paths = ["/"]

for path in paths:

    total, used, free = shutil.disk_usage(path)

    total_gb = round(total / (1024 ** 3), 2)
    used_gb = round(used / (1024 ** 3), 2)
    free_gb = round(free / (1024 ** 3), 2)

    free_percent = round((free / total) * 100, 2)

    print("\nFilesystem:", path)
    print("Total Space:", total_gb, "GB")
    print("Used Space:", used_gb, "GB")
    print("Free Space:", free_gb, "GB")
    print("Free Percentage:", free_percent, "%")

    if free_percent < 20:
        print("Status: WARNING - Low Disk Space")
    else:
        print("Status: HEALTHY")
