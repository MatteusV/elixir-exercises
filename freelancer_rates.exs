# A taxa diária é 8 vezes a taxa horária.
# Um mês tem 22 dias faturáveis.
# Os descontos são modelados como números fracionários que representam uma porcentagem, por exemplo 25.0(25%).

defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    (hourly_rate * 8) * 1.0
  end

  def apply_discount(before_discount, discount) do
    if(discount === 0.0) do
      before_discount
    end
    before_discount - (before_discount * discount / 100)
  end

  def monthly_rate(hourly_rate, discount) do
    daily_rate = FreelancerRates.daily_rate(hourly_rate)
    mouth_rate = daily_rate * 22

    resultInFloat = apply_discount(mouth_rate, discount)

    result = trunc(:math.ceil(resultInFloat))
    result
  end

  def days_in_budget(budget, hourly_rate, discount) do
    budget_with_discount = apply_discount(budget, discount)
    hourly_total = budget_with_discount / hourly_rate
    days_work = Float.floor(hourly_total * 10) / 80

    days_work
  end
end

IO.inspect(FreelancerRates.days_in_budget(20000, 80, 11.0))
