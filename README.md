# Data Engineering Platform Final Project (The University of Chicago, Physical Sciences Division)  

## Tools Used: TweePy, Python, Pandas, Matplotlib, Seaborn, MySQL, MongoDB, Tableau  

## Coronavirus Goes Viral: Quantifying the COVID-19 Misinformation Epidemic Spread on Twitter

Twitter is a social media platform that allows users to share and receive short posts called tweets. Though it is often used for quickly spreading news and other updates, in more recent times it has been accused of being plagued by misinformation and bots. With the outbreak of the novel coronavirus Covid-19, Twitter has become an echo chamber of hoaxes and rumors on the virus, perpetuating more Covid-19 cases and deaths.  
The Twitter API provides data scientists with a goldmine of unstructured data that can be analyzed using techniques from class to identify and classify various types of misinformation.  
Our project utilizes **Exploratory Data Analysis, Data Engineering, NLP (Natural Language Processing), & ML (Machine Learning)** to classify tweets and even predict whether a tweet has misleading information.
In this regard, our project is a baby step towards eradicating harmful data on Twitter.  

### Exploratory Data Analysis  
**Use Cases Covered**
- Identify and plot 20 Most used hashtags.
- Display the geographic locations of the collected tweets using Tableau.
- Identify top 20 most mentioned tweet accounts.
- Identify the top 20 most active users.
- Create word cloud of the most hashtags
- Identify and predict the top 20 users bein bots.
- Find the sentiment analysis on the tweets using textblob. Identify the negative, neutral and positive polarities.
- Categorize the hashtags on categories like (Antiviral, Disinfectant, Myth, Stay Home and No Category) along with sentiment polarities.
- Identify the top 20 source of misinformation spread (for eg. Iphone, android, web app, ipad etc.)

**Data Engineering**
For Data Engineering part, we used mySQL workbench to create the Entitity relationship Diagram and was using MySQl as a database. However, given the unstructured nature of the dataset we used MongoDB to be the ideal database to store our tweets.  

**NLP**  
As we are dealing with the text data we used the standard NLP techniques to clear the text data. Like lowercasing the text data, removing unwanted numeric numbers, punctuations, removed stopwords and used stemming to clean the data befire using Machine learning model.  

**Machine Learning**  
We used Logistic Regression and Naive Bayes classification model to classify given text data into Negative, Neutral, and Positive sentiments. Where Logistic regression was chosen as a best model to classify text with 70% accuracy.  

I understand this is a very low accuracy scores to begin with and require a lot of improvements and optimization techniques. However, considering this was my first attempt.

**Areas of Improvement**
- Use other classification models.
- Balance the highly imbalance labels using oversampling techniques and train models to compare the accuracy scores. 
## References
https://www.pluralsight.com/guides/building-a-twitter-sentiment-analysis-in-python
