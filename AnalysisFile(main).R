library(TTR)
library(forecast)
library(prophet)
library(ggplot2)
library(dplyr)

## 제1집하장
# 데이터 정제 및 변환
data01 <- data[-1,]
col01 <- data01[,2] 
timeCol <- data01[,1] # 인덱스로 만들기
# timeCol <- as.POSIXct(timeCol, format = "%Y-%m-%d")
# drop01 <- data.frame(timeCol,col01)
col01 <- as.numeric(col01)
drop01 <- ts(col01,frequency=1440,start=2020) # 적절한 시계열 형태로 만들기(x 범례 값)
# 마지막 3년 측정

# ARIMA 시행
auto.arima(drop01)

# ARIMA 그래프 그리기
sampleForecast01 <- arima(drop01, order=c(0,0,1))
arima_predict01 <- forecast(sampleForecast01,h=3) # 3년 예측
samplePlot01 <- forecast(arima(drop01, order=c(0,0,1)), h=3)
autoplot(samplePlot01, include = 30) # 그래프 그리기

# EDA
psample01 <- data[,c('V1','V2')]
psample01 <- psample[-1,]
names(psample01)[1]<-"ds"
names(psample01)[2]<-"y"
as.Date(psample01$ds)
ds2 <- strptime(psample01$ds,"%Y-%m-%d")
plot(ds2,psample01$y)
# loess(psample01$y~ds2,span=0.5) #loess:local regression


# Prophet 적용
dataProphet01 <- prophet(psample01,yearly.seasonality = TRUE,
                       weekly.seasonality = TRUE, daily.seasonality = TRUE,
                       seasonality.mode = 'multiplicative')
fut01 <- make_future_dataframe(dataProphet01, periods = 1095)
tail(fut01)
forecast01 <- predict(dataProphet01, fut01) # 3년 예측측
forecast3year01 <- tail(forecast01[c('ds', 'yhat', 'yhat_lower', 'yhat_upper')])
plot(dataProphet01, forecast01) # 그래프 그리기
forecastLinePlot01 <- prophet_plot_components(dataProphet01, forecast01)
forecastLinePlot01

dyplot.prophet(dataProphet01, forecast01) # 동적 Prophet 그래프

# 단순지수평활법
# sesSample01<-ses(psample01, h = 10) # 10년 예측
# sesSample01

## 제2집하장
# 데이터 정제 및 변환
drop02 <- data[-1,]
col02 <- data01[,3]
col02 <- as.numeric(col02)
drop02 <- ts(col02,frequency=1440,start=2020)

# ARIMA 시행
auto.arima(drop02)

# ARIMA 그래프 그리기
sampleForecast02 <- arima(drop02D, order=c(5,1,2))
arimaPredict02 <- forecast(sampleForecast02,h=3) # 3년 예측
samplePlot02 <- forecast(arima(drop02D, order=c(5,1,2)), h=3)
autoplot(samplePlot02, include = 30) # 그래프 그리기

# EDA
psample02 <- data[,c('V1','V3')]
psample02 <- psample02[-1,]
names(psample02)[1]<-"ds"
names(psample02)[2]<-"y"
as.Date(psample02$ds)
ds22 <- strptime(psample02$ds,"%Y-%m-%d")
plot(ds22,psample02$y)
# loess(psample01$y~ds2,span=0.5) #loess:local regression


# Prophet 적용
dataProphet02 <- prophet(psample02,yearly.seasonality = TRUE,
                         weekly.seasonality = TRUE, daily.seasonality = TRUE,
                         seasonality.mode = 'multiplicative')
fut02 <- make_future_dataframe(dataProphet02, periods = 1095)
tail(fut02)
forecast02 <- predict(dataProphet02, fut02)
forecast3year02 <- tail(forecast02[c('ds', 'yhat', 'yhat_lower', 'yhat_upper')])
plot(dataProphet02, forecast02) # 그래프 그리기
forecastLinePlot02 <- prophet_plot_components(dataProphet02, forecast02)
forecastLinePlot02

dyplot.prophet(dataProphet02, forecast02) # 동적 Prophet 그래프

## 제3집하장
# 데이터 정제 및 변환
drop03 <- data[-1,]
col03 <- data01[,4]
col03 <- as.numeric(col03)
drop03 <- ts(col03,frequency=1440,start=2020)

# ARIMA 시행
auto.arima(drop03)

# ARIMA 그래프 그리기
sampleForecast03 <- arima(drop03, order=c(3,0,0))
arimaPredict03 <- forecast(sampleForecast03,h=3) # 10년 예측
samplePlot03 <- forecast(arima(drop03, order=c(3,0,0)), h=3)
autoplot(samplePlot03, include = 30) # 그래프 그리기

# EDA
psample03 <- data[,c('V1','V4')]
psample03 <- psample03[-1,]
names(psample03)[1]<-"ds"
names(psample03)[2]<-"y"
as.Date(psample03$ds)
ds23 <- strptime(psample03$ds,"%Y-%m-%d")
plot(ds23,psample03$y)
# loess(psample01$y~ds2,span=0.5) #loess:local regression


# Prophet 적용
dataProphet03 <- prophet(psample03,yearly.seasonality = TRUE,
                         weekly.seasonality = TRUE, daily.seasonality = TRUE,
                         seasonality.mode = 'multiplicative')
fut03 <- make_future_dataframe(dataProphet03, periods = 1095)
tail(fut03)
forecast03 <- predict(dataProphet03, fut03)
forecast3year03 <- tail(forecast03[c('ds', 'yhat', 'yhat_lower', 'yhat_upper')])
plot(dataProphet03, forecast03) # 그래프 그리기
forecastLinePlot03 <- prophet_plot_components(dataProphet03, forecast03)
forecastLinePlot03

