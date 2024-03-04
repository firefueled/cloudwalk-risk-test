# Answers for section 3.1

## Explain the money flow and the information flow in the acquirer market and the role of the main players.

The flow of data in a translation differs country-by-country, but in Brazil for example, it has 6 steps:
STEP 1
First, an acquirer receives the payment request from the merchant.

STEP 2
The acquirer sends the payment request to the card brand, who will in turn forward it to the issuing bank for approval.

STEP 3
The issuing bank makes a risk analysis, checks if the customer has enough funds to pay for the transaction and if there are any temporary holds that will be released any time soon.

STEP 4
If everything is OK on the issuing bank's side, it sends an approval code back through the payment chain.

STEP 5
If the transaction is approved, the money will be deposited into the merchant's account.

STEP 6
If the customer needs to dispute a charge or report a fraud, it is the issuer who decides whether to proceed with a refund or not.

The card holder is the customer of the operation and is trying to purchase something using their card and the funds available to them.
The merchant provides good and services to the card holder and charges them for an amount. Later receiving the funds transferred from the card holder's account.
The issuer issues cards to card holders and maintains their funds.
The acquirer is the company responsible for mediating all transactions between parties and provides the technology infrastructure for the operations to happen.

## Explain the difference between acquirer, sub-acquirer and payment gateway and how the flow explained in question 1 changes for these players.

A sub-acquirer operates under a similar framework but does not have a direct relationship with card networks. Instead, it partners with an acquirer to process transactions. It  would take on the role of the acquirer in the previous scenario, substituting it in providing the merchants with payment services.

The payment gateway is the technology stack that allows valid and secure transfer of transaction data between the parties.

## Explain what chargebacks are, how they differ from cancellations and what is their connection with fraud in the acquiring world.

Chargebacks in the acquiring market are a mechanism for reversing a credit card transaction, initiated by the cardholder through their bank. Unlike cancellations, which are more informal process where refunds are processed directly by the merchant before transaction finalization.

Chargebacks are linked to fraud via the multiple means of abusing the feature, such as: transactions using a stolen card, charge dispute without valid reasons, and purchases are made with the sole intention of disputing the charge.

# Answers for section 3.2

## Analyze the data provided and present your conclusions (consider that all transactions are made using a mobile device).

- High Transaction Amounts
    - Transaction IDs 21320401, 21320423. These transactions have amounts (2556.13, 2022.55), which are significantly higher than the average transaction amount (767.81) in the dataset.

- Frequent Chargebacks
    - User IDs 11750 and 91637: These users have a large amount of chargebacks.

- Missing Device IDs
    - Transaction ID 21321082. This transaction is highlighted due to its significant amount (4078.80) coupled with the absence of a device ID, suggesting a potential fraud risk.

- Repeated Card Numbers with Different User IDs
    - Card Number: 4960451160
    - Associated User IDs: 34289, 75487, 91637, 38392
    - The repetition of this card number across different user accounts suggests the card may have been compromised, indicating a strong fraud signal.

- Transactions at Unusual Times
    - Transaction ID: 21322428. This transaction stands out due to its high value (3904.44) and timing (2019-11-22, 01:00 AM, occurring within the hours deemed unusual (0-5 AM), which may indicate fraudulent activity.

## In addition to the spreadsheet data, what other data would you look at to try to find patterns of possible frauds?

Here are some behavior patterns I would look for in such dataset to identify fraudulent actions:
- High Transaction Amounts: Transactions with significantly higher amounts than the average could be indicative of fraud, especially if they are outliers compared to the user's typical transaction history.
- Frequent Chargebacks: Transactions marked with a chargeback could indicate disputed transactions. A high frequency of chargebacks associated with a specific user, merchant, or device might suggest fraudulent activity.
- Missing Device IDs: Transactions without a `device_id` could be considered suspicious, especially if the transaction amount is high.
- Repeated Card Numbers with Different User IDs: If the same card_number is associated with multiple user_id values, this could be a sign of unauthorized use of the card.
- Short Time Interval between Transactions: Rapid succession of transactions, especially on the same card or device, could indicate automated fraudulent activities. It's worth analyzing the time intervals between transactions for any patterns of rapid, repeated use.
- Transactions at Unusual Times: Transactions occurring at odd hours, especially if they are outliers within a user's typical transaction pattern, could indicate fraud.

# Answers for section 3.3

A number of work-arounds are being made in the code to avoid having to create a fully working system.
The code shows a general idea for the architecture and general behaviour of such solution.

To execute the app, run
```
bundle exec ruby app.rb
```

To send a request, run
```
. call_endpoint.sh
```

Update `payload.json` to change the payload sent by the command.