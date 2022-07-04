#' Annuity of a credit loan
#'
#' @param principal Amount of money originally invested or loaned, on which basis interest and returns are calculated.
#' @param rate Nominal interest rate (in percentages).
#' @param k Number of repayments per year.
#' @param n Total number of repayments/periods.
#'
#' @return The annuity (repayment amount in each period).
#' @export
#'
#' @examples
#' # Loan for 10000 EUR with a total of 12 monthly repayments and 6 % annual interest rate.
#' annuity(10000, 6, 12, 12)
annuity <- function(principal, rate, k, n) {
  r <- (rate/100) / k
  principal * (r * (1 + r)^n) / ((1 + r)^n - 1)
}
