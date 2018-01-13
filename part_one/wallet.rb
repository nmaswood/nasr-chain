require 'set'
require_relative 'exceptions'
require 'colorize'
require 'digest'

module Action
  GIVE = 1
  TAKE = 2
end

class Transaction
  def initialize(type, from, to, amount)
    @type = type
    @from = from
    @to = to
    @amount = amount
  end

  def valid?(wallet)
    from_wallet = wallet[@from]
    to_wallet = wallet[@to]
    case @type
    when Action::GIVE
      from_wallet >= @amount
    when Action::TAKE
      to_wallet >= @amount
    end
  end
end

class User
  @@sha = Digest::SHA256.new
  def initialize(users, name, password)
    raise UserError if users.include(name)
    @name = user
    @password = @@sha.digest(password)
    @balance = 100
  end
end

class Wallet
  def random_value

  end

  def initialize
    @wallets = {}
  end

  def add_user(user)
    @wallets[user.name] = user
  end

  def execute(transaction)
    wallets_clone = @wallets.clone
    raise UserError unless transaction.valid?(@wallets)
    case @transaction.type
    when Action::GIVE
      wallet_clone[transaction.from] -= transaction.amount
      wallet_clone[transaction.to] += transaction.amount
    when Action::TAKE
      wallet_clone[transaction.from] += transaction.amount
      wallet_clone[transaction.to] -= transaction.amount
    end
    wallet_clone
  end
end
