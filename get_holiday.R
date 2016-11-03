rm(list = ls());gc()
GetDateDiff = function(startDate, endDate) {
<<<<<<< HEAD
  # Compute the date difference of the date
  # 
  # Args:
  #   startDate: A string, e.g. date = "2016-01-01" / "2016/01/01"
  #   endDate: A string, e.g. date = "2016-01-01" / "2016/01/01"
  # 
  # Returns:
  #   the date fifference
=======
>>>>>>> 7e09c5176e20978cb3a4f9993089a755a82c8ae5
  suppressMessages(require(RCurl))
  is.holiday = function(date) {
    # Judge a date if "工作日"
    # 
    # Args:
<<<<<<< HEAD
    #   date: A string, e.g. date = "2016-01-01" / "2016/01/01"
=======
    #   date: A string, e.g. date = "20160101" / "2016-01-01" / "2016/01/01"
>>>>>>> 7e09c5176e20978cb3a4f9993089a755a82c8ae5
    # 
    # Returns:
    #   The result of the date given is "工作日", "周末", "小长假"
    
    url = paste("http://www.easybots.cn/api/holiday.php?d=", date, sep = "")
    temp = gsub("\"", "", getURL(url))
    sig = substr(temp, 11, 11)
    if(sig == "0") return("工作日")
    if(sig == "1") return("周末")
    if(sig == "2") return("小长假")
  }
  start = as.Date(startDate)
  end = as.Date(endDate)
  except = c("工作日")
  result = c()
  for (elem in start:end) {
    tempDate = as.Date(elem, origin = "1970-01-01")
    result = append(result, sum(is.holiday(tempDate) %in% except))
  }
  # cat("工作日总计:",sum(result),"\n")
  return(sum(result))
}




