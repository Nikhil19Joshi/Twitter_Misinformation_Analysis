USE depa_twitter;

CREATE TABLE tweets (
	created_at DATE NULL DEFAULT NULL,
    tweet_id VARCHAR(30) NOT NULL,
    tweet_source VARCHAR(255) NULL DEFAULT NULL,
    retweet_count VARCHAR(100) NULL DEFAULT NULL,
    screen_name VARCHAR(100) NULL DEFAULT NULL,
    account_creation_date VARCHAR(100) NULL DEFAULT NULL,
    location VARCHAR(100) NULL DEFAULT NULL,
    coordinates VARCHAR(100) NULL DEFAULT NULL,
    PRIMARY KEY (tweet_id)
);

SELECT * FROM tweets;

DROP TABLE tweets;

CREATE TABLE `hashtags` (
    `hashtag_id` INT NOT NULL,
    `hashtag` VARCHAR(45),
    `category` VARCHAR(45),
    `data_pull` VARCHAR(45),
    `total_count` INT,
    PRIMARY KEY (`hashtag_id`));


DROP TABLE hashtags;

SELECT * FROM hashtags;

CREATE TABLE `tweet_hashtag_match` (
    `match_id` INT NOT NULL,
    `tweet_id` VARCHAR(30) NOT NULL,
    `hashtag_id` INT NOT NULL,
    PRIMARY KEY (`match_id`),
		FOREIGN KEY(`tweet_id`)
        REFERENCES `tweets` (`tweet_id`)
        ON DELETE NO ACTION
		ON UPDATE NO ACTION,
        FOREIGN KEY(`hashtag_id`) 
        REFERENCES `hashtags` (`hashtag_id`)
        ON DELETE NO ACTION
		ON UPDATE NO ACTION);


DROP TABLE `tweet_hashtag_match`;

CREATE TABLE `handles` (
    `handle_id` INT NOT NULL,
    `handle` VARCHAR(45),
    `total_count` INT,
    PRIMARY KEY (`handle_id`));

SELECT tweet_id, hashtag FROM tweet_hashtag_match INNER JOIN hashtags ON tweet_hashtag_match.hashtag_id = hashtags.hashtag_id WHERE hashtags.hashtag_id = 41;

CREATE TABLE `mentions` (
    `mention_id` INT NOT NULL,
    `tweet_id` VARCHAR(30) NOT NULL,
    `handle_id` INT NOT NULL,
    PRIMARY KEY (`mention_id`),
		FOREIGN KEY(`tweet_id`)
        REFERENCES `tweets` (`tweet_id`)
        ON DELETE NO ACTION
		ON UPDATE NO ACTION,
        FOREIGN KEY(`handle_id`) 
        REFERENCES `handles` (`handle_id`)
        ON DELETE NO ACTION
		ON UPDATE NO ACTION);
        
CREATE TABLE `sentiments` (
    `mention_id` INT NOT NULL,
    `tweet_id` VARCHAR(30) NOT NULL,
    `handle_id` INT NOT NULL,
    PRIMARY KEY (`mention_id`),
		FOREIGN KEY(`tweet_id`)
        REFERENCES `tweets` (`tweet_id`)
        ON DELETE NO ACTION
		ON UPDATE NO ACTION,
        FOREIGN KEY(`handle_id`) 
        REFERENCES `handles` (`handle_id`)
        ON DELETE NO ACTION
		ON UPDATE NO ACTION);

CREATE TABLE `sentiments` (
    `tweet_id` VARCHAR(30) NOT NULL,
    `sentiment` VARCHAR(30) NOT NULL,
    `polarity` FLOAT NOT NULL,
    PRIMARY KEY (`tweet_id`),
		FOREIGN KEY(`tweet_id`)
        REFERENCES `tweets` (`tweet_id`)
        ON DELETE NO ACTION
		ON UPDATE NO ACTION);
        
SELECT tweets.tweet_id, handles.handle, hashtags.hashtag, tweets.retweet_count, sentiment FROM tweets 
INNER JOIN mentions ON mentions.tweet_id = tweets.tweet_id 
INNER JOIN handles ON handles.handle_id = mentions.handle_id
INNER JOIN tweet_hashtag_match ON tweet_hashtag_match.tweet_id = tweets.tweet_id
INNER JOIN hashtags ON tweet_hashtag_match.hashtag_id = hashtags.hashtag_id
INNER JOIN sentiments ON sentiments.tweet_id = tweets.tweet_id
WHERE sentiment = 'Negative';

SELECT COUNT(*) FROM tweet_hashtag_match;


        
        
SELECT * FROM sentiments WHERE tweet_id = 'ID1263895276747665408';