dyplot.prophet(dataProphet03, forecast03) # 동적 Prophet 그래프

## 제5집하장
# 데이터 정제 및 변환
drop05 <- data[-1,]
col05 <- data01[,5]
col05 <- as.numeric(col05)
drop05 <- ts(col05,frequency=1440,start=2020)

# ARIMA 시행
auto.arima(ts(drop05))

# ARIMA 그래프 그리기
sampleForecast05 <- arima(ts(drop05), order=c(4,1,2))
arimaPredict05 <- forecast(sampleForecast05,h=3) # 10년 예측
samplePlot05 <- forecast(arima(ts(drop05), order=c(4,1,2)), h=3)
autoplot(samplePlot05, include = 30) # 그래프 그리기

# EDA
psample05 <- data[,c('V1','V5')]
psample05 <- psample05[-1,]
names(psample05)[1]<-"ds"
names(psample05)[2]<-"y"
as.Date(psample05$ds)
ds25 <- strptime(psample05$ds,"%Y-%m-%d")
plot(ds25,psample05$y)
# loess(psample01$y~ds2,span=0.5) #loess:local regression


# Prophet 적용 # missing value
dataProphet05 <- prophet(psample05,yearly.seasonality = TRUE,
                         weekly.seasonality = TRUE, daily.seasonality = TRUE,
                         seasonality.mode = 'multiplicative')
fut05 <- make_future_dataframe(dataProphet05, periods = 1095)
tail(fut05)
forecast05 <- predict(dataProphet05, fut05)
forecast3year05 <- tail(forecast05[c('ds', 'yhat', 'yhat_lower', 'yhat_upper')])
plot(dataProphet05, forecast05) # 그래프 그리기
forecastLinePlot05 <- prophet_plot_components(dataProphet05, forecast05)
forecastLinePlot05

dyplot.prophet(dataProphet05, forecast05) # 동적 Prophet 그래프

## 제6집하장
# 데이터 정제 및 변환
drop06 <- data[-1,]
drop06 <- drop06[,6]
drop06 <- as.numeric(drop06)

# ARIMA 시행
auto.arima(ts(drop06D))

# ARIMA 그래프 그리기
sampleForecast06 <- arima(ts(drop06D), order=c(2,1,4))
arimaPredict06 <- forecast(sampleForecast06,h=3) # 10년 예측
samplePlot06 <- forecast(arima(ts(drop06D), order=c(2,1,4)), h=3)
autoplot(samplePlot06, include = 30) # 그래프 그리기

# EDA
psample06 <- data[,c('V1','V6')]
psample06 <- psample06[-1,]
names(psample06)[1]<-"ds"
names(psample06)[2]<-"y"
as.Date(psample06$ds)
ds26 <- strptime(psample06$ds,"%Y-%m-%d")
plot(ds26,psample06$y)
# loess(psample01$y~ds2,span=0.5) #loess:local regression


# Prophet 적용
dataProphet06 <- prophet(psample06,yearly.seasonality = TRUE,
                         weekly.seasonality = TRUE, daily.seasonality = TRUE,
                         seasonality.mode = 'multiplicative')
fut06 <- make_future_dataframe(dataProphet06, periods = 1095)
tail(fut06)
forecast06 <- predict(dataProphet06, fut06)
forecast3year06 <- tail(forecast06[c('ds', 'yhat', 'yhat_lower', 'yhat_upper')])
plot(dataProphet06, forecast06) # 그래프 그리기
forecastLinePlot06 <- prophet_plot_components(dataProphet06, forecast06)
forecastLinePlot06

dyplot.prophet(dataProphet06, forecast06) # 동적 Prophet 그래프

## 제7집하장
# 데이터 정제 및 변환
drop07 <- data[-1,]
drop07 <- drop07[,7]
drop07 <- as.numeric(drop07)

# ARIMA 시행
auto.arima(ts(drop07D))

# ARIMA 그래프 그리기
sampleForecast07 <- arima(ts(drop07D), order=c(5,1,3))
arimaPredict07 <- forecast(sampleForecast07,h=3) # 10년 예측
samplePlot07 <- forecast(arima(ts(drop07D), order=c(5,1,3)), h=3)
autoplot(samplePlot07, include = 30) # 그래프 그리기

# EDA
psample07 <- data[,c('V1','V7')]
psample07 <- psample07[-1,]
names(psample07)[1]<-"ds"
names(psample07)[2]<-"y"
as.Date(psample07$ds)
ds27 <- strptime(psample07$ds,"%Y-%m-%d")
plot(ds27,psample07$y)
# loess(psample01$y~ds2,span=0.5) #loess:local regression


# Prophet 적용 missing value
dataProphet07 <- prophet(psample07,yearly.seasonality = TRUE,
                         weekly.seasonality = TRUE, daily.seasonality = TRUE,
                         seasonality.mode = 'multiplicative')
fut07 <- make_future_dataframe(dataProphet07, periods = 1095)
tail(fut07)
forecast07 <- predict(dataProphet07, fut07)
forecast3year07 <- tail(forecast07[c('ds', 'yhat', 'yhat_lower', 'yhat_upper')])
plot(dataProphet07, forecast07) # 그래프 그리기
forecastLinePlot07 <- prophet_plot_components(dataProphet07, forecast07)
forecastLinePlot07

dyplot.prophet(dataProphet07, forecast07) # 동적 Prophet 그래프
