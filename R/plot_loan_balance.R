#' Plot outstanding principal balance over time
#'
#' @param principal Amount of money originally invested or loaned, on which basis interest and returns are calculated.
#' @param rate Nominal interest rate (in percentages).
#' @param k Number of repayments per year.
#' @param n Total number of repayments/periods.
#'
#'
#' @return The outstanding principal balance of a loan (existing loan).
#' @export
#'
#'
#' @references
#' Toman, Aleš (2016)
#' \emph{Rešene naloge iz finančne matematike 1, Finančni instrumenti.}
#' Ljubljana: DMFA založništvo.
#' @examples
#' loan_balance(10000, 6, 6, 12, 12)
plot_loan_balance <- function(principal, rate, k, n) {
  r <- (rate / 100) / k
  data_plot <- data.frame(
    time = 0:n,
    loan_balance = loan_balance(principal, rate, 0:n, k, n)
  )

  data_plot %>%
    ggplot2::ggplot(ggplot2::aes(x = time)) +
    ggplot2::geom_step(ggplot2::aes(y = loan_balance), color = "coral3") +
    ggplot2::labs(
      x = "Time",
      y = "Remaining loan amount"
    ) +
    ggplot2::theme_minimal() +
    ggplot2::theme(panel.border = ggplot2::element_rect(fill = NA))
}
