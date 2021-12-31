install.packages("TTR")
install.packages("forecast")
install.packages('prophet')
install.packages('Rcpp')
install.packages('fpp2')
library(TTR)
library(forecast)
library(prophet)
library(ggplot2)
library(dplyr)

data <- read.csv("D:/내 드라이브/세종특별자치시_자동집하시설 생활폐기물 처리현황_음식물제거.csv",fileEncoding="EUC-KR",header=F)

# 데이터 정제 및 변환
sample <- data[-1,]
sample <- sample[,2]
sample <- as.numeric(sample)

# ARIMA 시행
auto.arima(ts(sample))

# ARIMA 그래프 그리기
sampleForecast <- arima(ts(sample), order=c(4,1,3))
forecast(sampleForecast,h=4) # 4년 예측
samplePlot <- forecast(arima(ts(sample), order=c(4,1,3)) , h=10)
autoplot(samplePlot, include = 30) # 그래프 그리기

# EDA
psample <- data[,c('V1','V3')]
psample <- psample[-1,]
names(psample)[1]<-"ds"
names(psample)[2]<-"y"
as.Date(psample$ds)
ds2 <- strptime(psample$ds,"%Y-%m-%d")
plot(ds2,psample$y)
loess(psample$y~ds2,span=0.5) #loess:local regression

# Prophet 적용
dataProphet <- prophet(psample,yearly.seasonality = TRUE,
                       weekly.seasonality = TRUE, daily.seasonality = TRUE,
                       seasonality.mode = 'multiplicative')
fut <- make_future_dataframe(dataProphet, periods = 365)
tail(fut)
forecast <- predict(dataProphet, fut)
tail(forecast[c('ds', 'yhat', 'yhat_lower', 'yhat_upper')])
plot(dataProphet, forecast) # 그래프 그리기
forecastLinePlot <-prophet_plot_components(dataProphet, forecast)
forecastLinePlot

dyplot.prophet(dataProphet, forecast) # 동적 Prophet 그래프

# 단순지수평활법
sesSample<- ses(psample, h = 10) # 10년 예측
sesSample
