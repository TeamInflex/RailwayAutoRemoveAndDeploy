#!/bin/bash

RAILWAY_EMAIL="<YOUR_RAILWAY_EMAIL>"
CONFIRMATION_LINK_EXPIRY="300"  # Time to wait for the confirmation link to be valid (in seconds)
CYCLES=50

send_confirmation_email() {
  # Placeholder for sending confirmation email
  echo "Sending confirmation email to $RAILWAY_EMAIL..."
  # Replace the following line with your actual command to send an email with a confirmation link
  # Example: echo "Click the following link to confirm: https://example.com/confirm/$CONFIRMATION_CODE" | mail -s "Confirmation Email" "$RAILWAY_EMAIL"
}

confirm_email() {
  read -p "Paste the confirmation link received in your email: " confirmation_link
  # Placeholder for checking the confirmation link
  # Replace the following line with your actual logic to check the confirmation link validity
  # Example: [ "$confirmation_link" == "https://example.com/confirm/$CONFIRMATION_CODE" ]
}

main() {
  echo "Starting automated process..."

  # Send confirmation email
  send_confirmation_email

  # Wait for user confirmation within the specified time
  echo "Please check your email and paste the confirmation link within $CONFIRMATION_LINK_EXPIRY seconds."
  confirm_email

  # If confirmation is successful, proceed with deployment and removal for 50 cycles
  if [ $? -eq 0 ]; then
    for ((i=1; i<=$CYCLES; i++)); do
      echo "Starting cycle $i..."

      # Execute Python script for deployment and removal
      python3 auto_deploy_remove.py

      # Wait for 6 hours before the next cycle
      sleep 21600
    done
  else
    echo "Confirmation failed. Exiting."
  fi
}

main
