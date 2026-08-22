#!/usr/bin/env ruby

class Prime
  def self.nth(n) # rubocop:disable Naming/MethodParameterName
    raise ArgumentError if n.zero?

    upper_bound = if n <= 5
                    11
                  else
                    n * Math.log(n * Math.log(n))
                  end

    is_prime = Array.new(upper_bound + 1, true)
    is_prime[0] = is_prime[1] = false

    count = 0
    prime = 2

    while count < n
      if is_prime[prime]
        count += 1
        return prime if count == n

        (prime * prime).step(upper_bound, prime) do |i|
          is_prime[i] = false
        end
      end
      prime += 1
    end
    prime
  end
end