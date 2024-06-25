# MailHog SMTP Server Details
SMTP_SERVER="localhost"
SMTP_PORT="1025"

# Email Sender and Recipient
EMAIL_FROM="sender@example.com"
EMAIL_TO="recipient@example.com"

# Email Content
EMAIL_SUBJECT="Test Email"
EMAIL_BODY="This is a test email sent to MailHog using bash script."

# Construct the email data
{
echo "From: $EMAIL_FROM"
echo "To: $EMAIL_TO"
echo "Subject: $EMAIL_SUBJECT"
echo ""
echo "$EMAIL_BODY"
} > email.txt

# Send the email via curl
curl --url "smtp://$SMTP_SERVER:$SMTP_PORT" \
     --mail-from "$EMAIL_FROM" \
     --mail-rcpt "$EMAIL_TO" \
     --upload-file email.txt

# Cleanup temporary file
rm email.txt
