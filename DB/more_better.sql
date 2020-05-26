-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema morebetterdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `morebetterdb` ;

-- -----------------------------------------------------
-- Schema morebetterdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `morebetterdb` DEFAULT CHARACTER SET utf8 ;
USE `morebetterdb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(1000) NULL,
  `role` ENUM("STANDARD", "MENTOR", "APPLICANT") NOT NULL,
  `age` INT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `enabled` TINYINT NOT NULL DEFAULT 1,
  `picture` VARCHAR(1000) NULL,
  `biography` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `logo` VARCHAR(5000) NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(100) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `zip_code` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event` ;

CREATE TABLE IF NOT EXISTS `event` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `category_id` INT NOT NULL,
  `mentor_id` INT NOT NULL,
  `address_id` INT NULL,
  `title` TEXT NOT NULL,
  `description` TEXT NOT NULL,
  `location` VARCHAR(1000) NULL,
  `event_date` DATETIME NULL,
  `max_capacity` INT NULL,
  `price` DECIMAL(6,2) NULL,
  `created_at` DATETIME NULL,
  `last_updated` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_category_id_idx` (`category_id` ASC),
  INDEX `fk_event_user1_idx` (`mentor_id` ASC),
  INDEX `fk_event_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_category_id`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_user1`
    FOREIGN KEY (`mentor_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event_participant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_participant` ;

CREATE TABLE IF NOT EXISTS `event_participant` (
  `user_id` INT NOT NULL,
  `event_id` INT NOT NULL,
  `rating` INT NULL,
  `rating_comment` VARCHAR(45) NULL,
  PRIMARY KEY (`user_id`, `event_id`),
  INDEX `fk_user_has_event_event1_idx` (`event_id` ASC),
  INDEX `fk_user_has_event_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_event_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_event_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `article`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `article` ;

CREATE TABLE IF NOT EXISTS `article` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `category_id` INT NOT NULL,
  `mentor_id` INT NOT NULL,
  `title` TEXT NOT NULL,
  `contents` TEXT NOT NULL,
  `created` DATETIME NULL,
  `reference` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_article_category1_idx` (`category_id` ASC),
  INDEX `fk_article_user1_idx` (`mentor_id` ASC),
  CONSTRAINT `fk_article_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_article_user1`
    FOREIGN KEY (`mentor_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mentor_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mentor_category` ;

CREATE TABLE IF NOT EXISTS `mentor_category` (
  `user_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `category_id`),
  INDEX `fk_user_has_category_category1_idx` (`category_id` ASC),
  INDEX `fk_user_has_category_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_category_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_category_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `article_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `article_comment` ;

CREATE TABLE IF NOT EXISTS `article_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `article_id` INT NOT NULL,
  `content` TEXT NOT NULL,
  `created_at` DATETIME NOT NULL,
  INDEX `fk_article_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_article_comment_article1_idx` (`article_id` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_article_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_article_comment_article1`
    FOREIGN KEY (`article_id`)
    REFERENCES `article` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS morebetteruser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'morebetteruser'@'localhost' IDENTIFIED BY 'morebetter';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'morebetteruser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `morebetterdb`;
INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `role`, `age`, `username`, `password`, `enabled`, `picture`, `biography`) VALUES (1, 'Joe', 'Mama', 'joe.mama@user.mail', 'STANDARD', 35, 'joemama', 'joemama', 1, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `role`, `age`, `username`, `password`, `enabled`, `picture`, `biography`) VALUES (2, 'Lisa', 'Morgan', 'lisa.morgan@mentor.mail', 'MENTOR', 41, 'lisamorgan', 'lisamorgan', 1, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `role`, `age`, `username`, `password`, `enabled`, `picture`, `biography`) VALUES (3, 'Tommy', 'Banana', 'tommy.nana@mentor.mail', 'MENTOR', 29, 'tommybanana', 'tommybanana', 1, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `role`, `age`, `username`, `password`, `enabled`, `picture`, `biography`) VALUES (4, 'Dude', 'Practice', 'dude.practice@user.mail', 'STANDARD', 20, 'dude', 'dude', 0, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `role`, `age`, `username`, `password`, `enabled`, `picture`, `biography`) VALUES (5, 'Dudette', 'Anotherpractice', 'Dudette@user.mail', 'STANDARD', 23, 'dudette', 'dudette', 0, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `morebetterdb`;
INSERT INTO `category` (`id`, `name`, `logo`, `description`) VALUES (1, 'Finance', NULL, 'Take action and make your financial goals a reality.');
INSERT INTO `category` (`id`, `name`, `logo`, `description`) VALUES (2, 'Mental Health', NULL, 'Healing takes time, and asking for help is a courageous step');
INSERT INTO `category` (`id`, `name`, `logo`, `description`) VALUES (3, 'Fitness', NULL, 'All progress takes place outside the comfort zone');

COMMIT;


-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `morebetterdb`;
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (1, NULL, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `event`
-- -----------------------------------------------------
START TRANSACTION;
USE `morebetterdb`;
INSERT INTO `event` (`id`, `category_id`, `mentor_id`, `address_id`, `title`, `description`, `location`, `event_date`, `max_capacity`, `price`, `created_at`, `last_updated`) VALUES (1, 1, 1, 1, 'Why financial literacy matters', 'Financial literacy cannot predict or remedy a crisis, but financial education will play a pivotal role in the economic recovery of our country.', NULL, NULL, NULL, 0.00, NULL, NULL);
INSERT INTO `event` (`id`, `category_id`, `mentor_id`, `address_id`, `title`, `description`, `location`, `event_date`, `max_capacity`, `price`, `created_at`, `last_updated`) VALUES (2, 1, 1, NULL, 'How to Finance Condos and Townhomes - Joe Massey', 'We get a lot of questions about condo financing and often hear people who think that you cannot purchase a condo unless you pay cash for the property. This could not be further from the truth and this class will focus on clearing up the rumors and misconceptions of condo financing.', '2755 South Locust Street\n#Suite #150\nDenver, CO 80222', '2020-08-19 01:00:00', 50, 0.00, '2020-05-24 10:20:58', NULL);
INSERT INTO `event` (`id`, `category_id`, `mentor_id`, `address_id`, `title`, `description`, `location`, `event_date`, `max_capacity`, `price`, `created_at`, `last_updated`) VALUES (3, 1, 1, NULL, 'Denver Digital Marketing Conference', 'Whatever your goal is; reinforcing customer loyalty, improving lead generation, increasing sales, or driving stronger consumer engagement, the Denver Digital Marketing Conference’s line up has been specifically designed to help you develop your audience and enhance your marketing efforts to meet up with current realities.', 'Online: Live', '2020-07-16 10:00:00', NULL, 0.00, '2020-04-10 11:30:58', NULL);
INSERT INTO `event` (`id`, `category_id`, `mentor_id`, `address_id`, `title`, `description`, `location`, `event_date`, `max_capacity`, `price`, `created_at`, `last_updated`) VALUES (4, 1, 1, NULL, 'The 2020 GlobalMindED Conference', 'GlobalMindED is a 501(c)(3) innovation network that closes the equity gap through education, entrepreneurship, employment and economic mobility to create a capable, diverse talent pipeline.', '1550 Court Place \nDenver, CO 80202', '2020-06-06 17:00:00', NULL, 43.30, '2020-03-11 08:40:58', NULL);
INSERT INTO `event` (`id`, `category_id`, `mentor_id`, `address_id`, `title`, `description`, `location`, `event_date`, `max_capacity`, `price`, `created_at`, `last_updated`) VALUES (5, 1, 1, NULL, 'The Road to Financial Freedom event', 'There are opportunities to expand your professional network by plugging into our community which includes Attorneys, Realestate Brokers, Private Money Lenders, Credit companies, Mortgage Brokers, Insurance Brokers, Construction workers, CPA\'s and more. It\'s a place where you can network with thousands of people nationwide.', 'Online: Live', '2020-05-30 08:00:00', NULL, 0.00, '2020-04-16 08:50:58', NULL);
INSERT INTO `event` (`id`, `category_id`, `mentor_id`, `address_id`, `title`, `description`, `location`, `event_date`, `max_capacity`, `price`, `created_at`, `last_updated`) VALUES (6, 2, 2, NULL, 'Mental Health First Aid Class (Youth Focused)', 'This is an 8 hour class with certification in Mental Health First Aid at the end. This class is for 18 years and older. ', '6380 S Parker Rd\n6380 South Parker Road\nAurora, CO 80016', '2020-07-27 08:30:00', 100, 0.00, '2020-05-16 09:50:58', NULL);
INSERT INTO `event` (`id`, `category_id`, `mentor_id`, `address_id`, `title`, `description`, `location`, `event_date`, `max_capacity`, `price`, `created_at`, `last_updated`) VALUES (7, 2, 2, NULL, 'Childhood & Family Trauma and Issues With Attachment', 'We will explore the symptoms of trauma, information on forming healthy family attachments, and available resources in the community.', 'Jefferson Center\n4851 Independence Street\nClear Creek Conference Room\nWheat Ridge, CO 80033', '2020-11-04 07:30:00', 100, 0.00, '2020-04-11 09:50:58', NULL);
INSERT INTO `event` (`id`, `category_id`, `mentor_id`, `address_id`, `title`, `description`, `location`, `event_date`, `max_capacity`, `price`, `created_at`, `last_updated`) VALUES (8, 2, 2, NULL, 'Set Boundaries with Compassion and Love', 'Learn simple tools to set energetic boundaries, release fear and anger, and not take on other people’s moods while healing transgenerational codependency. Focus on your own feelings and needs- while having empathy for others, including those in recovery or struggling with addiction.', 'Classroom @ Tekla C. Ayers, Luz de la Luna\n1300 Plaza Court North Suite 202\nLafayette, CO 80026', '2020-12-06 11:30:00', NULL, 150.00, '2020-01-10 09:50:58', NULL);
INSERT INTO `event` (`id`, `category_id`, `mentor_id`, `address_id`, `title`, `description`, `location`, `event_date`, `max_capacity`, `price`, `created_at`, `last_updated`) VALUES (9, 2, 2, NULL, 'Power Vinyasa and Pints with Shaylah', 'This 60-minute class will focus on traditional power Vinyasa—a sequence of energetic and challenging postures. Students will move fluidly from one pose to the next while connecting breath to movement. It incorporates strength, flexibility, mobility, balance, and mental stamina.', 'Oasis Brewing Co.\n3257 Lowell Boulevard\nDenver, CO 80211', '2020-08-10 09:30:00', 25, 12.00, '2020-05-16 09:50:58', NULL);
INSERT INTO `event` (`id`, `category_id`, `mentor_id`, `address_id`, `title`, `description`, `location`, `event_date`, `max_capacity`, `price`, `created_at`, `last_updated`) VALUES (19, 2, 2, NULL, 'Winning Wellness Workshop', 'Imagine yourself having clarity, focus and feeling empowered to navigate and be in flow with life, more positively, mindfully and resiliently!\nFeel the power of choice with these tools in this afternoon workshop developed with you in mind.', '1245 Champa Street \nConference Room 2 \nDenver, CO 80204', '2021-01-27 09:30:00', 30, 2.95, '2020-04-10 11:30:58', NULL);
INSERT INTO `event` (`id`, `category_id`, `mentor_id`, `address_id`, `title`, `description`, `location`, `event_date`, `max_capacity`, `price`, `created_at`, `last_updated`) VALUES (20, 3, 3, NULL, '2020 Dog Days of Summer Half Marathon', 'Come on out and join the fun for the Dog Days of Summer 1 Mile, 5K, 10K, 10 Mile, Half Marathon & Doubles!! The heat is on, but with autumn right around the corner, what better way to keep yourself and the pooch in shape and get ready for the fall marathon season in Colorado?!', 'Central Park\n8801 Martin Luther King Junior Boulevard\nDenver, CO 80238', '2020-08-16 07:00:00', NULL, 0.00, '2020-05-16 09:50:58', NULL);
INSERT INTO `event` (`id`, `category_id`, `mentor_id`, `address_id`, `title`, `description`, `location`, `event_date`, `max_capacity`, `price`, `created_at`, `last_updated`) VALUES (21, 3, 3, NULL, 'Fit & Rock X The Barre Code', 'Lengthen and strengthen your muscles during this 50 minute full body workout! Work through dynamic full range movements , alongside targeted isometrics to really feel the shake and burn! Round out the total body experience with a mindful, deep stretch that will leave you feeling accomplished centered!', 'Dairy Block\n1800 Wazee Street\nDenver, CO 80202', '2020-08-16 17:30:00', 45, 0.00, '2020-04-10 11:30:58', NULL);
INSERT INTO `event` (`id`, `category_id`, `mentor_id`, `address_id`, `title`, `description`, `location`, `event_date`, `max_capacity`, `price`, `created_at`, `last_updated`) VALUES (22, 3, 3, NULL, 'Scramblin\' Scrooge 1M/5K/10K & Youth Fun Run ', 'This event is the 2nd event of the City Park Winter Running Series. It is held on a certified course, professionally timed, with results posted at the event and online.', 'City Park, Denver\n3001 E 17th Ave\nDenver, CO 80205', '2020-12-12 08:00:00', NULL, 0.00, '2020-04-11 09:50:58', NULL);
INSERT INTO `event` (`id`, `category_id`, `mentor_id`, `address_id`, `title`, `description`, `location`, `event_date`, `max_capacity`, `price`, `created_at`, `last_updated`) VALUES (23, 3, 3, NULL, 'Free All-Levels CrossFit Class', 'Every Saturday at 10am, we offer a free, all-levels workout for anyone interested in trying CrossFit! No previous experience necessary. Just come on in - we can\'t wait to meet you!', 'CrossFit DeCO\n923 West 9th Avenue\nDenver, CO 80204', '2020-07-07 08:00:00', 20, 0.00, '2020-05-16 09:50:58', NULL);
INSERT INTO `event` (`id`, `category_id`, `mentor_id`, `address_id`, `title`, `description`, `location`, `event_date`, `max_capacity`, `price`, `created_at`, `last_updated`) VALUES (24, 3, 3, NULL, '7th Annual bRUNch Run', 'Start your morning off on the right (or left) foot with a timed 5k or 10k run (walk, skip or stroll) at Stapleton Central Park followed by an epic post-run sweat celebration complete with tasty brunch fare, libations and of course a whole lotta fun!', 'Stapleton Central Park\n8801 Martin Luther King Junior Boulevard\nDenver, CO 80238', '2020-10-11 09:00:00', 0, 0, '2020-05-16 09:50:58', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `event_participant`
-- -----------------------------------------------------
START TRANSACTION;
USE `morebetterdb`;
INSERT INTO `event_participant` (`user_id`, `event_id`, `rating`, `rating_comment`) VALUES (1, 1, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `article`
-- -----------------------------------------------------
START TRANSACTION;
USE `morebetterdb`;
INSERT INTO `article` (`id`, `category_id`, `mentor_id`, `title`, `contents`, `created`, `reference`) VALUES (1, 1, 1, 'Do you have a long-term plan ', 'Despite the recent recovery in the market, stocks remain down by more than 12% from the February peak, and about 9% year-to-date. Meanwhile, the story for the first three weeks of May has been one of running in place.', '2020-04-10 10:25:30', '');
INSERT INTO `article` (`id`, `category_id`, `mentor_id`, `title`, `contents`, `created`, `reference`) VALUES (2, 1, 1, 'Don\'t Overlook These 14 Good Habits For Financial Health', 'Most people don’t think twice about the investment options that the custodian of their retirement account makes available to them. But most custodians limit the selection of assets to a mix of stocks, bonds and mutual funds. To truly diversify your retirement, consider a self-directed IRA and the many alternative assets that it can offer.', '2019-09-11 08:25:30', 'https://www.forbes.com/sites/forbesfinancecouncil/2020/03/26/dont-overlook-these-14-good-habits-for-financial-health/#226bae01329c');
INSERT INTO `article` (`id`, `category_id`, `mentor_id`, `title`, `contents`, `created`, `reference`) VALUES (3, 1, 1, 'Only 29% of Americans are financially ‘healthy\' ', 'The U.S. Financial Health Pulse 2019 Trends Report asked Americans about four buckets of financial health — saving, spending, borrowing and planning.', '2019-11-15 08:30:30', 'https://www.cnbc.com/2019/11/15/29-percent-of-americans-are-financially-healthy.html');
INSERT INTO `article` (`id`, `category_id`, `mentor_id`, `title`, `contents`, `created`, `reference`) VALUES (4, 1, 1, '5 Simple Steps To Evaluate Your Financial Health', 'Doing a financial wellness check, can help you determine what adjustments you need to make in your life.', '2020-05-22 09:30:30', 'https://www.moneyunder30.com/simple-steps-to-evaluating-your-financial-health');
INSERT INTO `article` (`id`, `category_id`, `mentor_id`, `title`, `contents`, `created`, `reference`) VALUES (5, 1, 1, 'Wealthy Americans Say Financial Worries Hurt Their Mental Health', 'Financial awareness is rising among young people because of social media, and that can make them savvier about money matters -- and more stressed out.', '2019-07-14 07:30:30', 'https://www.bloomberg.com/news/articles/2019-06-14/wealthy-americans-say-financial-worries-hurt-their-mental-health');
INSERT INTO `article` (`id`, `category_id`, `mentor_id`, `title`, `contents`, `created`, `reference`) VALUES (6, 2, 2, 'Mental Health Issues Increased Significantly in Young Adults Over Last Decade', 'Cultural trends in the last 10 years may have had a larger effect on mood disorders and suicide-related outcomes among younger generations compared with older generations.', '2019-03-14 09:42:30', 'https://www.apa.org/news/press/releases/2019/03/mental-health-adults');
INSERT INTO `article` (`id`, `category_id`, `mentor_id`, `title`, `contents`, `created`, `reference`) VALUES (7, 2, 2, 'Social Media and Adolescents’ and Young Adults’ Mental Health', 'Social media has become immensely popular, and in recent years mental disorders among young adults has become more common. That doesn’t mean they are related, but the numbers are staggering and deserve attention.', '2020-01-10 09:15:30', 'http://www.center4research.org/social-media-affects-mental-health/');
INSERT INTO `article` (`id`, `category_id`, `mentor_id`, `title`, `contents`, `created`, `reference`) VALUES (8, 2, 2, 'Why stress happens and how to manage it', 'Stress is the body’s natural defense against predators and danger. It causes the body to flood with hormones that prepare its systems to evade or confront danger. People commonly refer to this as the fight-or-flight mechanism.', '2019-03-12 09:42:30', 'https://www.medicalnewstoday.com/articles/145855');
INSERT INTO `article` (`id`, `category_id`, `mentor_id`, `title`, `contents`, `created`, `reference`) VALUES (9, 2, 2, 'Exercise for Mental Health', 'In this era of exponential growth of the “metabolic syndrome” and obesity, lifestyle modifications could be a cost-effective way to improve health and quality of life. Lifestyle modifications can assume especially great importance in individuals with serious mental illness. ', '2019-11-10 09:15:30', 'https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1470658/');
INSERT INTO `article` (`id`, `category_id`, `mentor_id`, `title`, `contents`, `created`, `reference`) VALUES (10, 2, 2, 'How to look after your mental health', 'Talking about your feelings can help you stay in good mental health and deal with times when you feel troubled.', '2020-04-12 09:50:30', 'https://www.mentalhealth.org.uk/publications/how-to-mental-health');
INSERT INTO `article` (`id`, `category_id`, `mentor_id`, `title`, `contents`, `created`, `reference`) VALUES (11, 3, 3, 'Yoga May Be Good for the Brain', 'Some weakening in mental function appears to be inevitable as we age. But emerging science suggests that we might be able to slow and mitigate the decline by how we live and, in particular, whether and how we move our bodies.', '2020-04-22 08:34:30', 'https://well.blogs.nytimes.com/2016/06/01/yoga-may-be-good-for-the-brain/');
INSERT INTO `article` (`id`, `category_id`, `mentor_id`, `title`, `contents`, `created`, `reference`) VALUES (12, 3, 3, 'THE COLD, HARD TRUTH ABOUT CRYOTHERAPY', 'Cryotherapy – no it’s not having a counsellor handy when you drop a weight on your foot in the gym and blubber like a little girl. Basically it’s freezing your ass off standing in a tank of very cold gas for a few minutes. ', '2019-03-15 10:52:30', 'https://personaltrainers.london/best-articles-health-fitness/cold-hard-truth-cryotherapy/');
INSERT INTO `article` (`id`, `category_id`, `mentor_id`, `title`, `contents`, `created`, `reference`) VALUES (13, 3, 3, 'THE JAPANESE PRACTICE OF ‘FOREST BATHING’ IS SCIENTIFICALLY PROVEN TO IMPROVE YOUR HEALTH', 'Are you a tree-hugger or a city slicker who thinks nature is dirty and smelly and best avoided? If the former – congratulations, we have some good news for you, you old hippie! If the latter – get back to the woods and chill out man!', '2020-01-18 08:15:30', 'https://personaltrainers.london/best-articles-health-fitness/japanese-practice-forest-bathing-scientifically-proven-improve-health/');
INSERT INTO `article` (`id`, `category_id`, `mentor_id`, `title`, `contents`, `created`, `reference`) VALUES (14, 3, 3, 'Do You Have a Body Image Disorder?', 'Somewhere out there are bodybuilders (or models, or Hollywood stars) who keep a healthy perspective about their bodies. But when body perfection pervades the culture, it’s really hard—and potentially even isolating—to stand apart.', '2018-01-20 08:15:30', 'https://www.quickanddirtytips.com/health-fitness/mental-health/do-you-have-a-body-image-disorder');
INSERT INTO `article` (`id`, `category_id`, `mentor_id`, `title`, `contents`, `created`, `reference`) VALUES (15, 3, 3, 'Find a Workout Buddy for Your “Sole” Mate', 'Any bodybuilder knows that a spotter is necessary for safety when lifting heavy weights. A smart and knowledgeable buddy can also correct your form, give you valuable tips, and push you to your limits. No matter what the sport, a training partner can be valuable.', '2020-07-14 07:50:30', 'http://bodimojo.mobilereadygroup.com/workout_buddy');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mentor_category`
-- -----------------------------------------------------
START TRANSACTION;
USE `morebetterdb`;
INSERT INTO `mentor_category` (`user_id`, `category_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `article_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `morebetterdb`;
INSERT INTO `article_comment` (`id`, `user_id`, `article_id`, `content`, `created_at`) VALUES (1, 1, 1, 'Great article', '2020-05-22 11:58:30');

COMMIT;
