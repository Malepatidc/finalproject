> # Load the dataset into a data frame
  > df <- read.csv("D:/Downloads/okcupid_profiles_.csv")
  > 
    > # Remove all rows with "unknown", null, and N/A entries
    > for (col in c("age", "status", "sex", "orientation", "body_type", "diet", "drinks", "drugs", "education", "smokes", "height")) {
      +     df <- df[!(df[[col]] %in% c("unknown", "", "N/A") |
                         +                    is.na(df[[col]])), ]
      + }
  > # Select the desired columns
    > df <- df[, c("age", "status", "sex", "orientation", "body_type", "diet", "drinks", "drugs", "education", "smokes", "height")]
    > View(df)
    > 
      > 
      > unique(df$sex)
    [1] "m"                                                   
    [2] "f"                                                   
    [3] " strength trainer/power lifter with brains and heart"
    > sex_dict <- c("m" = 1, "f" = 2)
    > # Replace the unique values in the status column with numbers
      > df$sex <- factor(df$sex, levels = names(sex_dict), labels = unname(sex_dict))
      > 
        > unique(df$orientation)
      [1] "straight"                                    "bisexual"                                   
      [3] "gay"                                         " easy on the eyes.  i'm looking for friends"
      > orientation_dict <- c("straight" = 1, "bisexual" = 2, "gay"= 3)
      > # Replace the unique values in the status column with numbers
        > df$orientation <- factor(df$orientation, levels = names(orientation_dict), labels = unname(orientation_dict))
        > 
          > 
          > unique((df$body_type))
        [1] "a little extra" "average"        "athletic"       "skinny"         "thin"           "fit"           
        [7] "curvy"          "full figured"   "jacked"         "overweight"     "used up"        "rather not say"
        [13] " community"    
        > #Create a dictionary to map the unique values to numbers
          > body_type_dict <- c("a little extra" = 0, "average" = 1, "athletic" = 2, "skinny" = 3, "thin" = 4, "fit" = 5, "curvy" = 6, "full figured" = 7, "jacked" = 8, "overweight" = 9, "used up" = 10, "rather not say" = 11, "community" = 12)
          > # Replace the unique values in the body_type column with numbers
            > df$body_type <- factor(df$body_type, levels = names(body_type_dict), labels = unname(body_type_dict))
            > 
              > 
              > unique(df$diet)
            [1] "strictly anything"   "mostly other"        "mostly anything"     "mostly vegetarian"  
            [5] "strictly vegan"      "anything"            "vegetarian"          "mostly halal"       
            [9] "strictly vegetarian" "other"               "strictly other"      "vegan"              
            [13] "mostly vegan"        "mostly kosher"       "strictly halal"      "halal"              
            [17] "strictly kosher"     "kosher"              " dating partner(s)" 
            > diet_dict <- c("strictly anything" = 0, "mostly other" = 1, "mostly anything" = 2, "mostly vegetarian" = 3, "strictly vegan" = 4,
                             +                "anything" = 5, "vegetarian" = 6, "mostly halal" = 7, "strictly vegetarian" = 8, "other" = 9,
                             +                "strictly other" = 10, "vegan" = 11, "mostly vegan" = 12, "mostly kosher" = 13, "strictly halal" = 14,
                             +                "halal" = 15, "strictly kosher" = 16, "kosher" = 17, "dating partner(s)" = 18)
            > 
              > # Replace the unique values in the diet column with numbers
              > df$diet <- factor(df$diet, levels = names(diet_dict), labels = unname(diet_dict))
              > 
                > unique(df$drinks)
              [1] "socially"    "often"       "not at all"  "rarely"      "very often"  "desperately" " playmates" 
              > # Create a dictionary to map the unique values to numbers
                > drinks_dict <- c("socially" = 0, "often" = 1, "not at all" = 2, "rarely" = 3, "very often" = 4, "desperately" = 5, "playmates" = 6)
                > # Replace the unique values in the drinks column with numbers
                  > df$drinks <- factor(df$drinks, levels = names(drinks_dict), labels = unname(drinks_dict))
                  > 
                    > unique(df$drugs)
                  [1] "never"                    "sometimes"                "often"                   
                  [4] " and maybe down the line"
                  > # Create a dictionary to map the unique values to numbers
                    > drugs_dict <- c("never" = 0, "sometimes" = 1, "often" = 2, "and maybe down the line" = 3)
                    > # Replace the unique values in the drugs column with numbers
                      > df$drugs <- factor(df$drugs, levels = names(drugs_dict), labels = unname(drugs_dict))
                      > 
                        > 
                        > 
                        > unique(df$education)
                      [1] "working on college/university"             "working on space camp"                    
                      [3] "graduated from college/university"         "working on two-year college"              
                      [5] "graduated from high school"                "graduated from space camp"                
                      [7] "graduated from masters program"            "dropped out of space camp"                
                      [9] "graduated from ph.d program"               "graduated from law school"                
                      [11] "working on ph.d program"                   "working on med school"                    
                      [13] "graduated from two-year college"           "college/university"                       
                      [15] "dropped out of high school"                "dropped out of college/university"        
                      [17] "working on masters program"                "two-year college"                         
                      [19] "dropped out of ph.d program"               "dropped out of two-year college"          
                      [21] "high school"                               "working on high school"                   
                      [23] "graduated from med school"                 "space camp"                               
                      [25] "working on law school"                     "dropped out of masters program"           
                      [27] "masters program"                           "ph.d program"                             
                      [29] "law school"                                "dropped out of med school"                
                      [31] "med school"                                " family (currently i'm more about friends"
                      [33] "dropped out of law school"                
                      > education_dict <- c("working on college/university" = 1, "working on space camp" = 1,
                                            +                     "graduated from college/university" = 2, "working on two-year college" = 1,
                                            +                     "graduated from high school" = 1, "graduated from space camp" = 1,
                                            +                     "graduated from masters program" = 2, "dropped out of space camp" = 0,
                                            +                     "graduated from ph.d program" = 2, "graduated from law school" = 2,
                                            +                     "working on ph.d program" = 1, "working on med school" = 1,
                                            +                     "graduated from two-year college" = 1, "college/university" = 1,
                                            +                     "dropped out of high school" = 0, "dropped out of college/university" = 0,
                                            +                     "working on masters program" = 1, "two-year college" = 1,
                                            +                     "dropped out of ph.d program" = 0, "dropped out of two-year college" = 0,
                                            +                     "high school" = 1, "working on high school" = 1,
                                            +                     "graduated from med school" = 2, "space camp" = 1,
                                            +                     "working on law school" = 1, "dropped out of masters program" = 0,
                                            +                     "masters program" = 1, "ph.d program" = 1,
                                            +                     "law school" = 1, "dropped out of med school" = 0,
                                            +                     "med school" = 1, "family (currently i'm more about friends" = 0,
                                            +                     "dropped out of law school" = 0)
                      > # Replace the unique values in the education column with numbers
                        > df$education <- factor(df$education, levels = names(education_dict), labels = unname(education_dict))
                        > 
                          > 
                          > 
                          > unique(df$smokes)
                        [1] "sometimes"               "no"                      "trying to quit"         
                        [4] "when drinking"           "yes"                     " seems important to say"
                        > # Create a dictionary to map the unique values to numbers
                          > smokes_dict <- c("sometimes" = 1, "no" = 0, "trying to quit" = 0, "when drinking" = 0,
                                             +                  "yes" = 1, "seems important to say" = 0)
                          > 
                            > # Replace the unique values in the smokes column with numbers
                            > df$smokes <- factor(df$smokes, levels = names(smokes_dict), labels = unname(smokes_dict))
                            > 
                              > # Load the necessary libraries
                              > library(tidyverse)
                            > # Clean the data
                              > okcupid_data_clean <- df %>%
                                +     # Remove rows with missing values in any column
                                +     filter(complete.cases(.)) %>%
                                +     # Select the relevant variables
                                +     select( diet, smokes, drinks, drugs, status) %>%
                                +     # Recode the status variable as a binary outcome (1 = not single, 0 = single)
                                +     mutate(status = ifelse(status == "single", 0, 1))
                              > 
                                > # Fit a logistic regression model on the entire dataset
                                > logit_model <- glm(status ~ ., data = okcupid_data_clean, family = "binomial")
                                > 
                                  > # Make predictions on the entire dataset
                                  > predictions <- predict(logit_model, newdata = okcupid_data_clean, type = "response")
                                  > 
                                    > # Classify the predicted outcomes as "not single" or "single"
                                    > threshold <- 0.5 # Set the threshold for classifying as "not single"
                                    > predicted_classes <- ifelse(predictions >= threshold, 1, 0)
                                    > 
                                      > # Calculate the accuracy
                                      > actual_classes <- okcupid_data_clean$status
                                      > confusion_matrix <- table(predicted_classes, actual_classes)
                                      > accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
                                      > print(confusion_matrix)
                                      actual_classes
                                      predicted_classes     0     1
                                      0 22148  1369
                                      > cat("Accuracy:", round(accuracy, 4))
                                      Accuracy: 0.9418> str(df)
                                      'data.frame':	23518 obs. of  11 variables:
                                        $ age        : chr  "22" "35" "31" "37" ...
                                      $ status     : chr  "single" "single" "single" "single" ...
                                      $ sex        : Factor w/ 2 levels "1","2": 1 1 2 1 1 2 2 1 1 2 ...
                                      $ orientation: Factor w/ 3 levels "1","2","3": 1 1 1 1 1 1 1 1 1 1 ...
                                      $ body_type  : Factor w/ 13 levels "0","1","2","3",..: 1 2 2 3 2 4 5 2 3 2 ...
                                      $ diet       : Factor w/ 19 levels "0","1","2","3",..: 1 2 3 3 3 3 3 4 3 3 ...
                                      $ drinks     : Factor w/ 7 levels "0","1","2","3",..: 1 2 1 3 1 1 1 4 1 1 ...
                                      $ drugs      : Factor w/ 4 levels "0","1","2","3": 1 2 1 1 1 1 1 1 1 1 ...
                                      $ education  : Factor w/ 3 levels "1","2","0": 1 1 2 1 2 1 1 1 2 2 ...
                                      $ smokes     : Factor w/ 2 levels "1","0": 1 2 2 2 2 2 2 2 2 2 ...
                                      $ height     : chr  "75" "70" "65" "65" ...
                                      > df$age <- as.numeric(df$age)
                                      Warning message:
                                        NAs introduced by coercion 
                                      > df$height <- as.numeric(df$height)
                                      Warning message:
                                        NAs introduced by coercion 
                                      > df$education <- as.numeric(df$education)
                                      > df$diet <- as.numeric(df$diet)
                                      > df <- df[complete.cases(df),]
                                      > 
                                        > # Clean the data
                                        > okcupid_data_clean <- df %>%
                                        +     # Remove rows with missing data
                                        +     na.omit() %>%
                                        +     # Select the relevant variables
                                        +     select(status, age, height, education, diet) %>%
                                        +     # Recode the status variable as a binary outcome (1 = not single, 0 = single)
                                        +     mutate(status = ifelse(status == "single", 0, 1)) %>%
                                        +     # Select the first 1000 observations
                                        +     head(1000)
                                      > 
                                        > # Split the data into training and testing sets
                                        > set.seed(123)
                                      > train_index <- createDataPartition(okcupid_data_clean$status, p = 0.7, list = FALSE)
                                      > train_data <- okcupid_data_clean[train_index, ]
                                      > test_data <- okcupid_data_clean[-train_index, ]
                                      > 
                                        > # Fit a neural network model
                                        > nn <- neuralnet(status ~ age + height + education + diet, data = train_data, hidden =6 , linear.output = FALSE)
                                      > 
                                        > # Make predictions on the test set
                                        > predictions <- predict(nn, test_data[,2:5])
                                      > predicted.class <- ifelse(predictions > 0.5, 1, 0)
                                      > 
                                        > # Evaluate the model's performance
                                        > confusionMatrix(as.factor(predicted.class), as.factor(test_data$status))
                                      Confusion Matrix and Statistics
                                      
                                      Reference
                                      Prediction   0   1
                                      0 288  12
                                      1   0   0
                                      
                                      Accuracy : 0.96            
                                      95% CI : (0.9312, 0.9792)
                                      No Information Rate : 0.96            
                                      P-Value [Acc > NIR] : 0.575981        
                                      
                                      Kappa : 0               
                                      
                                      Mcnemar's Test P-Value : 0.001496        
                                          
            Sensitivity : 1.00            
            Specificity : 0.00            
         Pos Pred Value : 0.96            
         Neg Pred Value :  NaN            
             Prevalence : 0.96            
         Detection Rate : 0.96            
   Detection Prevalence : 1.00            
      Balanced Accuracy : 0.50            
                                          
       'Positive' Class : 0               
                                          
