# Linear_Feature_Engineering_Matlab

## Project 1: Linear Feature Engineering CISC 820 Quantitative Foundations

### Running the code

The main code which generates the predicted values is `get_predictions.m`. This
can be run by calling the function `get_predictions()`.

>> y_pred = get_predictions()

Optional parameters: `order` and `K` can be passed to the function as well.

The function generates the predicted values and also writes it to a file
`results/predictions.txt`.

### Documentation

The report and slides can be found in the `documentation` folder.

### Working 

#### get_predictions()

Gets the test predictions and write it to a file.

- Calls the function `train()` to train the training data.
- Reads the test data.
- Calculates the predictions on test data using the trained model.
- Writes the prediction to the file `predictions.txt`.

#### train()

Trains the data to different models and find the best model

- Reads the training data.
- Reads the optional parameters `orders` and `K` if passed.
- Fits different polynomials of order specified and custom models to the training
    data using K-fold cross validation.
- The custom models / functions which generates the features can be found in the
    file `create_custom_functions.m`.
- So, the data is trained first on polynomial functions of different orders
    (default: 0 - 10), the best polynomial model is selected, and then the data
    is trained on the custom models present in the `create_custom_functions.m`
    file.
- Finds the best model among all the models (best polynomial and custom) 
    with least validation error
- Trains the whole training data using the best model to calculate the training
    error.

### Data Analysis

Some analysis like visualization of the correlation of the features with 
the target, PCA for visualizing the features, etc was performed on the 
data. 

The analysis can be found in the folder `analysis`. The live script 
`analysis.mlx` contains the code and the outputs of the data analysis. The
file has also been converted to pdf and html versions, for easy access.
They can be found in the same folder.
