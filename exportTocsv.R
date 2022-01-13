# arima
arimaCollection <- data.frame(arima_predict01,arimaPredict02,arimaPredict03,arimaPredict05,arimaPredict06,arimaPredict07, stringsAsFactors = FALSE)

arimaCollectionRbind <- rbind(arima_predict01,arimaPredict02,arimaPredict03,arimaPredict05,arimaPredict06,arimaPredict07, stringsAsFactors = FALSE)

# prophet
prophetCollection <- cbind(forecast3year01,forecast3year02,forecast3year03,forecast3year05,forecast3year06, forecast3year07, stringsAsFactors = FALSE)

# adfTest
adfCollection <- rbind(adfTest01,adfTest02,adfTest03,adfTest05,adfTest06,adfTest07, stringsAsFactors = FALSE)

# accuracy
accuracyCollection <- rbind(accuracy01,accuracy02,accuracy03,accuracy05,accuracy06,accuracy07, stringsAsFactors = FALSE)

write.csv(arimaCollection,"D:/내 드라이브/arimaCollection.csv")
write.csv(arimaCollectionRbind,"D:/내 드라이브/arimaCollectionRbind.csv")
write.csv(prophetCollection,"D:/내 드라이브/prophetCollection.csv")
write.csv(adfCollection,"D:/내 드라이브/adfCollection.csv")
write.csv(accuracyCollection,"D:/내 드라이브/accuracyCollection.csv")
