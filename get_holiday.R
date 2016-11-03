rm(list = ls());gc()
require(RCurl)
is.holiday = function(x) {
  # x is a string, e.g. x = "20130101"
  url.x = paste("http://www.easybots.cn/api/holiday.php?d=", x, sep = "")
  temp = gsub("\"", "", getURL(url.x))
  sig = substr(temp, 11, 11)
  if(sig == "0") return("工作日")
  if(sig == "1") return("周末")
  if(sig == "2") return("小长假")
}

start = as.Date("2016-02-01")
end = as.Date("2016-02-29")
except = c("工作日")
result = c()
for (date in start:end) {
  tempDate = as.Date(date, origin = "1970-01-01")
  result = append(result, sum(is.holiday(tempDate) %in% except))
  cat("日期是:",is.holiday(tempDate),"\n")
}
cat("工作日总计:",sum(result),"\n")



