read -sp "Enter password: " PASSWORD
echo
label-studio start --username admin@example.com --password "$PASSWORD"
