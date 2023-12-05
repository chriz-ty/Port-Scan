if [ -z "$1" ]; then
    echo "Usage: $0 <hostname>"
    exit 1
fi

hostname=$1
ports="80 443 8080"

echo "Scanning ports for $hostname"

for port in $ports; do
    nc -zvw 1 $hostname $port 2>&1 | grep succeeded
    if [ $? -eq 0 ]; then
        echo "Port $port is open"
    else
        echo "Port $port is closed"
    fi
done
