class AppUrl{
  static var baseUrl="http://203.130.0.249";
  static var loginEndPoint="$baseUrl/ERP/ERP.MobileServices?ActionID=Login";
  static var logoutEndPoint="$baseUrl/ERP/ERP.MobileServices?ActionID=MobileLogout";
  static var callsInfoEndPoint="$baseUrl/ERP/ERP.MobileServices?ActionID=CallsInfo";
  static var callsDetailsEndPoint="$baseUrl/ERP/ERP.MobileServices?ActionID=CallsInfo";
  static var WTGraphEndPoint="$baseUrl/ERP/ERP.MobileServices?ActionID=WeeklyTotal";
  static var WAGraphEndPoint="$baseUrl/ERP/ERP.MobileServices?ActionID=WeeklyAnswer";
  static var WMGraphEndPoint="$baseUrl/ERP/ERP.MobileServices?ActionID=WeeklyMissed";
  static var WSGraphEndPoint="$baseUrl/ERP/ERP.MobileServices?ActionID=WeeklySLA";
  static var MSummaryEndPoint="$baseUrl/ERP/ERP.MobileServices?ActionID=MonthlyDataSummary";
  static var MWGraphEndPoint="$baseUrl/ERP/ERP.MobileServices?ActionID=MonthlywiseAnswerCalls";
}