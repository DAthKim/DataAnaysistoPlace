# DataAnaysistoPlace
Data analysis to place
# Description
- Analysis to place vending machine
# Characteristic
- used statistic method : ARIMA, Prophet(made by facebook)
- tool : Rstudio, Qgis
- language : R
# Quick view

데이터 정제 및 변환
```R
data01 <- data[-1,]
col01 <- data01[,2] 
timeCol <- data01[,1] # 인덱스로 만들기
# timeCol <- as.POSIXct(timeCol, format = "%Y-%m-%d")
# drop01 <- data.frame(timeCol,col01)
col01 <- as.numeric(col01)
drop01 <- ts(col01,frequency=1440,start=2020) # 적절한 시계열 형태로 만들기(x 범례 값)
```

ARIMA 시행
```R
auto.arima(drop01)
```

ARIMA 그래프 그리기
```R
sampleForecast01 <- arima(drop01, order=c(0,0,1))
arima_predict01 <- forecast(sampleForecast01,h=3) # 끝에서 3년 예측
samplePlot01 <- forecast(arima(drop01, order=c(0,0,1)), h=3)
autoplot(samplePlot01, include = 30) # 그래프 그리기
```

EDA
```R
psample01 <- data[,c('V1','V2')]
psample01 <- psample[-1,]
names(psample01)[1]<-"ds"
names(psample01)[2]<-"y"
as.Date(psample01$ds)
ds2 <- strptime(psample01$ds,"%Y-%m-%d")
plot(ds2,psample01$y)
```

Prophet 적용
```R
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
```
최종결과물

<img src="https://user-images.githubusercontent.com/92314150/149647239-755eb74b-1b92-4b66-bcd7-dfa2b35db551.jpg" width="500" height="400"/>
최종결과물 풀샷

<img src="https://user-images.githubusercontent.com/92314150/149647242-c211a21b-2698-4263-8f6e-8c11e7044cc0.jpg" width="400" height="400"/>

