#' Number of repayments before existing loan balance falls below a certain amount
#'
#' @param principal Amount of money originally invested or loaned, on which basis interest and returns are calculated.
#' @param rate Nominal interest rate (in percentages).
#' @param k Number of repayments per year.
#' @param n Total number of repayments/periods.
#' @param threshold Goal remaining loan amount.
#'
#'
#' @return Number of repayments before existing loan balance falls below a certain amount
#' @export
#'
#' @references
#' Toman, Aleš (2016)
#' \emph{Rešene naloge iz finančne matematike 1, Finančni instrumenti.}
#' Ljubljana: DMFA založništvo.
#' @examples
#' balance_below_threshold(10000, 6, 12, 36, 5000)
balance_below_threshold <- function(principal, rate, k, n, threshold) {
  r <- (rate / 100) / k
  log((1 - threshold / principal) * (1 + r)^n + threshold / principal, base = 1 + r)
}
