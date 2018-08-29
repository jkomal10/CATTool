create database CATToolApp;

use CATToolApp;

CREATE TABLE `languages` (
	`languageId` int(11) NOT NULL AUTO_INCREMENT,
	`language` varchar(100) DEFAULT NULL,
	PRIMARY KEY (`languageId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `roles` (
	`roleId` int(11) NOT NULL AUTO_INCREMENT,
	`roleName` varchar(100) DEFAULT NULL,
	PRIMARY KEY (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `users` (
  `userId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userName` varchar(100) NOT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `ipAddress` varchar(45) NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `isDeleted` int(11) DEFAULT 0,
  `parentUserId` int unique DEFAULT NULL,
  `languageId` int not null references languages(languageId) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `applications` (
  `applicationId` int(11) NOT NULL AUTO_INCREMENT,
  `applicationName` varchar(255) NOT NULL DEFAULT '0',
  `applicationDescription` text NOT NULL,
  `isCloudable` varchar(50) DEFAULT NULL,
  `isMigration` varchar(100) DEFAULT NULL,
  `appCloudProvider` varchar(100) DEFAULT NULL,
  `isAssessment` int(11) DEFAULT '0',
  `isFinalise` int(11) DEFAULT '0',
  `isDeleted` int(11) NOT NULL DEFAULT '0',
  `deletedDateTime` datetime DEFAULT NULL,
  `userId` int not null references users(userId),
  `parentUserId` int not null references users(parentUserId) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (`applicationId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;



CREATE TABLE IF NOT EXISTS `assessmentQuestions` (
  `questionId` int(11) NOT NULL AUTO_INCREMENT,
  `questionTextEnglish` text NOT NULL,
  `questionTextGerman` text NOT NULL,
  `questionDescription` text NOT NULL,
  `questionType` text NOT NULL,
  `questionDisplayOrder` int(11) NOT NULL,
  `numberOfOptions` int(11) NOT NULL DEFAULT '1',
  `assessmentTypeForCloudable` int DEFAULT '0',
  `assessmentTypeForMigration` int DEFAULT '0',
  `assessmentTypeForCloudProvider` int DEFAULT '0',
  PRIMARY KEY (`questionId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
  
  
CREATE TABLE IF NOT EXISTS `cloudableRules` (
  `cloudableRuleId` int(11) NOT NULL AUTO_INCREMENT,
  `cloudableRule` text NOT NULL,
  `executionOrder` int(11) NOT NULL,
  `questionId` int(11) NOT NULL references assessmentQuestions(questionId) ON DELETE CASCADE ON UPDATE CASCADE,
   PRIMARY KEY (`cloudableRuleId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

  
CREATE TABLE IF NOT EXISTS `migration` (
  `migrationId` int(11) NOT NULL AUTO_INCREMENT,
  `migrationPattern` text NOT NULL,
  `evaluationOrder` int(11) NOT NULL,
   PRIMARY KEY (`migrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `migrationRules` (
  `migrationRuleId` int(11) NOT NULL AUTO_INCREMENT,
  `migrationRule` text NOT NULL,
  `executionOrder` int(11) NOT NULL,
  `migrationId` int(11) NOT NULL references migration(migrationId), 
  `questionId` int(11) NOT NULL references assessmentQuestions(questionId) ON DELETE CASCADE ON UPDATE CASCADE,
   PRIMARY KEY (`migrationRuleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `cloudProviders` (
  `cloudProviderId` int(11) NOT NULL AUTO_INCREMENT,
  `cloudProviderName` text NOT NULL,
  `evaluationOrder` int(11) NOT NULL,
   PRIMARY KEY (`migrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `cloudProviderRules` (
  `cloudProviderRuleId` int(11) NOT NULL AUTO_INCREMENT,
  `cloudProviderRule` text NOT NULL,
  `executionOrder` int(11) NOT NULL,
  `cloudProviderId` int(11) NOT NULL references cloudProviders(cloudProviderId) ON DELETE CASCADE ON UPDATE CASCADE, 
  `questionId` int(11) NOT NULL references assessmentQuestions(questionId) ON DELETE CASCADE ON UPDATE CASCADE,
   PRIMARY KEY (`cloudProviderRuleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE IF NOT EXISTS `oprions`(
`optionId` int NOT NULL AUTO_INCREMENT,
`optionTextEnglish` text DEFAULT NULL,
`optionTextGerman`text DEFAULT NULL,
`questionId` int NOT NULL references assessmentQuestions(questionId) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (`optionId`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF  NOT EXISTS `answers`(
`answerId` int(11) NOT NULL AUTO_INCREMENT,
`answerTextEnglish` text DEFAULT NULL,
`answerTextGerman` text DEFAULT NULL,
`cloudability` int(11) DEFAULT '0',
`questionId` int NOT NULL references assessmentQuestions(questionId) ON DELETE CASCADE ON UPDATE CASCADE,
`applicationId` int NOT NULL references applications(applicationId) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY(answerId)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `keywors`(
`keywordId` int(11) NOT NULL AUTO_INCREMENT,
`keywordTextEnglish` text DEFAULT NULL,
`keywordTextGerman` text DEFAULT NULL,
PRIMARY KEY(`keywordId`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE IF NOT EXISTS `feedback`(
feedbackId int(11) NOT NULL AUTO_INCREMENT,
`commentText` text DEFAULT NULL,
ratings int(50) DEFAULT 0,
userId int(11) NOT NULL references users(userId) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (`feedbackId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






  
  
  
  