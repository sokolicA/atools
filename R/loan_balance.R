#' Outstanding principal balance
#'
#' @param principal Amount of money originally invested or loaned, on which basis interest and returns are calculated.
#' @param rate Nominal interest rate (in percentages).
#' @param j Number of repayments already made.
#' @param k Number of repayments per year.
#' @param n Total number of repayments/periods.
#'
#'
#' @return The outstanding principal balance of a loan (existing loan).
#' @export
#'
#' @references
#' Toman, Aleš (2016)
#' \emph{Rešene naloge iz finančne matematike 1, Finančni instrumenti.}
#' Ljubljana: DMFA založništvo.
#' @examples
#' loan_balance(10000, 6, 6, 12, 12)
loan_balance <- function(principal, rate, j, k, n) {
  r <- (rate / 100) / k
  principal * ((1 + r)^n - (1 + r)^j) / ((1 + r)^n - 1)
}
