double StartB;
double EndB;
int Trades;
int WonT;
int LostT;
double Turnover;
double Income;
double Profit;
double Percent;

//profit method
double profitMethod({double startBal, double endBal}) {
  Profit = (startBal - endBal);
  return Profit;
}

// percent method
double percentMethod({double profit, double startBalance}) {
  Percent = (profit / startBalance) * 100;
  return Percent;
}
