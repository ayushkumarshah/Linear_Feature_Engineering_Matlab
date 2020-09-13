# Linear_Feature_Engineering_Matlab

## Project 1: Linear Feature Engineering <br> CISC 820 Quantitative Foundations

### Running the code

The main code which generates the predicted values is `get_predictions.m`. This
can be run by calling the function `get_predictions()`

```matlab
>> y_pred = get_predictions()
```

Optional parameters: `order` and `K` can be passed to the function as well.

The function generates the predicted values and also writes it to a file
`results/predictions.txt`.

### Data Analysis

Some analysis like visualization of the correlation of the features with 
the target, PCA for visualizing the features, etc was performed on the 
data. 

The analysis can be found in the folder `analysis`. The live script 
`analysis.mlx` contains the code and the outputs of the data analysis. The
file has also been converted to pdf and html versions, for easy access.
They can be found in the same folder.

### Code structure

#### get_predictions()

Get the test predictions and write it to a file

- calls the function `train()` to train the training data
- reads the test data
- calculates the predictions on test data using the trained model
- writes the prediction to the file `predictions.txt`

#### train()

Train the data to different models and find the best model

- reads the training data
- reads the optional parameters `orders` and `K` if passed
- fits different polynomial and custom models to the training data using K-fold cross validation
- finds the best model with least validation error
- trains the whole training data using the best model to calculate the training
    error.

License: [MIT](https://github.com/ayushkumarshah/Linear_Feature_Engineering_Matlab/blob/master/LICENSE)
