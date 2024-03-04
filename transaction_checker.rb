require 'dry/monads'

class TransactionChecker
  include Dry::Monads[:result]

  # Dummy database for demonstration purposes
  # In a real application, this would interface with an actual database
  $transactions = []
  $users_with_chargebacks = [97051] # Assuming user_id 97051 had a chargeback

  def initialize(transaction)
    @transaction = transaction
  end

  def call
    Success(@transaction)
      .bind(method(:check_many_transactions_in_a_row))
      .bind(method(:check_amount_above_time_threshold))
      .bind(method(:check_user_had_chargeback))
      .value_or(false) # Returns false if any step fails
  end

  private

  def check_many_transactions_in_a_row(transaction)
    # Logic here using @transaction
    if recent_transactions_count(transaction[:user_id], transaction[:device_id]) > 5
      Failure(:many_transactions)
    else
      Success(transaction)
    end
  end

  def check_amount_above_time_threshold(transaction)
    threshold_amount = 500
    threshold_hour = 20 # 8 PM
    transaction_time = Time.parse(transaction[:transaction_date]).hour

    if transaction[:transaction_amount] > threshold_amount && transaction_time >= threshold_hour
      Failure(:amount_above_threshold)
    else
      Success(transaction)
    end
  end

  def check_user_had_chargeback(transaction)
    # Logic here using @transaction
    if user_had_chargeback_before?(transaction[:user_id])
      Failure(:user_had_chargeback)
    else
      Success(transaction)
    end
  end

  def user_had_chargeback_before?(user_id)
    $users_with_chargebacks.include?(user_id)
  end

  def recent_transactions_count(user_id, device_id)
    $transactions.count { |t| t[:device_id] == device_id && t[:user_id] == user_id  }
  end
end