Warning message:
In confusionMatrix.default(as.factor(predicted.class), as.factor(test_data$status)) :
  Levels are not in the same order for reference and data. Refactoring data to match.
> 
> plot(nn)
> 
> #predictions values
> 
> predict <- compute(nn, data.frame(df$age, df$height,    df$education,df$diet))
> predicted.class=apply(predict$net.result,1,which.max)-1
> confusionMatrix(as.factor(ifelse(predicted.class=="1", "single", "married")), as.factor(df$status))
Confusion Matrix and Statistics

                Reference
Prediction       available married seeing someone single
  available              0       0              0      0
  married              636     104            629  22148
  seeing someone         0       0              0      0
  single                 0       0              0      0

Overall Statistics
                                          
               Accuracy : 0.0044          
                 95% CI : (0.0036, 0.0054)
    No Information Rate : 0.9418          
    P-Value [Acc > NIR] : 1               
                                          
                  Kappa : 0               
                                          
 Mcnemar's Test P-Value : NA              
                                      
                                      Statistics by Class:
                                        
                                        Class: available Class: married Class: seeing someone Class: single
                                      Sensitivity                   0.00000       1.000000               0.00000       0.00000
                                      Specificity                   1.00000       0.000000               1.00000       1.00000
                                      Pos Pred Value                    NaN       0.004422                   NaN           NaN
                                      Neg Pred Value                0.97296            NaN               0.97325       0.05821
                                      Prevalence                    0.02704       0.004422               0.02675       0.94179
                                      Detection Rate                0.00000       0.004422               0.00000       0.00000
                                      Detection Prevalence          0.00000       1.000000               0.00000       0.00000
                                      Balanced Accuracy             0.50000       0.500000               0.50000       0.50000
                                      Warning message:
                                        In confusionMatrix.default(as.factor(ifelse(predicted.class == "1",  :
                                                                                      Levels are not in the same order for reference and data. Refactoring data to match.
                                                                                    > prediction(nn)
                                                                                    Data Error:	1.54166666666667;
                                                                                    $rep1
                                                                                    age height education diet       status
                                                                                    1    21     60         1    1 2.953630e-02
                                                                                    2    19     63         1    1 2.825718e-02
                                                                                    3    31     63         1    1 1.492009e-01
                                                                                    4    25     64         1    1 1.491455e-01
                                                                                    5    22     65         1    1 3.446810e-02
                                                                                    6    23     65         1    1 1.063917e-01
                                                                                    7    24     65         1    1 1.470172e-01
                                                                                    8    29     66         1    1 1.492009e-01
                                                                                    9    41     66         1    1 1.431472e-01
                                                                                    10   25     67         1    1 1.490434e-01
                                                                                    11   20     68         1    1 2.825942e-02
                                                                                    12   22     68         1    1 3.047568e-02
                                                                                    13   25     68         1    1 1.489779e-01
                                                                                    14   22     69         1    1 2.982643e-02
                                                                                    15   30     69         1    1 1.492009e-01
                                                                                    16   19     70         1    1 2.825666e-02
                                                                                    17   21     70         1    1 2.829604e-02
                                                                                    18   24     70         1    1 1.375958e-01
                                                                                    19   33     70         1    1 1.492009e-01
                                                                                    20   21     71         1    1 2.828444e-02
                                                                                    21   30     72         1    1 1.492009e-01
                                                                                    22   18     73         1    1 2.825662e-02
                                                                                    23   26     73         1    1 1.491558e-01
                                                                                    24   27     73         1    1 1.491993e-01
                                                                                    25   31     73         1    1 1.492009e-01
                                                                                    26   22     74         1    1 2.853277e-02
                                                                                    27   24     74         1    1 1.121069e-01
                                                                                    28   30     75         1    1 1.492009e-01
                                                                                    29   48     77         1    1 7.715367e-08
                                                                                    30   25     61         2    1 2.825662e-02
                                                                                    31   23     62         2    1 2.825662e-02
                                                                                    32   25     62         2    1 2.825662e-02
                                                                                    33   31     62         2    1 3.375185e-02
                                                                                    34   26     64         2    1 2.825662e-02
                                                                                    35   34     64         2    1 1.490224e-01
                                                                                    36   37     64         2    1 1.492009e-01
                                                                                    37   42     64         2    1 1.491379e-01
                                                                                    38   24     65         2    1 2.825662e-02
                                                                                    39   28     65         2    1 2.825670e-02
                                                                                    40   31     65         2    1 3.021556e-02
                                                                                    41   32     65         2    1 7.011263e-02
                                                                                    42   37     65         2    1 1.492009e-01
                                                                                    43   43     65         2    1 1.489519e-01
                                                                                    44   29     66         2    1 2.825836e-02
                                                                                    45   32     66         2    1 6.059875e-02
                                                                                    46   37     66         2    1 1.492009e-01
                                                                                    47   25     67         2    1 2.825662e-02
                                                                                    48   33     67         2    1 1.361897e-01
                                                                                    49   34     67         2    1 1.486944e-01
                                                                                    50   23     68         2    1 2.825662e-02
                                                                                    51   24     68         2    1 2.825662e-02
                                                                                    52   25     68         2    1 2.825662e-02
                                                                                    53   26     68         2    1 2.825662e-02
                                                                                    54   29     68         2    1 2.825748e-02
                                                                                    55   30     68         2    1 2.828116e-02
                                                                                    56   31     68         2    1 2.894837e-02
                                                                                    57   34     68         2    1 1.484843e-01
                                                                                    58   35     68         2    1 1.491754e-01
                                                                                    59   39     68         2    1 1.492009e-01
                                                                                    60   24     69         2    1 2.825662e-02
                                                                                    61   27     69         2    1 2.825662e-02
                                                                                    62   28     69         2    1 2.825664e-02
                                                                                    63   30     69         2    1 2.827394e-02
                                                                                    64   24     70         2    1 2.825662e-02
                                                                                    65   26     70         2    1 2.825662e-02
                                                                                    66   29     70         2    1 2.825705e-02
                                                                                    67   30     70         2    1 2.826884e-02
                                                                                    68   31     70         2    1 2.860161e-02
                                                                                    69   36     70         2    1 1.491991e-01
                                                                                    70   40     70         2    1 1.492009e-01
                                                                                    71   48     70         2    1 2.755871e-02
                                                                                    72   23     71         2    1 2.825662e-02
                                                                                    73   28     71         2    1 2.825663e-02
                                                                                    74   31     71         2    1 2.850019e-02
                                                                                    75   34     71         2    1 1.471821e-01
                                                                                    76   36     71         2    1 1.491983e-01
                                                                                    77   23     72         2    1 2.825662e-02
                                                                                    78   24     72         2    1 2.825662e-02
                                                                                    79   28     72         2    1 2.825662e-02
                                                                                    80   31     72         2    1 2.842858e-02
                                                                                    81   35     72         2    1 1.490982e-01
                                                                                    82   39     72         2    1 1.492009e-01
                                                                                    83   44     72         2    1 1.491957e-01
                                                                                    84   26     73         2    1 2.825662e-02
                                                                                    85   30     73         2    1 2.826091e-02
                                                                                    86   33     73         2    1 8.729258e-02
                                                                                    87   36     73         2    1 1.491957e-01
                                                                                    88   42     73         2    1 1.492009e-01
                                                                                    89   30     74         2    1 2.825965e-02
                                                                                    90   31     74         2    1 2.834230e-02
                                                                                    91   39     74         2    1 1.492009e-01
                                                                                    92   34     75         2    1 1.414093e-01
                                                                                    93   27     80         2    1 2.825662e-02
                                                                                    94   31     67         3    1 2.825662e-02
                                                                                    95   49     70         3    1 1.487701e-01
                                                                                    96   36     72         3    1 2.825662e-02
                                                                                    97   27     75         3    1 2.825662e-02
                                                                                    98   37     65         1    2 1.492008e-01
                                                                                    99   23     70         1    2 2.825922e-02
                                                                                    100  35     70         1    2 1.492009e-01
                                                                                    101  26     71         1    2 6.190063e-02
                                                                                    102  33     71         1    2 1.492009e-01
                                                                                    103  45     60         2    2 9.426846e-02
                                                                                    104  29     63         2    2 2.825662e-02
                                                                                    105  59     65         2    2 1.146831e-19
                                                                                    106  35     67         2    2 6.796065e-02
                                                                                    107  49     68         2    2 4.726083e-03
                                                                                    108  39     69         2    2 1.492002e-01
                                                                                    109  27     70         2    2 2.825662e-02
                                                                                    110  62     72         2    2 1.146831e-19
                                                                                    111  27     73         2    2 2.825662e-02
                                                                                    112  19     59         1    3 2.825662e-02
                                                                                    113  33     60         1    3 1.492009e-01
                                                                                    114  22     61         1    3 2.825662e-02
                                                                                    115  29     61         1    3 1.448592e-01
                                                                                    116  20     62         1    3 2.825662e-02
                                                                                    117  23     62         1    3 2.825662e-02
                                                                                    118  29     62         1    3 1.431287e-01
                                                                                    119  53     62         1    3 1.146833e-19
                                                                                    120  18     63         1    3 2.825662e-02
                                                                                    121  22     63         1    3 2.825662e-02
                                                                                    122  25     63         1    3 2.825858e-02
                                                                                    123  26     63         1    3 2.831212e-02
                                                                                    124  60     63         1    3 1.146831e-19
                                                                                    125  19     64         1    3 2.825662e-02
                                                                                    126  21     64         1    3 2.825662e-02
                                                                                    127  22     64         1    3 2.825662e-02
                                                                                    128  23     64         1    3 2.825662e-02
                                                                                    129  26     64         1    3 2.829579e-02
                                                                                    130  29     64         1    3 1.375288e-01
                                                                                    131  31     64         1    3 1.491849e-01
                                                                                    132  22     65         1    3 2.825662e-02
                                                                                    133  25     65         1    3 2.825759e-02
                                                                                    134  45     65         1    3 4.466071e-02
                                                                                    135  20     66         1    3 2.825662e-02
                                                                                    136  21     66         1    3 2.825662e-02
                                                                                    137  23     66         1    3 2.825662e-02
                                                                                    138  24     66         1    3 2.825664e-02
                                                                                    139  27     66         1    3 2.880699e-02
                                                                                    140  30     66         1    3 1.483010e-01
                                                                                    141  35     66         1    3 1.492009e-01
                                                                                    142  61     66         1    3 1.146831e-19
                                                                                    143  22     67         1    3 2.825662e-02
                                                                                    144  24     67         1    3 2.825663e-02
                                                                                    145  25     67         1    3 2.825710e-02
                                                                                    146  27     67         1    3 2.864528e-02
                                                                                    147  29     67         1    3 1.205463e-01
                                                                                    148  36     67         1    3 1.492009e-01
                                                                                    149  20     68         1    3 2.825662e-02
                                                                                    150  25     68         1    3 2.825696e-02
                                                                                    151  33     68         1    3 1.492008e-01
                                                                                    152  34     68         1    3 1.492009e-01
                                                                                    153  37     68         1    3 1.492009e-01
                                                                                    154  42     68         1    3 1.491860e-01
                                                                                    155  51     68         1    3 1.175127e-19
                                                                                    156  20     69         1    3 2.825662e-02
                                                                                    157  23     69         1    3 2.825662e-02
                                                                                    158  29     69         1    3 1.019780e-01
                                                                                    159  30     69         1    3 1.466718e-01
                                                                                    160  31     69         1    3 1.491098e-01
                                                                                    161  32     69         1    3 1.491977e-01
                                                                                    162  39     69         1    3 1.492009e-01
                                                                                    163  41     69         1    3 1.492002e-01
                                                                                    164  47     69         1    3 5.663278e-03
                                                                                    165  18     70         1    3 2.825662e-02
                                                                                    166  24     70         1    3 2.825662e-02
                                                                                    167  25     70         1    3 2.825679e-02
                                                                                    168  26     70         1    3 2.826146e-02
                                                                                    169  32     70         1    3 1.491963e-01
                                                                                    170  40     70         1    3 1.492009e-01
                                                                                    171  45     70         1    3 1.470082e-01
                                                                                    172  18     71         1    3 2.825662e-02
                                                                                    173  19     71         1    3 2.825662e-02
                                                                                    174  20     71         1    3 2.825662e-02
                                                                                    175  21     71         1    3 2.825662e-02
                                                                                    176  23     71         1    3 2.825662e-02
                                                                                    177  27     71         1    3 2.835316e-02
                                                                                    178  31     71         1    3 1.490181e-01
                                                                                    179  35     71         1    3 1.492009e-01
                                                                                    180  39     71         1    3 1.492009e-01
                                                                                    181  20     72         1    3 2.825662e-02
                                                                                    182  21     72         1    3 2.825662e-02
                                                                                    183  23     72         1    3 2.825662e-02
                                                                                    184  25     72         1    3 2.825670e-02
                                                                                    185  35     72         1    3 1.492009e-01
                                                                                    186  19     73         1    3 2.825662e-02
                                                                                    187  20     73         1    3 2.825662e-02
                                                                                    188  28     73         1    3 2.960963e-02
                                                                                    189  33     73         1    3 1.492004e-01
                                                                                    190  35     73         1    3 1.492009e-01
                                                                                    191  24     74         1    3 2.825662e-02
                                                                                    192  27     74         1    3 2.829057e-02
                                                                                    193  30     74         1    3 1.359072e-01
                                                                                    194  31     74         1    3 1.486822e-01
                                                                                    195  36     74         1    3 1.492009e-01
                                                                                    196  50     75         1    3 1.047598e-06
                                                                                    197  32     83         1    3 1.487782e-01
                                                                                    198  46     58         2    3 5.689731e-02
                                                                                    199  35     60         2    3 2.830557e-02
                                                                                    200  27     61         2    3 2.825662e-02
                                                                                    [ reached getOption("max.print") -- omitted 400 rows ]
                                                                                    
                                                                                    $data
                                                                                    age height education diet    status
                                                                                    1    21     60         1    1 0.0000000
                                                                                    2    19     63         1    1 0.0000000
                                                                                    3    31     63         1    1 0.0000000
                                                                                    4    25     64         1    1 0.0000000
                                                                                    5    22     65         1    1 0.0000000
                                                                                    6    23     65         1    1 0.0000000
                                                                                    7    24     65         1    1 0.0000000
                                                                                    8    29     66         1    1 0.0000000
                                                                                    9    41     66         1    1 1.0000000
                                                                                    10   25     67         1    1 1.0000000
                                                                                    11   20     68         1    1 0.0000000
                                                                                    12   22     68         1    1 0.0000000
                                                                                    13   25     68         1    1 0.0000000
                                                                                    14   22     69         1    1 0.0000000
                                                                                    15   30     69         1    1 0.0000000
                                                                                    16   19     70         1    1 0.0000000
                                                                                    17   21     70         1    1 0.0000000
                                                                                    18   24     70         1    1 0.5000000
                                                                                    19   33     70         1    1 0.0000000
                                                                                    20   21     71         1    1 0.0000000
                                                                                    21   30     72         1    1 0.0000000
                                                                                    22   18     73         1    1 0.0000000
                                                                                    23   26     73         1    1 0.0000000
                                                                                    24   27     73         1    1 0.0000000
                                                                                    25   31     73         1    1 0.0000000
                                                                                    26   22     74         1    1 0.0000000
                                                                                    27   24     74         1    1 0.0000000
                                                                                    28   30     75         1    1 1.0000000
                                                                                    29   48     77         1    1 0.0000000
                                                                                    30   25     61         2    1 0.0000000
                                                                                    31   23     62         2    1 0.0000000
                                                                                    32   25     62         2    1 0.0000000
                                                                                    33   31     62         2    1 0.0000000
                                                                                    34   26     64         2    1 0.0000000
                                                                                    35   34     64         2    1 0.0000000
                                                                                    36   37     64         2    1 0.0000000
                                                                                    37   42     64         2    1 0.0000000
                                                                                    38   24     65         2    1 0.0000000
                                                                                    39   28     65         2    1 0.0000000
                                                                                    40   31     65         2    1 0.0000000
                                                                                    41   32     65         2    1 0.0000000
                                                                                    42   37     65         2    1 0.0000000
                                                                                    43   43     65         2    1 0.0000000
                                                                                    44   29     66         2    1 0.0000000
                                                                                    45   32     66         2    1 0.0000000
                                                                                    46   37     66         2    1 0.0000000
                                                                                    47   25     67         2    1 0.0000000
                                                                                    48   33     67         2    1 1.0000000
                                                                                    49   34     67         2    1 0.0000000
                                                                                    50   23     68         2    1 0.0000000
                                                                                    51   24     68         2    1 0.0000000
                                                                                    52   25     68         2    1 0.0000000
                                                                                    53   26     68         2    1 0.0000000
                                                                                    54   29     68         2    1 0.0000000
                                                                                    55   30     68         2    1 0.0000000
                                                                                    56   31     68         2    1 0.0000000
                                                                                    57   34     68         2    1 0.0000000
                                                                                    58   35     68         2    1 0.0000000
                                                                                    59   39     68         2    1 0.0000000
                                                                                    60   24     69         2    1 0.0000000
                                                                                    61   27     69         2    1 0.0000000
                                                                                    62   28     69         2    1 0.0000000
                                                                                    63   30     69         2    1 0.0000000
                                                                                    64   24     70         2    1 0.0000000
                                                                                    65   26     70         2    1 0.0000000
                                                                                    66   29     70         2    1 0.0000000
                                                                                    67   30     70         2    1 0.0000000
                                                                                    68   31     70         2    1 0.0000000
                                                                                    69   36     70         2    1 1.0000000
                                                                                    70   40     70         2    1 0.0000000
                                                                                    71   48     70         2    1 0.0000000
                                                                                    72   23     71         2    1 0.0000000
                                                                                    73   28     71         2    1 0.0000000
                                                                                    74   31     71         2    1 0.0000000
                                                                                    75   34     71         2    1 1.0000000
                                                                                    76   36     71         2    1 0.0000000
                                                                                    77   23     72         2    1 0.0000000
                                                                                    78   24     72         2    1 0.0000000
                                                                                    79   28     72         2    1 0.0000000
                                                                                    80   31     72         2    1 0.0000000
                                                                                    81   35     72         2    1 0.0000000
                                                                                    82   39     72         2    1 1.0000000
                                                                                    83   44     72         2    1 0.0000000
                                                                                    84   26     73         2    1 0.0000000
                                                                                    85   30     73         2    1 0.0000000
                                                                                    86   33     73         2    1 0.0000000
                                                                                    87   36     73         2    1 0.0000000
                                                                                    88   42     73         2    1 0.0000000
                                                                                    89   30     74         2    1 0.0000000
                                                                                    90   31     74         2    1 0.0000000
                                                                                    91   39     74         2    1 0.0000000
                                                                                    92   34     75         2    1 0.0000000
                                                                                    93   27     80         2    1 0.0000000
                                                                                    94   31     67         3    1 0.0000000
                                                                                    95   49     70         3    1 1.0000000
                                                                                    96   36     72         3    1 0.0000000
                                                                                    97   27     75         3    1 0.0000000
                                                                                    98   37     65         1    2 0.0000000
                                                                                    99   23     70         1    2 0.0000000
                                                                                    100  35     70         1    2 0.0000000
                                                                                    101  26     71         1    2 0.0000000
                                                                                    102  33     71         1    2 0.0000000
                                                                                    103  45     60         2    2 0.0000000
                                                                                    104  29     63         2    2 0.0000000
                                                                                    105  59     65         2    2 0.0000000
                                                                                    106  35     67         2    2 0.0000000
                                                                                    107  49     68         2    2 0.0000000
                                                                                    108  39     69         2    2 0.0000000
                                                                                    109  27     70         2    2 0.0000000
                                                                                    110  62     72         2    2 0.0000000
                                                                                    111  27     73         2    2 0.0000000
                                                                                    112  19     59         1    3 0.0000000
                                                                                    113  33     60         1    3 0.0000000
                                                                                    114  22     61         1    3 0.0000000
                                                                                    115  29     61         1    3 0.0000000
                                                                                    116  20     62         1    3 0.0000000
                                                                                    117  23     62         1    3 0.0000000
                                                                                    118  29     62         1    3 0.0000000
                                                                                    119  53     62         1    3 0.0000000
                                                                                    120  18     63         1    3 0.0000000
                                                                                    121  22     63         1    3 0.0000000
                                                                                    122  25     63         1    3 0.0000000
                                                                                    123  26     63         1    3 0.0000000
                                                                                    124  60     63         1    3 0.0000000
                                                                                    125  19     64         1    3 0.0000000
                                                                                    126  21     64         1    3 0.0000000
                                                                                    127  22     64         1    3 0.0000000
                                                                                    128  23     64         1    3 0.0000000
                                                                                    129  26     64         1    3 0.0000000
                                                                                    130  29     64         1    3 0.0000000
                                                                                    131  31     64         1    3 0.0000000
                                                                                    132  22     65         1    3 0.0000000
                                                                                    133  25     65         1    3 0.0000000
                                                                                    134  45     65         1    3 0.0000000
                                                                                    135  20     66         1    3 0.0000000
                                                                                    136  21     66         1    3 0.0000000
                                                                                    137  23     66         1    3 0.0000000
                                                                                    138  24     66         1    3 0.0000000
                                                                                    139  27     66         1    3 0.0000000
                                                                                    140  30     66         1    3 0.2500000
                                                                                    141  35     66         1    3 0.0000000
                                                                                    142  61     66         1    3 0.0000000
                                                                                    143  22     67         1    3 0.0000000
                                                                                    144  24     67         1    3 0.0000000
                                                                                    145  25     67         1    3 0.0000000
                                                                                    146  27     67         1    3 0.0000000
                                                                                    147  29     67         1    3 0.0000000
                                                                                    148  36     67         1    3 0.0000000
                                                                                    149  20     68         1    3 0.0000000
                                                                                    150  25     68         1    3 0.0000000
                                                                                    151  33     68         1    3 0.0000000
                                                                                    152  34     68         1    3 0.0000000
                                                                                    153  37     68         1    3 0.0000000
                                                                                    154  42     68         1    3 1.0000000
                                                                                    155  51     68         1    3 0.0000000
                                                                                    156  20     69         1    3 0.0000000
                                                                                    157  23     69         1    3 0.0000000
                                                                                    158  29     69         1    3 0.0000000
                                                                                    159  30     69         1    3 0.0000000
                                                                                    160  31     69         1    3 0.0000000
                                                                                    161  32     69         1    3 0.0000000
                                                                                    162  39     69         1    3 0.0000000
                                                                                    163  41     69         1    3 0.0000000
                                                                                    164  47     69         1    3 0.0000000
                                                                                    165  18     70         1    3 0.0000000
                                                                                    166  24     70         1    3 0.0000000
                                                                                    167  25     70         1    3 0.0000000
                                                                                    168  26     70         1    3 0.0000000
                                                                                    169  32     70         1    3 0.0000000
                                                                                    170  40     70         1    3 0.0000000
                                                                                    171  45     70         1    3 0.0000000
                                                                                    172  18     71         1    3 0.0000000
                                                                                    173  19     71         1    3 0.0000000
                                                                                    174  20     71         1    3 0.0000000
                                                                                    175  21     71         1    3 0.0000000
                                                                                    176  23     71         1    3 0.0000000
                                                                                    177  27     71         1    3 0.0000000
                                                                                    178  31     71         1    3 0.0000000
                                                                                    179  35     71         1    3 1.0000000
                                                                                    180  39     71         1    3 0.0000000
                                                                                    181  20     72         1    3 0.0000000
                                                                                    182  21     72         1    3 0.0000000
                                                                                    183  23     72         1    3 0.0000000
                                                                                    184  25     72         1    3 0.0000000
                                                                                    185  35     72         1    3 0.0000000
                                                                                    186  19     73         1    3 0.0000000
                                                                                    187  20     73         1    3 0.0000000
                                                                                    188  28     73         1    3 0.0000000
                                                                                    189  33     73         1    3 0.0000000
                                                                                    190  35     73         1    3 0.0000000
                                                                                    191  24     74         1    3 0.0000000
                                                                                    192  27     74         1    3 0.0000000
                                                                                    193  30     74         1    3 0.0000000
                                                                                    194  31     74         1    3 0.0000000
                                                                                    195  36     74         1    3 0.0000000
                                                                                    196  50     75         1    3 0.0000000
                                                                                    197  32     83         1    3 0.0000000
                                                                                    198  46     58         2    3 0.0000000
                                                                                    199  35     60         2    3 0.0000000
                                                                                    200  27     61         2    3 0.0000000
                                                                                    [ reached getOption("max.print") -- omitted 400 rows ]



