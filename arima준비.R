# ARIMA 분석에 사용
library(tseries) #adf test
library(forecast) # acf, arima
adf.test(drop01) # 통계적 유의성(p-value 0.05이하 유의) 
acf(drop01,main="y") # acf 도표 활용 정상성 평가
accuracy(sampleForecast01) # 예측 정확도 (값이 작을수록 좋음)
# accuracy(fut01) 안 됨
ndiffs(drop01)

adf.test(drop02) # 통계적 유의성(p-value 0.05이하 유의) 
acf(drop02,main="y") # acf 도표 활용 정상성 평가
accuracy(sampleForecast02) # 예측 정확도 (값이 작을수록 좋음)
# accuracy(fut02) 안 됨
ndiffs(drop02) 
drop02D <- diff(drop02)
drop02D
acf(drop02D,main="y")
accuracy(sampleForecast02)

adf.test(drop03) # 통계적 유의성(p-value 0.05이하 유의) 
acf(drop03,main="y") # acf 도표 활용 정상성 평가
accuracy(sampleForecast03) # 예측 정확도 (값이 작을수록 좋음)
# accuracy(fut03) 안 됨
ndiffs(drop03) 

adf.test(drop05) # 통계적 유의성(p-value 0.05이하 유의) 
acf(drop05,main="y") # acf 도표 활용 정상성 평가
accuracy(sampleForecast05) # 예측 정확도 (값이 작을수록 좋음)
# accuracy(fut05) 안 됨
ndiffs(drop05)
drop05D <- diff(drop05)
acf(drop05D,main="y")
accuracy(sampleForecast05)

adf.test(drop06) # 통계적 유의성(p-value 0.05이하 유의) 
acf(drop06,main="y") # acf 도표 활용 정상성 평가
accuracy(sampleForecast06) # 예측 정확도 (값이 작을수록 좋음)
# accuracy(fut06) 안 됨
ndiffs(drop06) 
drop06D <- diff(drop06)
acf(drop06D,main="y")


adf.test(drop07) # 통계적 유의성(p-value 0.05이하 유의) 
acf(drop07,main="y") # acf 도표 활용 정상성 평가
accuracy(sampleForecast07) # 예측 정확도 (값이 작을수록 좋음)
# accuracy(fut07) 안 됨
ndiffs(drop07) 
drop07D <- diff(drop07)
acf(drop07D,main="y")
