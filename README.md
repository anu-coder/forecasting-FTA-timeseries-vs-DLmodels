# Forecasting Foreign Tourist Arrival in India: Neural Network vs. Time Series Models
**Authored by: Anurima Dey & Shreyasee Dev**

## Purpose:

At this age of globalization, the Travel and Tourism Industry (T &T) plays a vital role in the world economy. The Indian tourism industry generated around ₹16.91 lakh crore (240 billion US $) or 9.2% of India's GDP in 2018 and supported 42.673 million jobs, (8.1% of its total employment). The rising social and economic significance of the tourism sector in India and the modern forecasting trends have instigated in us the zeal to work on this particular project of evaluating the forecasting performance of neural networks models relative to time series model.

## Objective: 

The main objective of the project was to compare the performance efficiency of neural networks models namely Multilayer Perceptron (MLP) and Long Short Term Memory (LSTM) relative to linear Auto Regressive (AR) time series model for foreign tourist arrival in India. We have used two different forecasting windows of 6 months and 24 months to find out how well behaved our model performances are for short term and long term prediction. 

## The data set:

![](https://github.com/anu-coder/forecasting-FTA-timeseries-vs-DLmodels/blob/master/Images/Mainplot.jpeg)

## Procedure: 

To ensure that the models are accurately compared, we carried out all three modelling on stationary time series. First, we have modelled the time series which turned out to be a AR(10). Next we have decided upon the structures our MLP model (9:2:1 and 9:1:1 for 24 months and 6 months prediction respectively) by choosing the minimum number of neurons through lowest MSE criterion. To maintain a parity in models we have used similar architecture in LSTM.

## Results: 

On the basis of two well known performance matrices namely RMSE, MAPE, our findings suggested that for both the time horizons, 6 months and 24 months, the ANN models namely LSTM and MLP have outperformed the naive Auto Regressive time series model. The attached visualization shows the results. 

![](https://github.com/anu-coder/forecasting-FTA-timeseries-vs-DLmodels/blob/master/Images/Pred_plot.jpeg)

## Conclusion: 

The time series modelling is carried out to capture the persistence behavior of stationary series. We believe that the particular outcome that we obtained is due to the capacity of the Neural Network models to capture the noise or the persistence behavior better than time series model which is linear in parameter. This can be owing to the fact that the stationary series we obtained, still possessed a  certain level of unknown nonlinear dependencies. However, since the time series auto-regressive model could only capture the linear dependencies in the data, it could not perform as efficiently. On a concluding note of this small project, we can therefore say that, for modelling the foreign tourist arrival in India, ANN models (MLP & LSTM) perform better than a linear benchmark Auto Regressive time series model under stationary conditions. 

**Quick links :** [Project report](https://github.com/anu-coder/forecasting-FTA-timeseries-vs-DLmodels/blob/master/plots%20and%20project%20report/Shreyasee_Anurima_Project_ISINE_file.pdf)

