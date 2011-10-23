-- phpMyAdmin SQL Dump
-- version 3.3.2deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 20, 2011 at 04:13 AM
-- Server version: 5.1.41
-- PHP Version: 5.3.2-1ubuntu4.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Table structure for table `AreaGroupBlockTypes`
--

CREATE TABLE IF NOT EXISTS `AreaGroupBlockTypes` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `arHandle` varchar(255) NOT NULL,
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `btID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`arHandle`,`gID`,`uID`,`btID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `AreaGroupBlockTypes`
--


-- --------------------------------------------------------

--
-- Table structure for table `AreaGroups`
--

CREATE TABLE IF NOT EXISTS `AreaGroups` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `arHandle` varchar(255) NOT NULL,
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `agPermissions` varchar(64) NOT NULL,
  PRIMARY KEY (`cID`,`arHandle`,`gID`,`uID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `AreaGroups`
--


-- --------------------------------------------------------

--
-- Table structure for table `Areas`
--

CREATE TABLE IF NOT EXISTS `Areas` (
  `arID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `arHandle` varchar(255) NOT NULL,
  `arOverrideCollectionPermissions` tinyint(1) NOT NULL DEFAULT '0',
  `arInheritPermissionsFromAreaOnCID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`arID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `Areas`
--

INSERT INTO `Areas` (`arID`, `cID`, `arHandle`, `arOverrideCollectionPermissions`, `arInheritPermissionsFromAreaOnCID`) VALUES
(1, 1, 'Header Nav', 0, 0),
(2, 1, 'Header', 0, 0),
(3, 1, 'Sidebar', 0, 0),
(4, 1, 'Main', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `AttributeKeyCategories`
--

CREATE TABLE IF NOT EXISTS `AttributeKeyCategories` (
  `akCategoryID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `akCategoryHandle` varchar(255) NOT NULL,
  `akCategoryAllowSets` smallint(4) NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`akCategoryID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `AttributeKeyCategories`
--

INSERT INTO `AttributeKeyCategories` (`akCategoryID`, `akCategoryHandle`, `akCategoryAllowSets`, `pkgID`) VALUES
(1, 'collection', 0, NULL),
(2, 'user', 0, NULL),
(3, 'file', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `AttributeKeys`
--

CREATE TABLE IF NOT EXISTS `AttributeKeys` (
  `akID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `akHandle` varchar(255) NOT NULL,
  `akName` varchar(255) NOT NULL,
  `akIsSearchable` tinyint(1) NOT NULL DEFAULT '0',
  `akIsSearchableIndexed` tinyint(1) NOT NULL DEFAULT '0',
  `akIsAutoCreated` tinyint(1) NOT NULL DEFAULT '0',
  `akIsColumnHeader` tinyint(1) NOT NULL DEFAULT '0',
  `akIsEditable` tinyint(1) NOT NULL DEFAULT '0',
  `atID` int(10) unsigned DEFAULT NULL,
  `akCategoryID` int(10) unsigned DEFAULT NULL,
  `pkgID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`akID`),
  UNIQUE KEY `akHandle` (`akHandle`,`akCategoryID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `AttributeKeys`
--

INSERT INTO `AttributeKeys` (`akID`, `akHandle`, `akName`, `akIsSearchable`, `akIsSearchableIndexed`, `akIsAutoCreated`, `akIsColumnHeader`, `akIsEditable`, `atID`, `akCategoryID`, `pkgID`) VALUES
(1, 'meta_title', 'Meta Title', 1, 0, 0, 0, 1, 1, 1, 0),
(2, 'meta_description', 'Meta Description', 1, 0, 0, 0, 1, 2, 1, 0),
(3, 'meta_keywords', 'Meta Keywords', 1, 0, 0, 0, 1, 2, 1, 0),
(4, 'exclude_nav', 'Exclude From Nav', 1, 0, 0, 0, 1, 3, 1, 0),
(5, 'exclude_page_list', 'Exclude From Page List', 1, 0, 0, 0, 1, 3, 1, 0),
(6, 'header_extra_content', 'Header Extra Content', 1, 0, 0, 0, 1, 2, 1, 0),
(7, 'exclude_search_index', 'Exclude From Search Index', 1, 0, 0, 0, 1, 3, 1, 0),
(8, 'exclude_sitemapxml', 'Exclude From sitemap.xml', 1, 0, 0, 0, 1, 3, 1, 0),
(9, 'width', 'Width', 1, 0, 1, 0, 0, 6, 3, 0),
(10, 'height', 'Height', 1, 0, 1, 0, 0, 6, 3, 0),
(11, 'tags', 'Tags', 0, 0, 0, 0, 1, 8, 1, 0),
(12, 'profile_private_messages_enabled', 'I would like to receive private messages.', 1, 0, 0, 0, 1, 3, 2, 0),
(13, 'profile_private_messages_notification_enabled', 'Send me email notifications when I receive a private message.', 1, 0, 0, 0, 1, 3, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `AttributeSetKeys`
--

CREATE TABLE IF NOT EXISTS `AttributeSetKeys` (
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `asID` int(10) unsigned NOT NULL DEFAULT '0',
  `displayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`akID`,`asID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `AttributeSetKeys`
--


-- --------------------------------------------------------

--
-- Table structure for table `AttributeSets`
--

CREATE TABLE IF NOT EXISTS `AttributeSets` (
  `asID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asName` varchar(255) DEFAULT NULL,
  `asHandle` varchar(255) NOT NULL,
  `akCategoryID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`asID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `AttributeSets`
--


-- --------------------------------------------------------

--
-- Table structure for table `AttributeTypeCategories`
--

CREATE TABLE IF NOT EXISTS `AttributeTypeCategories` (
  `atID` int(10) unsigned NOT NULL DEFAULT '0',
  `akCategoryID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`atID`,`akCategoryID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `AttributeTypeCategories`
--

INSERT INTO `AttributeTypeCategories` (`atID`, `akCategoryID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(3, 3),
(4, 1),
(4, 2),
(4, 3),
(5, 1),
(6, 1),
(6, 2),
(6, 3),
(7, 1),
(7, 3),
(8, 1),
(8, 2),
(8, 3),
(9, 2);

-- --------------------------------------------------------

--
-- Table structure for table `AttributeTypes`
--

CREATE TABLE IF NOT EXISTS `AttributeTypes` (
  `atID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `atHandle` varchar(255) NOT NULL,
  `atName` varchar(255) NOT NULL,
  `pkgID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`atID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `AttributeTypes`
--

INSERT INTO `AttributeTypes` (`atID`, `atHandle`, `atName`, `pkgID`) VALUES
(1, 'text', 'Text', 0),
(2, 'textarea', 'Text Area', 0),
(3, 'boolean', 'Checkbox', 0),
(4, 'date_time', 'Date/Time', 0),
(5, 'image_file', 'Image/File', 0),
(6, 'number', 'Number', 0),
(7, 'rating', 'Rating', 0),
(8, 'select', 'Select', 0),
(9, 'address', 'Address', 0);

-- --------------------------------------------------------

--
-- Table structure for table `AttributeValues`
--

CREATE TABLE IF NOT EXISTS `AttributeValues` (
  `avID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `akID` int(10) unsigned DEFAULT NULL,
  `avDateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uID` int(10) unsigned DEFAULT NULL,
  `atID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`avID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `AttributeValues`
--


-- --------------------------------------------------------

--
-- Table structure for table `BlockRelations`
--

CREATE TABLE IF NOT EXISTS `BlockRelations` (
  `brID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bID` int(10) unsigned NOT NULL DEFAULT '0',
  `originalBID` int(10) unsigned NOT NULL DEFAULT '0',
  `relationType` varchar(50) NOT NULL,
  PRIMARY KEY (`brID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `BlockRelations`
--


-- --------------------------------------------------------

--
-- Table structure for table `BlockTypes`
--

CREATE TABLE IF NOT EXISTS `BlockTypes` (
  `btID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `btHandle` varchar(32) NOT NULL,
  `btName` varchar(128) NOT NULL,
  `btDescription` text,
  `btActiveWhenAdded` tinyint(1) NOT NULL DEFAULT '1',
  `btCopyWhenPropagate` tinyint(1) NOT NULL DEFAULT '0',
  `btIncludeAll` tinyint(1) NOT NULL DEFAULT '0',
  `btIsInternal` tinyint(1) NOT NULL DEFAULT '0',
  `btInterfaceWidth` int(10) unsigned NOT NULL DEFAULT '400',
  `btInterfaceHeight` int(10) unsigned NOT NULL DEFAULT '400',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`btID`),
  UNIQUE KEY `btHandle` (`btHandle`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `BlockTypes`
--

INSERT INTO `BlockTypes` (`btID`, `btHandle`, `btName`, `btDescription`, `btActiveWhenAdded`, `btCopyWhenPropagate`, `btIncludeAll`, `btIsInternal`, `btInterfaceWidth`, `btInterfaceHeight`, `pkgID`) VALUES
(1, 'content', 'Content', 'HTML/WYSIWYG Editor Content.', 1, 0, 0, 0, 600, 465, 0),
(2, 'html', 'HTML', 'For adding HTML by hand.', 1, 0, 0, 0, 600, 465, 0),
(3, 'autonav', 'Auto-Nav', 'Creates navigation trees and sitemaps.', 1, 0, 0, 0, 500, 350, 0),
(4, 'external_form', 'External Form', 'Include external forms in the filesystem and place them on pages.', 1, 0, 0, 0, 300, 200, 0),
(5, 'form', 'Form', 'Build simple forms and surveys.', 1, 0, 0, 0, 420, 430, 0),
(6, 'page_list', 'Page List', 'List pages based on type, area.', 1, 0, 0, 0, 500, 350, 0),
(7, 'file', 'File', 'Link to files stored in the asset library.', 1, 0, 0, 0, 300, 250, 0),
(8, 'image', 'Image', 'Adds images and onstates from the library to pages.', 1, 0, 0, 0, 300, 440, 0),
(9, 'flash_content', 'Flash Content', 'Embeds SWF files, including flash detection.', 1, 0, 0, 0, 300, 240, 0),
(10, 'guestbook', 'Guestbook', 'Adds blog-style comments (a guestbook) to your page.', 1, 0, 1, 0, 300, 260, 0),
(11, 'slideshow', 'Slideshow', 'Display a running loop of images.', 1, 0, 0, 0, 550, 400, 0),
(12, 'search', 'Search', 'Add a search box to your site.', 1, 0, 0, 0, 400, 170, 0),
(13, 'google_map', 'Google Map', 'Enter an address and a Google Map of that location will be placed in your page.', 1, 0, 0, 0, 400, 220, 0),
(14, 'video', 'Video Player', 'Embeds uploaded video into a web page. Supports AVI, WMV, Quicktime/MPEG4 and FLV formats.', 1, 0, 0, 0, 300, 200, 0),
(15, 'rss_displayer', 'RSS Displayer', 'Fetch, parse and display the contents of an RSS or Atom feed.', 1, 0, 0, 0, 400, 170, 0),
(16, 'youtube', 'Youtube Video', 'Embeds a Youtube Video in your web page.', 1, 0, 0, 0, 400, 170, 0),
(17, 'survey', 'Survey', 'Provide a simple survey, along with results in a pie chart format.', 1, 0, 1, 0, 420, 300, 0),
(18, 'date_nav', 'Date Navigation', 'A collapsible date based navigation tree', 1, 0, 0, 0, 500, 350, 0),
(19, 'next_previous', 'Next & Previous Nav', 'Navigate through sibling pages.', 1, 0, 0, 0, 430, 300, 0),
(20, 'tags', 'Tags', 'List pages based on type, area.', 1, 0, 0, 0, 500, 350, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Blocks`
--

CREATE TABLE IF NOT EXISTS `Blocks` (
  `bID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bName` varchar(60) DEFAULT NULL,
  `bDateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `bDateModified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `bFilename` varchar(32) DEFAULT NULL,
  `bIsActive` varchar(1) NOT NULL DEFAULT '1',
  `btID` int(10) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Blocks`
--


-- --------------------------------------------------------

--
-- Table structure for table `CollectionAttributeValues`
--

CREATE TABLE IF NOT EXISTS `CollectionAttributeValues` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '0',
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `avID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`cvID`,`akID`,`avID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CollectionAttributeValues`
--


-- --------------------------------------------------------

--
-- Table structure for table `CollectionSearchIndexAttributes`
--

CREATE TABLE IF NOT EXISTS `CollectionSearchIndexAttributes` (
  `cID` int(11) unsigned NOT NULL DEFAULT '0',
  `ak_meta_title` text,
  `ak_meta_description` text,
  `ak_meta_keywords` text,
  `ak_exclude_nav` tinyint(4) DEFAULT '0',
  `ak_exclude_page_list` tinyint(4) DEFAULT '0',
  `ak_header_extra_content` text,
  `ak_exclude_search_index` tinyint(4) DEFAULT '0',
  `ak_exclude_sitemapxml` tinyint(4) DEFAULT '0',
  `ak_tags` text,
  PRIMARY KEY (`cID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CollectionSearchIndexAttributes`
--


-- --------------------------------------------------------

--
-- Table structure for table `CollectionVersionAreaLayouts`
--

CREATE TABLE IF NOT EXISTS `CollectionVersionAreaLayouts` (
  `cvalID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cID` int(10) unsigned DEFAULT '0',
  `cvID` int(10) unsigned DEFAULT '0',
  `arHandle` varchar(255) DEFAULT NULL,
  `layoutID` int(10) unsigned NOT NULL DEFAULT '0',
  `position` int(10) DEFAULT '1000',
  `areaNameNumber` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`cvalID`),
  KEY `areaLayoutsIndex` (`cID`,`cvID`,`arHandle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `CollectionVersionAreaLayouts`
--


-- --------------------------------------------------------

--
-- Table structure for table `CollectionVersionAreaStyles`
--

CREATE TABLE IF NOT EXISTS `CollectionVersionAreaStyles` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '0',
  `arHandle` varchar(255) NOT NULL,
  `csrID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`cvID`,`arHandle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CollectionVersionAreaStyles`
--


-- --------------------------------------------------------

--
-- Table structure for table `CollectionVersionBlockPermissions`
--

CREATE TABLE IF NOT EXISTS `CollectionVersionBlockPermissions` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '1',
  `bID` int(10) unsigned NOT NULL DEFAULT '0',
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `cbgPermissions` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`cID`,`cvID`,`bID`,`gID`,`uID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CollectionVersionBlockPermissions`
--


-- --------------------------------------------------------

--
-- Table structure for table `CollectionVersionBlockStyles`
--

CREATE TABLE IF NOT EXISTS `CollectionVersionBlockStyles` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '0',
  `bID` int(10) unsigned NOT NULL DEFAULT '0',
  `arHandle` varchar(255) NOT NULL,
  `csrID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`cvID`,`bID`,`arHandle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CollectionVersionBlockStyles`
--


-- --------------------------------------------------------

--
-- Table structure for table `CollectionVersionBlocks`
--

CREATE TABLE IF NOT EXISTS `CollectionVersionBlocks` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '1',
  `bID` int(10) unsigned NOT NULL DEFAULT '0',
  `arHandle` varchar(255) NOT NULL,
  `cbDisplayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  `isOriginal` varchar(1) NOT NULL DEFAULT '0',
  `cbOverrideAreaPermissions` tinyint(1) NOT NULL DEFAULT '0',
  `cbIncludeAll` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`cvID`,`bID`,`arHandle`),
  KEY `cbIncludeAll` (`cbIncludeAll`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CollectionVersionBlocks`
--


-- --------------------------------------------------------

--
-- Table structure for table `CollectionVersions`
--

CREATE TABLE IF NOT EXISTS `CollectionVersions` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '1',
  `cvName` text,
  `cvHandle` varchar(64) DEFAULT NULL,
  `cvDescription` text,
  `cvDatePublic` datetime DEFAULT NULL,
  `cvDateCreated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cvComments` varchar(255) DEFAULT NULL,
  `cvIsApproved` tinyint(1) NOT NULL DEFAULT '0',
  `cvIsNew` tinyint(1) NOT NULL DEFAULT '0',
  `cvAuthorUID` int(10) unsigned DEFAULT NULL,
  `cvApproverUID` int(10) unsigned DEFAULT NULL,
  `cvActivateDatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`cID`,`cvID`),
  KEY `cvIsApproved` (`cvIsApproved`),
  KEY `cvName` (`cvName`(128))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CollectionVersions`
--

INSERT INTO `CollectionVersions` (`cID`, `cvID`, `cvName`, `cvHandle`, `cvDescription`, `cvDatePublic`, `cvDateCreated`, `cvComments`, `cvIsApproved`, `cvIsNew`, `cvAuthorUID`, `cvApproverUID`, `cvActivateDatetime`) VALUES
(2, 1, NULL, NULL, NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(1, 2, 'Home', 'home', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'New Version 2', 1, 0, 1, 1, NULL),
(5, 1, 'Login', 'login', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(6, 1, 'Register', 'register', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(7, 1, 'Profile', 'profile', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(8, 1, 'Edit', 'edit', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(10, 1, 'Avatar', 'avatar', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(11, 1, 'Messages', 'messages', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(12, 1, 'Friends', 'friends', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(13, 1, 'Page Not Found', 'page_not_found', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(14, 1, 'Page Forbidden', 'page_forbidden', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(15, 1, 'Dashboard', 'dashboard', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(16, 1, 'Sitemap', 'sitemap', 'Whole world at a glance.', '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(17, 1, 'Full Sitemap', 'full', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(18, 1, 'Flat View', 'explore', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(19, 1, 'Page Search', 'search', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(20, 1, 'Access', 'access', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(21, 1, 'File Manager', 'files', 'All documents and images.', '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(22, 1, 'Search', 'search', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(23, 1, 'Attributes', 'attributes', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(24, 1, 'Sets', 'sets', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(25, 1, 'Access', 'access', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(26, 1, 'Reports', 'reports', 'Get data from forms and logs.', '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(27, 1, 'Form Results', 'forms', 'Get submission data.', '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(28, 1, 'Surveys', 'surveys', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(29, 1, 'Logs', 'logs', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(30, 1, 'Users and Groups', 'users', 'Add and manage people.', '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(31, 1, 'Find Users', 'search', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(32, 1, 'Add User', 'add', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(33, 1, 'Groups', 'groups', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(34, 1, 'User Attributes', 'attributes', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(35, 1, 'Login & Registration', 'registration', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(36, 1, 'Scrapbook', 'scrapbook', 'Share content across your site.', '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(37, 1, 'Pages and Themes', 'pages', 'Reskin your site.', '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(38, 1, 'Themes', 'themes', 'Reskin your site.', '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(39, 1, 'Add', 'add', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(40, 1, 'Inspect', 'inspect', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(41, 1, 'Customize', 'customize', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(43, 1, 'Page Types', 'types', 'What goes in your site.', '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(44, 1, 'Attributes', 'attributes', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(45, 1, 'Single Pages', 'single', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(46, 1, 'Add Functionality', 'install', 'Install addons & themes.', '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(47, 1, 'System & Maintenance', 'system', 'Backup, cleanup and update.', '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(48, 1, 'Jobs', 'jobs', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(49, 1, 'Backup & Restore', 'backup', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(50, 1, 'Update', 'update', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(51, 1, 'Notifications', 'notifications', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(52, 1, 'Sitewide Settings', 'settings', 'Secure and setup your site.', '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(53, 1, 'Email', 'mail', 'Enable post via email and other settings.', '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(54, 1, 'Marketplace', 'marketplace', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(55, 1, 'Download File', 'download_file', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(63, 1, NULL, 'uID=1', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, NULL, NULL, NULL),
(64, 1, 'Members', 'members', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(75, 1, 'Composer Beta', 'composer', 'Write for your site', '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(76, 1, 'Write', 'write', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(77, 1, 'Drafts', 'drafts', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(78, 1, 'Composer', 'composer', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL),
(79, 1, 'Multilingual Settings', 'multilingual', NULL, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'Initial Version', 1, 0, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Collections`
--

CREATE TABLE IF NOT EXISTS `Collections` (
  `cID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cDateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cDateModified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cHandle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cID`),
  KEY `cDateModified` (`cDateModified`),
  KEY `cDateAdded` (`cDateAdded`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=80 ;

--
-- Dumping data for table `Collections`
--

INSERT INTO `Collections` (`cID`, `cDateAdded`, `cDateModified`, `cHandle`) VALUES
(1, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'home'),
(2, '2011-08-20 04:10:35', '2011-08-20 04:10:35', NULL),
(5, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'login'),
(6, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'register'),
(7, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'profile'),
(8, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'edit'),
(10, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'avatar'),
(11, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'messages'),
(12, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'friends'),
(13, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'page_not_found'),
(14, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'page_forbidden'),
(15, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'dashboard'),
(16, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'sitemap'),
(17, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'full'),
(18, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'explore'),
(19, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'search'),
(20, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'access'),
(21, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'files'),
(22, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'search'),
(23, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'attributes'),
(24, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'sets'),
(25, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'access'),
(26, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'reports'),
(27, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'forms'),
(28, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'surveys'),
(29, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'logs'),
(30, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'users'),
(31, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'search'),
(32, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'add'),
(33, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'groups'),
(34, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'attributes'),
(35, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'registration'),
(36, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'scrapbook'),
(37, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'pages'),
(38, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'themes'),
(39, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'add'),
(40, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'inspect'),
(41, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'customize'),
(43, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'types'),
(44, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'attributes'),
(45, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'single'),
(46, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'install'),
(47, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'system'),
(48, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'jobs'),
(49, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'backup'),
(50, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'update'),
(51, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'notifications'),
(52, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'settings'),
(53, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'mail'),
(54, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'marketplace'),
(55, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'download_file'),
(63, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'uID=1'),
(64, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'members'),
(75, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'composer'),
(76, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'write'),
(77, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'drafts'),
(78, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'composer'),
(79, '2011-08-20 04:10:35', '2011-08-20 04:10:35', 'multilingual');

-- --------------------------------------------------------

--
-- Table structure for table `ComposerContentLayout`
--

CREATE TABLE IF NOT EXISTS `ComposerContentLayout` (
  `cclID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bID` int(10) unsigned NOT NULL DEFAULT '0',
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `displayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  `ctID` int(10) unsigned NOT NULL DEFAULT '0',
  `ccFilename` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`cclID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ComposerContentLayout`
--


-- --------------------------------------------------------

--
-- Table structure for table `ComposerDrafts`
--

CREATE TABLE IF NOT EXISTS `ComposerDrafts` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cpPublishParentID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ComposerDrafts`
--


-- --------------------------------------------------------

--
-- Table structure for table `ComposerTypes`
--

CREATE TABLE IF NOT EXISTS `ComposerTypes` (
  `ctID` int(10) unsigned NOT NULL DEFAULT '0',
  `ctComposerPublishPageMethod` varchar(64) NOT NULL DEFAULT 'CHOOSE',
  `ctComposerPublishPageTypeID` int(10) unsigned NOT NULL DEFAULT '0',
  `ctComposerPublishPageParentID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ctID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ComposerTypes`
--


-- --------------------------------------------------------

--
-- Table structure for table `Config`
--

CREATE TABLE IF NOT EXISTS `Config` (
  `cfKey` varchar(64) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cfValue` longtext,
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cfKey`,`uID`),
  KEY `uID` (`uID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Config`
--

INSERT INTO `Config` (`cfKey`, `timestamp`, `cfValue`, `uID`, `pkgID`) VALUES
('SITE', '2011-08-20 04:10:35', 'TKL Concrete5', 0, 0),
('SITE_APP_VERSION', '2011-08-20 04:10:35', '5.4.2', 0, 0),
('SITE_DEBUG_LEVEL', '2011-08-20 04:10:35', '1', 0, 0),
('ENABLE_LOG_EMAILS', '2011-08-20 04:10:35', '1', 0, 0),
('ENABLE_LOG_ERRORS', '2011-08-20 04:10:35', '1', 0, 0),
('FULL_PAGE_CACHE_GLOBAL', '2011-08-20 04:10:35', '0', 0, 0),
('ENABLE_MARKETPLACE_SUPPORT', '2011-08-20 04:11:18', '1', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `CustomStylePresets`
--

CREATE TABLE IF NOT EXISTS `CustomStylePresets` (
  `cspID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cspName` varchar(255) NOT NULL,
  `csrID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cspID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `CustomStylePresets`
--


-- --------------------------------------------------------

--
-- Table structure for table `CustomStyleRules`
--

CREATE TABLE IF NOT EXISTS `CustomStyleRules` (
  `csrID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `css_id` varchar(128) DEFAULT NULL,
  `css_class` varchar(128) DEFAULT NULL,
  `css_serialized` text,
  `css_custom` text,
  PRIMARY KEY (`csrID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `CustomStyleRules`
--


-- --------------------------------------------------------

--
-- Table structure for table `DashboardHomepage`
--

CREATE TABLE IF NOT EXISTS `DashboardHomepage` (
  `dbhID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dbhModule` varchar(255) NOT NULL,
  `dbhDisplayName` varchar(255) DEFAULT NULL,
  `dbhDisplayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`dbhID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `DashboardHomepage`
--

INSERT INTO `DashboardHomepage` (`dbhID`, `dbhModule`, `dbhDisplayName`, `dbhDisplayOrder`, `pkgID`) VALUES
(1, 'activity', 'Site Activity', 0, 0),
(2, 'reports', 'Statistics', 0, 0),
(3, 'help', 'Help', 0, 0),
(4, 'news', 'Latest News', 0, 0),
(5, 'notes', 'Notes', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `DownloadStatistics`
--

CREATE TABLE IF NOT EXISTS `DownloadStatistics` (
  `dsID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fID` int(10) unsigned NOT NULL,
  `fvID` int(10) unsigned NOT NULL,
  `uID` int(10) unsigned NOT NULL,
  `rcID` int(10) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`dsID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `DownloadStatistics`
--


-- --------------------------------------------------------

--
-- Table structure for table `FileAttributeValues`
--

CREATE TABLE IF NOT EXISTS `FileAttributeValues` (
  `fID` int(10) unsigned NOT NULL DEFAULT '0',
  `fvID` int(10) unsigned NOT NULL DEFAULT '0',
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `avID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fID`,`fvID`,`akID`,`avID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `FileAttributeValues`
--


-- --------------------------------------------------------

--
-- Table structure for table `FilePermissionFileTypes`
--

CREATE TABLE IF NOT EXISTS `FilePermissionFileTypes` (
  `fsID` int(10) unsigned NOT NULL DEFAULT '0',
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `extension` varchar(32) NOT NULL,
  PRIMARY KEY (`fsID`,`gID`,`uID`,`extension`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `FilePermissionFileTypes`
--


-- --------------------------------------------------------

--
-- Table structure for table `FilePermissions`
--

CREATE TABLE IF NOT EXISTS `FilePermissions` (
  `fID` int(10) unsigned NOT NULL DEFAULT '0',
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `canRead` int(4) NOT NULL DEFAULT '0',
  `canWrite` int(4) NOT NULL DEFAULT '0',
  `canAdmin` int(4) NOT NULL DEFAULT '0',
  `canSearch` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fID`,`gID`,`uID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `FilePermissions`
--


-- --------------------------------------------------------

--
-- Table structure for table `FileSearchIndexAttributes`
--

CREATE TABLE IF NOT EXISTS `FileSearchIndexAttributes` (
  `fID` int(11) unsigned NOT NULL DEFAULT '0',
  `ak_width` decimal(14,4) DEFAULT '0.0000',
  `ak_height` decimal(14,4) DEFAULT '0.0000',
  PRIMARY KEY (`fID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `FileSearchIndexAttributes`
--


-- --------------------------------------------------------

--
-- Table structure for table `FileSetFiles`
--

CREATE TABLE IF NOT EXISTS `FileSetFiles` (
  `fsfID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fID` int(10) unsigned NOT NULL,
  `fsID` int(10) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fsDisplayOrder` int(10) unsigned NOT NULL,
  PRIMARY KEY (`fsfID`),
  KEY `fID` (`fID`),
  KEY `fsID` (`fsID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `FileSetFiles`
--


-- --------------------------------------------------------

--
-- Table structure for table `FileSetPermissions`
--

CREATE TABLE IF NOT EXISTS `FileSetPermissions` (
  `fsID` int(10) unsigned NOT NULL DEFAULT '0',
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `canRead` int(4) DEFAULT NULL,
  `canWrite` int(4) DEFAULT NULL,
  `canAdmin` int(4) DEFAULT NULL,
  `canAdd` int(4) DEFAULT NULL,
  `canSearch` int(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`fsID`,`gID`,`uID`),
  KEY `canRead` (`canRead`),
  KEY `canWrite` (`canWrite`),
  KEY `canAdmin` (`canAdmin`),
  KEY `canSearch` (`canSearch`),
  KEY `canAdd` (`canAdd`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `FileSetPermissions`
--

INSERT INTO `FileSetPermissions` (`fsID`, `gID`, `uID`, `canRead`, `canWrite`, `canAdmin`, `canAdd`, `canSearch`) VALUES
(0, 1, 0, 10, 0, 0, 0, 0),
(0, 2, 0, 10, 0, 0, 0, 0),
(0, 3, 0, 10, 10, 10, 10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `FileSetSavedSearches`
--

CREATE TABLE IF NOT EXISTS `FileSetSavedSearches` (
  `fsID` int(10) unsigned NOT NULL DEFAULT '0',
  `fsSearchRequest` text,
  `fsResultColumns` text,
  PRIMARY KEY (`fsID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `FileSetSavedSearches`
--


-- --------------------------------------------------------

--
-- Table structure for table `FileSets`
--

CREATE TABLE IF NOT EXISTS `FileSets` (
  `fsID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fsName` varchar(64) NOT NULL,
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `fsType` int(4) NOT NULL,
  `fsOverrideGlobalPermissions` int(4) DEFAULT NULL,
  PRIMARY KEY (`fsID`),
  KEY `fsOverrideGlobalPermissions` (`fsOverrideGlobalPermissions`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `FileSets`
--


-- --------------------------------------------------------

--
-- Table structure for table `FileStorageLocations`
--

CREATE TABLE IF NOT EXISTS `FileStorageLocations` (
  `fslID` int(10) unsigned NOT NULL DEFAULT '0',
  `fslName` varchar(255) NOT NULL,
  `fslDirectory` varchar(255) NOT NULL,
  PRIMARY KEY (`fslID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `FileStorageLocations`
--


-- --------------------------------------------------------

--
-- Table structure for table `FileVersionLog`
--

CREATE TABLE IF NOT EXISTS `FileVersionLog` (
  `fvlID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fID` int(10) unsigned NOT NULL DEFAULT '0',
  `fvID` int(10) unsigned NOT NULL DEFAULT '0',
  `fvUpdateTypeID` int(3) unsigned NOT NULL DEFAULT '0',
  `fvUpdateTypeAttributeID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fvlID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `FileVersionLog`
--


-- --------------------------------------------------------

--
-- Table structure for table `FileVersions`
--

CREATE TABLE IF NOT EXISTS `FileVersions` (
  `fID` int(10) unsigned NOT NULL DEFAULT '0',
  `fvID` int(10) unsigned NOT NULL DEFAULT '0',
  `fvFilename` varchar(255) NOT NULL,
  `fvPrefix` varchar(12) DEFAULT NULL,
  `fvGenericType` int(3) unsigned NOT NULL DEFAULT '0',
  `fvSize` int(20) unsigned NOT NULL DEFAULT '0',
  `fvTitle` varchar(255) DEFAULT NULL,
  `fvDescription` text,
  `fvTags` varchar(255) DEFAULT NULL,
  `fvIsApproved` int(10) unsigned NOT NULL DEFAULT '1',
  `fvDateAdded` datetime DEFAULT NULL,
  `fvApproverUID` int(10) unsigned NOT NULL DEFAULT '0',
  `fvAuthorUID` int(10) unsigned NOT NULL DEFAULT '0',
  `fvActivateDatetime` datetime DEFAULT NULL,
  `fvHasThumbnail1` int(1) NOT NULL DEFAULT '0',
  `fvHasThumbnail2` int(1) NOT NULL DEFAULT '0',
  `fvHasThumbnail3` int(1) NOT NULL DEFAULT '0',
  `fvExtension` varchar(32) DEFAULT NULL,
  `fvType` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fID`,`fvID`),
  KEY `fvExtension` (`fvType`),
  KEY `fvTitle` (`fvTitle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `FileVersions`
--


-- --------------------------------------------------------

--
-- Table structure for table `Files`
--

CREATE TABLE IF NOT EXISTS `Files` (
  `fID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fDateAdded` datetime DEFAULT NULL,
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `fslID` int(10) unsigned NOT NULL DEFAULT '0',
  `ocID` int(10) unsigned NOT NULL DEFAULT '0',
  `fOverrideSetPermissions` int(1) NOT NULL DEFAULT '0',
  `fPassword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`fID`,`uID`,`fslID`),
  KEY `fOverrideSetPermissions` (`fOverrideSetPermissions`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Files`
--


-- --------------------------------------------------------

--
-- Table structure for table `Groups`
--

CREATE TABLE IF NOT EXISTS `Groups` (
  `gID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gName` varchar(128) NOT NULL,
  `gDescription` varchar(255) NOT NULL,
  `gUserExpirationIsEnabled` int(1) NOT NULL DEFAULT '0',
  `gUserExpirationMethod` varchar(12) DEFAULT NULL,
  `gUserExpirationSetDateTime` datetime DEFAULT NULL,
  `gUserExpirationInterval` int(10) unsigned NOT NULL DEFAULT '0',
  `gUserExpirationAction` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`gID`),
  UNIQUE KEY `gName` (`gName`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `Groups`
--

INSERT INTO `Groups` (`gID`, `gName`, `gDescription`, `gUserExpirationIsEnabled`, `gUserExpirationMethod`, `gUserExpirationSetDateTime`, `gUserExpirationInterval`, `gUserExpirationAction`) VALUES
(1, 'Guest', 'The guest group represents unregistered visitors to your site.', 0, NULL, NULL, 0, NULL),
(2, 'Registered Users', 'The registered users group represents all user accounts.', 0, NULL, NULL, 0, NULL),
(3, 'Administrators', '', 0, NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Jobs`
--

CREATE TABLE IF NOT EXISTS `Jobs` (
  `jID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jName` varchar(100) NOT NULL,
  `jDescription` varchar(255) NOT NULL,
  `jDateInstalled` datetime DEFAULT NULL,
  `jDateLastRun` datetime DEFAULT NULL,
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  `jLastStatusText` varchar(255) DEFAULT NULL,
  `jLastStatusCode` smallint(4) NOT NULL DEFAULT '0',
  `jStatus` varchar(14) NOT NULL DEFAULT 'ENABLED',
  `jHandle` varchar(255) NOT NULL,
  `jNotUninstallable` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`jID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `Jobs`
--

INSERT INTO `Jobs` (`jID`, `jName`, `jDescription`, `jDateInstalled`, `jDateLastRun`, `pkgID`, `jLastStatusText`, `jLastStatusCode`, `jStatus`, `jHandle`, `jNotUninstallable`) VALUES
(1, 'Index Search Engine', 'Index the site to allow searching to work quickly and accurately.', '2011-08-20 04:10:35', '2011-08-20 04:10:35', 0, 'Index updated. 6 pages required reindexing.', 0, 'ENABLED', 'index_search', 1),
(2, 'Generate Sitemap File', 'Generate the sitemap.xml file that search engines use to crawl your site.', '2011-08-20 04:10:35', '2011-08-20 04:10:35', 0, 'Sitemap XML File Saved.', 0, 'ENABLED', 'generate_sitemap', 0),
(3, 'Process Email Posts', 'Polls an email account and grabs private messages/postings that are sent there..', '2011-08-20 04:10:35', '2011-08-20 04:10:35', 0, 'The Job was run successfully.', 0, 'ENABLED', 'process_email', 0);

-- --------------------------------------------------------

--
-- Table structure for table `JobsLog`
--

CREATE TABLE IF NOT EXISTS `JobsLog` (
  `jlID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jID` int(10) unsigned NOT NULL,
  `jlMessage` varchar(255) NOT NULL,
  `jlTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `jlError` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`jlID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `JobsLog`
--

INSERT INTO `JobsLog` (`jlID`, `jID`, `jlMessage`, `jlTimestamp`, `jlError`) VALUES
(1, 0, 'Index updated. 6 pages required reindexing.', '2011-08-20 04:10:35', 0),
(2, 0, 'Sitemap XML File Saved.', '2011-08-20 04:10:35', 0),
(3, 0, 'The Job was run successfully.', '2011-08-20 04:10:35', 0);

-- --------------------------------------------------------

--
-- Table structure for table `LayoutPresets`
--

CREATE TABLE IF NOT EXISTS `LayoutPresets` (
  `lpID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lpName` varchar(128) NOT NULL,
  `layoutID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lpID`),
  UNIQUE KEY `layoutID` (`layoutID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `LayoutPresets`
--


-- --------------------------------------------------------

--
-- Table structure for table `Layouts`
--

CREATE TABLE IF NOT EXISTS `Layouts` (
  `layoutID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `layout_rows` int(5) NOT NULL DEFAULT '3',
  `layout_columns` int(3) NOT NULL DEFAULT '3',
  `spacing` int(3) NOT NULL DEFAULT '3',
  `breakpoints` varchar(255) NOT NULL DEFAULT '',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`layoutID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Layouts`
--


-- --------------------------------------------------------

--
-- Table structure for table `Logs`
--

CREATE TABLE IF NOT EXISTS `Logs` (
  `logID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `logType` varchar(64) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `logText` longtext,
  `logIsInternal` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`logID`),
  KEY `logType` (`logType`),
  KEY `logIsInternal` (`logIsInternal`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Logs`
--


-- --------------------------------------------------------

--
-- Table structure for table `MailImporters`
--

CREATE TABLE IF NOT EXISTS `MailImporters` (
  `miID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `miHandle` varchar(64) NOT NULL,
  `miServer` varchar(255) DEFAULT NULL,
  `miUsername` varchar(255) DEFAULT NULL,
  `miPassword` varchar(255) DEFAULT NULL,
  `miEncryption` varchar(32) DEFAULT NULL,
  `miIsEnabled` int(1) NOT NULL DEFAULT '0',
  `miEmail` varchar(255) DEFAULT NULL,
  `miPort` int(10) unsigned NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`miID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `MailImporters`
--

INSERT INTO `MailImporters` (`miID`, `miHandle`, `miServer`, `miUsername`, `miPassword`, `miEncryption`, `miIsEnabled`, `miEmail`, `miPort`, `pkgID`) VALUES
(1, 'private_message', NULL, NULL, NULL, NULL, 0, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `MailValidationHashes`
--

CREATE TABLE IF NOT EXISTS `MailValidationHashes` (
  `mvhID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `miID` int(10) unsigned NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL,
  `mHash` varchar(128) NOT NULL,
  `mDateGenerated` int(10) unsigned NOT NULL DEFAULT '0',
  `mDateRedeemed` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text,
  PRIMARY KEY (`mvhID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `MailValidationHashes`
--


-- --------------------------------------------------------

--
-- Table structure for table `Packages`
--

CREATE TABLE IF NOT EXISTS `Packages` (
  `pkgID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pkgName` varchar(255) NOT NULL,
  `pkgHandle` varchar(64) NOT NULL,
  `pkgDescription` text,
  `pkgDateInstalled` datetime NOT NULL,
  `pkgIsInstalled` tinyint(1) NOT NULL DEFAULT '1',
  `pkgVersion` varchar(32) DEFAULT NULL,
  `pkgAvailableVersion` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`pkgID`),
  UNIQUE KEY `pkgHandle` (`pkgHandle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Packages`
--


-- --------------------------------------------------------

--
-- Table structure for table `PagePaths`
--

CREATE TABLE IF NOT EXISTS `PagePaths` (
  `ppID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cID` int(10) unsigned DEFAULT '0',
  `cPath` text,
  `ppIsCanonical` varchar(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ppID`),
  KEY `cID` (`cID`),
  KEY `ppIsCanonical` (`ppIsCanonical`),
  KEY `cPath` (`cPath`(128))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=74 ;

--
-- Dumping data for table `PagePaths`
--

INSERT INTO `PagePaths` (`ppID`, `cID`, `cPath`, `ppIsCanonical`) VALUES
(1, 5, '/login', '1'),
(2, 6, '/register', '1'),
(3, 7, '/profile', '1'),
(4, 8, '/profile/edit', '1'),
(6, 10, '/profile/avatar', '1'),
(7, 11, '/profile/messages', '1'),
(8, 12, '/profile/friends', '1'),
(9, 13, '/page_not_found', '1'),
(10, 14, '/page_forbidden', '1'),
(11, 15, '/dashboard', '1'),
(12, 16, '/dashboard/sitemap', '1'),
(13, 17, '/dashboard/sitemap/full', '1'),
(14, 18, '/dashboard/sitemap/explore', '1'),
(15, 19, '/dashboard/sitemap/search', '1'),
(16, 20, '/dashboard/sitemap/access', '1'),
(17, 21, '/dashboard/files', '1'),
(18, 22, '/dashboard/files/search', '1'),
(19, 23, '/dashboard/files/attributes', '1'),
(20, 24, '/dashboard/files/sets', '1'),
(21, 25, '/dashboard/files/access', '1'),
(22, 26, '/dashboard/reports', '1'),
(23, 27, '/dashboard/reports/forms', '1'),
(24, 28, '/dashboard/reports/surveys', '1'),
(25, 29, '/dashboard/reports/logs', '1'),
(26, 30, '/dashboard/users', '1'),
(27, 31, '/dashboard/users/search', '1'),
(28, 32, '/dashboard/users/add', '1'),
(29, 33, '/dashboard/users/groups', '1'),
(30, 34, '/dashboard/users/attributes', '1'),
(31, 35, '/dashboard/users/registration', '1'),
(32, 36, '/dashboard/scrapbook', '1'),
(33, 37, '/dashboard/pages', '1'),
(34, 38, '/dashboard/pages/themes', '1'),
(35, 39, '/dashboard/pages/themes/add', '1'),
(36, 40, '/dashboard/pages/themes/inspect', '1'),
(37, 41, '/dashboard/pages/themes/customize', '1'),
(39, 43, '/dashboard/pages/types', '1'),
(40, 44, '/dashboard/pages/attributes', '1'),
(41, 45, '/dashboard/pages/single', '1'),
(42, 46, '/dashboard/install', '1'),
(43, 47, '/dashboard/system', '1'),
(44, 48, '/dashboard/system/jobs', '1'),
(45, 49, '/dashboard/system/backup', '1'),
(46, 50, '/dashboard/system/update', '1'),
(47, 51, '/dashboard/system/notifications', '1'),
(48, 52, '/dashboard/settings', '1'),
(49, 53, '/dashboard/settings/mail', '1'),
(50, 54, '/dashboard/settings/marketplace', '1'),
(51, 55, '/download_file', '1'),
(52, 64, '/members', '1'),
(69, 75, '/dashboard/composer', '1'),
(70, 76, '/dashboard/composer/write', '1'),
(71, 77, '/dashboard/composer/drafts', '1'),
(72, 78, '/dashboard/pages/types/composer', '1'),
(73, 79, '/dashboard/settings/multilingual', '1');

-- --------------------------------------------------------

--
-- Table structure for table `PagePermissionPageTypes`
--

CREATE TABLE IF NOT EXISTS `PagePermissionPageTypes` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `ctID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`gID`,`uID`,`ctID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PagePermissionPageTypes`
--


-- --------------------------------------------------------

--
-- Table structure for table `PagePermissions`
--

CREATE TABLE IF NOT EXISTS `PagePermissions` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `cgPermissions` varchar(32) DEFAULT NULL,
  `cgStartDate` datetime DEFAULT NULL,
  `cgEndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`cID`,`gID`,`uID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PagePermissions`
--

INSERT INTO `PagePermissions` (`cID`, `gID`, `uID`, `cgPermissions`, `cgStartDate`, `cgEndDate`) VALUES
(5, 1, 0, 'r', NULL, NULL),
(5, 2, 0, 'r', NULL, NULL),
(6, 1, 0, 'r', NULL, NULL),
(15, 3, 0, 'r:wa:adm', NULL, NULL),
(1, 1, 0, 'r', NULL, NULL),
(1, 3, 0, 'r:rv:wa:db:av:dc:adm', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `PageSearchIndex`
--

CREATE TABLE IF NOT EXISTS `PageSearchIndex` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `content` text,
  `cName` varchar(255) DEFAULT NULL,
  `cDescription` text,
  `cPath` text,
  `cDatePublic` datetime DEFAULT NULL,
  `cDateLastIndexed` datetime DEFAULT NULL,
  `cDateLastSitemapped` datetime DEFAULT NULL,
  PRIMARY KEY (`cID`),
  KEY `cDateLastIndexed` (`cDateLastIndexed`),
  KEY `cDateLastSitemapped` (`cDateLastSitemapped`),
  FULLTEXT KEY `cName` (`cName`),
  FULLTEXT KEY `cDescription` (`cDescription`),
  FULLTEXT KEY `content` (`content`),
  FULLTEXT KEY `content2` (`cName`,`cDescription`,`content`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PageSearchIndex`
--


-- --------------------------------------------------------

--
-- Table structure for table `PageStatistics`
--

CREATE TABLE IF NOT EXISTS `PageStatistics` (
  `pstID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pstID`),
  KEY `cID` (`cID`),
  KEY `date` (`date`),
  KEY `uID` (`uID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `PageStatistics`
--

INSERT INTO `PageStatistics` (`pstID`, `cID`, `date`, `timestamp`, `uID`) VALUES
(1, 1, '2011-08-20', '2011-08-20 04:11:18', 1),
(2, 5, '2011-08-20', '2011-08-20 04:11:51', 1),
(3, 1, '2011-08-20', '2011-08-20 04:11:51', 0);

-- --------------------------------------------------------

--
-- Table structure for table `PageThemeStyles`
--

CREATE TABLE IF NOT EXISTS `PageThemeStyles` (
  `ptID` int(10) unsigned NOT NULL DEFAULT '0',
  `ptsHandle` varchar(128) NOT NULL,
  `ptsValue` longtext,
  `ptsType` varchar(32) NOT NULL,
  PRIMARY KEY (`ptID`,`ptsHandle`,`ptsType`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PageThemeStyles`
--


-- --------------------------------------------------------

--
-- Table structure for table `PageThemes`
--

CREATE TABLE IF NOT EXISTS `PageThemes` (
  `ptID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ptHandle` varchar(64) NOT NULL,
  `ptName` varchar(255) DEFAULT NULL,
  `ptDescription` text,
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ptID`),
  UNIQUE KEY `ptHandle` (`ptHandle`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `PageThemes`
--

INSERT INTO `PageThemes` (`ptID`, `ptHandle`, `ptName`, `ptDescription`, `pkgID`) VALUES
(1, 'default', 'Plain Yogurt\n', 'Plain Yogurt is concrete5''s default theme.', 0),
(2, 'greensalad', 'Green Salad Theme\n', 'This is concrete5''s Green Salad site theme.', 0),
(3, 'dark_chocolate', 'Dark Chocolate\n', 'Dark Chocolate is concrete5''s default theme in black.', 0);

-- --------------------------------------------------------

--
-- Table structure for table `PageTypeAttributes`
--

CREATE TABLE IF NOT EXISTS `PageTypeAttributes` (
  `ctID` int(10) unsigned NOT NULL DEFAULT '0',
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ctID`,`akID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PageTypeAttributes`
--

INSERT INTO `PageTypeAttributes` (`ctID`, `akID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `PageTypes`
--

CREATE TABLE IF NOT EXISTS `PageTypes` (
  `ctID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctHandle` varchar(32) NOT NULL,
  `ctIcon` varchar(128) DEFAULT NULL,
  `ctName` varchar(90) NOT NULL,
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ctID`),
  UNIQUE KEY `ctHandle` (`ctHandle`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `PageTypes`
--

INSERT INTO `PageTypes` (`ctID`, `ctHandle`, `ctIcon`, `ctName`, `pkgID`) VALUES
(1, 'page', 'template3.png', 'Page', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Pages`
--

CREATE TABLE IF NOT EXISTS `Pages` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `ctID` int(10) unsigned NOT NULL DEFAULT '0',
  `cIsTemplate` varchar(1) NOT NULL DEFAULT '0',
  `uID` int(10) unsigned DEFAULT NULL,
  `cIsCheckedOut` tinyint(1) NOT NULL DEFAULT '0',
  `cCheckedOutUID` int(10) unsigned DEFAULT NULL,
  `cCheckedOutDatetime` datetime DEFAULT NULL,
  `cCheckedOutDatetimeLastEdit` datetime DEFAULT NULL,
  `cPendingAction` varchar(6) DEFAULT NULL,
  `cPendingActionDatetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cPendingActionUID` int(10) unsigned DEFAULT NULL,
  `cPendingActionTargetCID` int(10) unsigned DEFAULT NULL,
  `cOverrideTemplatePermissions` tinyint(1) NOT NULL DEFAULT '1',
  `cInheritPermissionsFromCID` int(10) unsigned NOT NULL DEFAULT '0',
  `cInheritPermissionsFrom` varchar(8) NOT NULL DEFAULT 'PARENT',
  `cFilename` varchar(255) DEFAULT NULL,
  `cPointerID` int(10) unsigned NOT NULL DEFAULT '0',
  `cPointerExternalLink` varchar(255) DEFAULT NULL,
  `cPointerExternalLinkNewWindow` tinyint(1) NOT NULL DEFAULT '0',
  `cChildren` int(10) unsigned NOT NULL DEFAULT '0',
  `cDisplayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  `cParentID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  `ptID` int(10) unsigned NOT NULL DEFAULT '0',
  `cCacheFullPageContent` int(4) NOT NULL DEFAULT '-1',
  `cCacheFullPageContentOverrideLifetime` varchar(32) NOT NULL DEFAULT '0',
  `cCacheFullPageContentLifetimeCustom` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`),
  KEY `cParentID` (`cParentID`),
  KEY `cCheckedOutUID` (`cCheckedOutUID`),
  KEY `cPointerID` (`cPointerID`),
  KEY `uID` (`uID`),
  KEY `ctID` (`ctID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Pages`
--

INSERT INTO `Pages` (`cID`, `ctID`, `cIsTemplate`, `uID`, `cIsCheckedOut`, `cCheckedOutUID`, `cCheckedOutDatetime`, `cCheckedOutDatetimeLastEdit`, `cPendingAction`, `cPendingActionDatetime`, `cPendingActionUID`, `cPendingActionTargetCID`, `cOverrideTemplatePermissions`, `cInheritPermissionsFromCID`, `cInheritPermissionsFrom`, `cFilename`, `cPointerID`, `cPointerExternalLink`, `cPointerExternalLinkNewWindow`, `cChildren`, `cDisplayOrder`, `cParentID`, `pkgID`, `ptID`, `cCacheFullPageContent`, `cCacheFullPageContentOverrideLifetime`, `cCacheFullPageContentLifetimeCustom`) VALUES
(1, 1, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 1, 'OVERRIDE', NULL, 0, NULL, 0, 7, 0, 0, 0, 1, -1, '0', 0),
(2, 1, '1', NULL, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 0, 'PARENT', NULL, 0, NULL, 0, 0, 0, 0, 0, 0, -1, '0', 0),
(5, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 5, 'OVERRIDE', '/login.php', 0, NULL, 0, 0, 0, 1, 0, 1, -1, '0', 0),
(6, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 6, 'OVERRIDE', '/register.php', 0, NULL, 0, 0, 1, 1, 0, 1, -1, '0', 0),
(7, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 1, 'PARENT', '/profile/view.php', 0, NULL, 0, 4, 2, 1, 0, 1, -1, '0', 0),
(8, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 1, 'PARENT', '/profile/edit.php', 0, NULL, 0, 0, 0, 7, 0, 1, -1, '0', 0),
(10, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 1, 'PARENT', '/profile/avatar.php', 0, NULL, 0, 0, 1, 7, 0, 1, -1, '0', 0),
(11, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 1, 'PARENT', '/profile/messages.php', 0, NULL, 0, 0, 2, 7, 0, 1, -1, '0', 0),
(12, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 1, 'PARENT', '/profile/friends.php', 0, NULL, 0, 0, 3, 7, 0, 1, -1, '0', 0),
(13, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 1, 'PARENT', '/page_not_found.php', 0, NULL, 0, 0, 4, 1, 0, 1, -1, '0', 0),
(14, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 1, 'PARENT', '/page_forbidden.php', 0, NULL, 0, 0, 5, 1, 0, 1, -1, '0', 0),
(15, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'OVERRIDE', '/dashboard/view.php', 0, NULL, 0, 9, 6, 1, 0, 0, -1, '0', 0),
(75, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/composer/view.php', 0, NULL, 0, 2, 0, 15, 0, 0, -1, '0', 0),
(16, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/sitemap/view.php', 0, NULL, 0, 4, 1, 15, 0, 0, -1, '0', 0),
(17, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/sitemap/full.php', 0, NULL, 0, 0, 0, 16, 0, 0, -1, '0', 0),
(18, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/sitemap/explore.php', 0, NULL, 0, 0, 1, 16, 0, 0, -1, '0', 0),
(19, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/sitemap/search.php', 0, NULL, 0, 0, 2, 16, 0, 0, -1, '0', 0),
(20, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/sitemap/access.php', 0, NULL, 0, 0, 3, 16, 0, 0, -1, '0', 0),
(21, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/files/view.php', 0, NULL, 0, 4, 2, 15, 0, 0, -1, '0', 0),
(22, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/files/search.php', 0, NULL, 0, 0, 0, 21, 0, 0, -1, '0', 0),
(23, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/files/attributes.php', 0, NULL, 0, 0, 1, 21, 0, 0, -1, '0', 0),
(24, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/files/sets.php', 0, NULL, 0, 0, 2, 21, 0, 0, -1, '0', 0),
(25, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/files/access.php', 0, NULL, 0, 0, 3, 21, 0, 0, -1, '0', 0),
(26, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/reports.php', 0, NULL, 0, 3, 3, 15, 0, 0, -1, '0', 0),
(27, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/reports/forms.php', 0, NULL, 0, 0, 0, 26, 0, 0, -1, '0', 0),
(28, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/reports/surveys.php', 0, NULL, 0, 0, 1, 26, 0, 0, -1, '0', 0),
(29, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/reports/logs.php', 0, NULL, 0, 0, 2, 26, 0, 0, -1, '0', 0),
(30, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/users/view.php', 0, NULL, 0, 5, 4, 15, 0, 0, -1, '0', 0),
(31, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/users/search.php', 0, NULL, 0, 0, 0, 30, 0, 0, -1, '0', 0),
(32, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/users/add.php', 0, NULL, 0, 0, 1, 30, 0, 0, -1, '0', 0),
(33, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/users/groups.php', 0, NULL, 0, 0, 2, 30, 0, 0, -1, '0', 0),
(34, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/users/attributes.php', 0, NULL, 0, 0, 3, 30, 0, 0, -1, '0', 0),
(35, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/users/registration.php', 0, NULL, 0, 0, 4, 30, 0, 0, -1, '0', 0),
(36, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/scrapbook/view.php', 0, NULL, 0, 0, 5, 15, 0, 0, -1, '0', 0),
(37, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/pages/view.php', 0, NULL, 0, 4, 6, 15, 0, 0, -1, '0', 0),
(38, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/pages/themes/view.php', 0, NULL, 0, 4, 0, 37, 0, 0, -1, '0', 0),
(39, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/pages/themes/add.php', 0, NULL, 0, 0, 0, 38, 0, 0, -1, '0', 0),
(40, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/pages/themes/inspect.php', 0, NULL, 0, 0, 1, 38, 0, 0, -1, '0', 0),
(41, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/pages/themes/customize.php', 0, NULL, 0, 0, 2, 38, 0, 0, -1, '0', 0),
(43, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/pages/types/view.php', 0, NULL, 0, 0, 1, 37, 0, 0, -1, '0', 0),
(44, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/pages/attributes.php', 0, NULL, 0, 0, 2, 37, 0, 0, -1, '0', 0),
(45, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/pages/single.php', 0, NULL, 0, 0, 3, 37, 0, 0, -1, '0', 0),
(46, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/install.php', 0, NULL, 0, 0, 7, 15, 0, 0, -1, '0', 0),
(47, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/system/view.php', 0, NULL, 0, 4, 8, 15, 0, 0, -1, '0', 0),
(48, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/system/jobs.php', 0, NULL, 0, 0, 0, 47, 0, 0, -1, '0', 0),
(49, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/system/backup.php', 0, NULL, 0, 0, 1, 47, 0, 0, -1, '0', 0),
(50, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/system/update.php', 0, NULL, 0, 0, 2, 47, 0, 0, -1, '0', 0),
(51, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/system/notifications.php', 0, NULL, 0, 0, 3, 47, 0, 0, -1, '0', 0),
(52, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/settings/view.php', 0, NULL, 0, 2, 9, 15, 0, 0, -1, '0', 0),
(53, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/settings/mail/view.php', 0, NULL, 0, 0, 0, 52, 0, 0, -1, '0', 0),
(54, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/settings/marketplace.php', 0, NULL, 0, 0, 1, 52, 0, 0, -1, '0', 0),
(55, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 1, 'PARENT', '/download_file.php', 0, NULL, 0, 0, 7, 1, 0, 0, -1, '0', 0),
(64, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 1, 'PARENT', '/members.php', 0, NULL, 0, 0, 7, 1, 0, 0, -1, '0', 0),
(76, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/composer/write.php', 0, NULL, 0, 0, 0, 75, 0, 0, -1, '0', 0),
(77, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/composer/drafts.php', 0, NULL, 0, 0, 1, 75, 0, 0, -1, '0', 0),
(78, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/pages/types/composer.php', 0, NULL, 0, 0, 1, 43, 0, 0, -1, '0', 0),
(79, 0, '0', 1, 0, NULL, NULL, NULL, NULL, '2011-08-20 04:10:35', NULL, NULL, 1, 15, 'PARENT', '/dashboard/settings/multilingual/view.php', 0, NULL, 0, 0, 1, 52, 0, 0, -1, '0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `PileContents`
--

CREATE TABLE IF NOT EXISTS `PileContents` (
  `pcID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pID` int(10) unsigned NOT NULL DEFAULT '0',
  `itemID` int(10) unsigned NOT NULL DEFAULT '0',
  `itemType` varchar(64) NOT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT '1',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `displayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pcID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `PileContents`
--


-- --------------------------------------------------------

--
-- Table structure for table `Piles`
--

CREATE TABLE IF NOT EXISTS `Piles` (
  `pID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uID` int(10) unsigned DEFAULT NULL,
  `isDefault` tinyint(1) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) DEFAULT NULL,
  `state` varchar(64) NOT NULL,
  PRIMARY KEY (`pID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Piles`
--


-- --------------------------------------------------------

--
-- Table structure for table `SignupRequests`
--

CREATE TABLE IF NOT EXISTS `SignupRequests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipFrom` int(10) unsigned NOT NULL DEFAULT '0',
  `date_access` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index_ipFrom` (`ipFrom`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SignupRequests`
--


-- --------------------------------------------------------

--
-- Table structure for table `SystemNotifications`
--

CREATE TABLE IF NOT EXISTS `SystemNotifications` (
  `snID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `snTypeID` int(3) unsigned NOT NULL DEFAULT '0',
  `snURL` text,
  `snURL2` text,
  `snDateTime` datetime NOT NULL,
  `snIsArchived` int(1) NOT NULL DEFAULT '0',
  `snIsNew` int(1) NOT NULL DEFAULT '0',
  `snTitle` varchar(255) DEFAULT NULL,
  `snDescription` text,
  `snBody` text,
  PRIMARY KEY (`snID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SystemNotifications`
--


-- --------------------------------------------------------

--
-- Table structure for table `TaskPermissionUserGroups`
--

CREATE TABLE IF NOT EXISTS `TaskPermissionUserGroups` (
  `tpID` int(10) unsigned NOT NULL DEFAULT '0',
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `canRead` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tpID`,`gID`,`uID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TaskPermissionUserGroups`
--

INSERT INTO `TaskPermissionUserGroups` (`tpID`, `gID`, `uID`, `canRead`) VALUES
(1, 3, 0, 1),
(2, 3, 0, 1),
(3, 3, 0, 1),
(4, 3, 0, 1),
(5, 3, 0, 1),
(6, 3, 0, 1),
(8, 3, 0, 1),
(9, 3, 0, 1),
(10, 3, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `TaskPermissions`
--

CREATE TABLE IF NOT EXISTS `TaskPermissions` (
  `tpID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tpHandle` varchar(255) DEFAULT NULL,
  `tpName` varchar(255) DEFAULT NULL,
  `tpDescription` text,
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tpID`),
  UNIQUE KEY `tpHandle` (`tpHandle`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `TaskPermissions`
--

INSERT INTO `TaskPermissions` (`tpID`, `tpHandle`, `tpName`, `tpDescription`, `pkgID`) VALUES
(1, 'access_task_permissions', 'Change Task Permissions', '', 0),
(2, 'access_sitemap', 'Access Sitemap and Page Search', '', 0),
(3, 'access_user_search', 'Access User Search', '', 0),
(4, 'access_group_search', 'Access Group Search', '', 0),
(5, 'access_page_defaults', 'Change Content on Page Type Default Pages', '', 0),
(6, 'backup', 'Perform Full Database Backups', '', 0),
(7, 'sudo', 'Sign in as User', '', 0),
(8, 'uninstall_packages', 'Uninstall Packages', '', 0),
(9, 'install_packages', 'Install Packages and Connect to the Marketplace', '', 0),
(10, 'delete_user', 'Delete Users', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `UserAttributeKeys`
--

CREATE TABLE IF NOT EXISTS `UserAttributeKeys` (
  `akID` int(10) unsigned NOT NULL,
  `uakProfileDisplay` tinyint(1) NOT NULL DEFAULT '0',
  `uakMemberListDisplay` tinyint(1) NOT NULL DEFAULT '0',
  `uakProfileEdit` tinyint(1) NOT NULL DEFAULT '1',
  `uakProfileEditRequired` tinyint(1) NOT NULL DEFAULT '0',
  `uakRegisterEdit` tinyint(1) NOT NULL DEFAULT '0',
  `uakRegisterEditRequired` tinyint(1) NOT NULL DEFAULT '0',
  `displayOrder` int(10) unsigned DEFAULT '0',
  `uakIsActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`akID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `UserAttributeKeys`
--

INSERT INTO `UserAttributeKeys` (`akID`, `uakProfileDisplay`, `uakMemberListDisplay`, `uakProfileEdit`, `uakProfileEditRequired`, `uakRegisterEdit`, `uakRegisterEditRequired`, `displayOrder`, `uakIsActive`) VALUES
(12, 0, 0, 1, 0, 1, 0, 0, 1),
(13, 0, 0, 1, 0, 1, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `UserAttributeValues`
--

CREATE TABLE IF NOT EXISTS `UserAttributeValues` (
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `avID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uID`,`akID`,`avID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `UserAttributeValues`
--


-- --------------------------------------------------------

--
-- Table structure for table `UserBannedIPs`
--

CREATE TABLE IF NOT EXISTS `UserBannedIPs` (
  `ipFrom` int(10) unsigned NOT NULL DEFAULT '0',
  `ipTo` int(10) unsigned NOT NULL DEFAULT '0',
  `banCode` int(1) unsigned NOT NULL DEFAULT '1',
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  `isManual` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ipFrom`,`ipTo`),
  KEY `ipFrom` (`ipFrom`),
  KEY `ipTo` (`ipTo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `UserBannedIPs`
--


-- --------------------------------------------------------

--
-- Table structure for table `UserGroups`
--

CREATE TABLE IF NOT EXISTS `UserGroups` (
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  `ugEntered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`uID`,`gID`),
  KEY `uID` (`uID`),
  KEY `gID` (`gID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `UserGroups`
--


-- --------------------------------------------------------

--
-- Table structure for table `UserOpenIDs`
--

CREATE TABLE IF NOT EXISTS `UserOpenIDs` (
  `uID` int(10) unsigned NOT NULL,
  `uOpenID` varchar(255) NOT NULL,
  PRIMARY KEY (`uOpenID`),
  KEY `uID` (`uID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `UserOpenIDs`
--


-- --------------------------------------------------------

--
-- Table structure for table `UserPrivateMessages`
--

CREATE TABLE IF NOT EXISTS `UserPrivateMessages` (
  `msgID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uAuthorID` int(10) unsigned NOT NULL DEFAULT '0',
  `msgDateCreated` datetime NOT NULL,
  `msgSubject` varchar(255) NOT NULL,
  `msgBody` text,
  `uToID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`msgID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `UserPrivateMessages`
--


-- --------------------------------------------------------

--
-- Table structure for table `UserPrivateMessagesTo`
--

CREATE TABLE IF NOT EXISTS `UserPrivateMessagesTo` (
  `msgID` int(10) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `uAuthorID` int(10) unsigned NOT NULL DEFAULT '0',
  `msgMailboxID` int(11) NOT NULL,
  `msgIsNew` int(1) NOT NULL DEFAULT '0',
  `msgIsUnread` int(1) NOT NULL DEFAULT '0',
  `msgIsReplied` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`msgID`,`uID`,`uAuthorID`),
  KEY `uID` (`uID`),
  KEY `uAuthorID` (`uAuthorID`),
  KEY `msgFolderID` (`msgMailboxID`),
  KEY `msgIsNew` (`msgIsNew`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `UserPrivateMessagesTo`
--


-- --------------------------------------------------------

--
-- Table structure for table `UserSearchIndexAttributes`
--

CREATE TABLE IF NOT EXISTS `UserSearchIndexAttributes` (
  `uID` int(11) unsigned NOT NULL DEFAULT '0',
  `ak_profile_private_messages_enabled` tinyint(4) DEFAULT '0',
  `ak_profile_private_messages_notification_enabled` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`uID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `UserSearchIndexAttributes`
--


-- --------------------------------------------------------

--
-- Table structure for table `UserValidationHashes`
--

CREATE TABLE IF NOT EXISTS `UserValidationHashes` (
  `uvhID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uID` int(10) unsigned DEFAULT NULL,
  `uHash` varchar(64) NOT NULL,
  `type` int(4) unsigned NOT NULL DEFAULT '0',
  `uDateGenerated` int(10) unsigned NOT NULL DEFAULT '0',
  `uDateRedeemed` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uvhID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `UserValidationHashes`
--


-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE IF NOT EXISTS `Users` (
  `uID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uName` varchar(64) NOT NULL,
  `uEmail` varchar(64) NOT NULL,
  `uPassword` varchar(255) NOT NULL,
  `uIsActive` varchar(1) NOT NULL DEFAULT '0',
  `uIsValidated` tinyint(4) NOT NULL DEFAULT '-1',
  `uIsFullRecord` tinyint(1) NOT NULL DEFAULT '1',
  `uDateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uHasAvatar` tinyint(1) NOT NULL DEFAULT '0',
  `uLastOnline` int(10) unsigned NOT NULL DEFAULT '0',
  `uLastLogin` int(10) unsigned NOT NULL DEFAULT '0',
  `uPreviousLogin` int(10) unsigned NOT NULL DEFAULT '0',
  `uNumLogins` int(10) unsigned NOT NULL DEFAULT '0',
  `uTimezone` varchar(255) DEFAULT NULL,
  `uDefaultLanguage` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`uID`),
  UNIQUE KEY `uName` (`uName`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`uID`, `uName`, `uEmail`, `uPassword`, `uIsActive`, `uIsValidated`, `uIsFullRecord`, `uDateAdded`, `uHasAvatar`, `uLastOnline`, `uLastLogin`, `uPreviousLogin`, `uNumLogins`, `uTimezone`, `uDefaultLanguage`) VALUES
(1, 'admin', 'webmaster@localhost', '0795f082c1646c8e9720edf3f13add1c', '1', -1, 1, '2011-08-20 04:10:35', 0, 1313813478, 1313813435, 0, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `UsersFriends`
--

CREATE TABLE IF NOT EXISTS `UsersFriends` (
  `ufID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uID` int(10) unsigned DEFAULT NULL,
  `status` varchar(64) NOT NULL,
  `friendUID` int(10) unsigned DEFAULT NULL,
  `uDateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ufID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `UsersFriends`
--


-- --------------------------------------------------------

--
-- Table structure for table `atAddress`
--

CREATE TABLE IF NOT EXISTS `atAddress` (
  `avID` int(10) unsigned NOT NULL DEFAULT '0',
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state_province` varchar(255) DEFAULT NULL,
  `country` varchar(4) DEFAULT NULL,
  `postal_code` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`avID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `atAddress`
--


-- --------------------------------------------------------

--
-- Table structure for table `atAddressCustomCountries`
--

CREATE TABLE IF NOT EXISTS `atAddressCustomCountries` (
  `atAddressCustomCountryID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `country` varchar(5) NOT NULL,
  PRIMARY KEY (`atAddressCustomCountryID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `atAddressCustomCountries`
--


-- --------------------------------------------------------

--
-- Table structure for table `atAddressSettings`
--

CREATE TABLE IF NOT EXISTS `atAddressSettings` (
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `akHasCustomCountries` int(1) NOT NULL DEFAULT '0',
  `akDefaultCountry` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`akID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `atAddressSettings`
--


-- --------------------------------------------------------

--
-- Table structure for table `atBoolean`
--

CREATE TABLE IF NOT EXISTS `atBoolean` (
  `avID` int(10) unsigned NOT NULL,
  `value` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`avID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `atBoolean`
--


-- --------------------------------------------------------

--
-- Table structure for table `atBooleanSettings`
--

CREATE TABLE IF NOT EXISTS `atBooleanSettings` (
  `akID` int(10) unsigned NOT NULL,
  `akCheckedByDefault` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`akID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `atBooleanSettings`
--

INSERT INTO `atBooleanSettings` (`akID`, `akCheckedByDefault`) VALUES
(12, 1),
(13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `atDateTime`
--

CREATE TABLE IF NOT EXISTS `atDateTime` (
  `avID` int(10) unsigned NOT NULL,
  `value` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`avID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `atDateTime`
--


-- --------------------------------------------------------

--
-- Table structure for table `atDateTimeSettings`
--

CREATE TABLE IF NOT EXISTS `atDateTimeSettings` (
  `akID` int(10) unsigned NOT NULL,
  `akDateDisplayMode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`akID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `atDateTimeSettings`
--


-- --------------------------------------------------------

--
-- Table structure for table `atDefault`
--

CREATE TABLE IF NOT EXISTS `atDefault` (
  `avID` int(10) unsigned NOT NULL,
  `value` longtext,
  PRIMARY KEY (`avID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `atDefault`
--


-- --------------------------------------------------------

--
-- Table structure for table `atFile`
--

CREATE TABLE IF NOT EXISTS `atFile` (
  `avID` int(10) unsigned NOT NULL,
  `fID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`avID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `atFile`
--


-- --------------------------------------------------------

--
-- Table structure for table `atNumber`
--

CREATE TABLE IF NOT EXISTS `atNumber` (
  `avID` int(10) unsigned NOT NULL,
  `value` decimal(14,4) DEFAULT '0.0000',
  PRIMARY KEY (`avID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `atNumber`
--


-- --------------------------------------------------------

--
-- Table structure for table `atSelectOptions`
--

CREATE TABLE IF NOT EXISTS `atSelectOptions` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `akID` int(10) unsigned DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `displayOrder` int(10) unsigned DEFAULT NULL,
  `isEndUserAdded` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `atSelectOptions`
--


-- --------------------------------------------------------

--
-- Table structure for table `atSelectOptionsSelected`
--

CREATE TABLE IF NOT EXISTS `atSelectOptionsSelected` (
  `avID` int(10) unsigned NOT NULL,
  `atSelectOptionID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`avID`,`atSelectOptionID`),
  KEY `atSelectOptionID` (`atSelectOptionID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `atSelectOptionsSelected`
--


-- --------------------------------------------------------

--
-- Table structure for table `atSelectSettings`
--

CREATE TABLE IF NOT EXISTS `atSelectSettings` (
  `akID` int(10) unsigned NOT NULL,
  `akSelectAllowMultipleValues` tinyint(1) NOT NULL DEFAULT '0',
  `akSelectOptionDisplayOrder` varchar(255) NOT NULL DEFAULT 'display_asc',
  `akSelectAllowOtherValues` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`akID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `atSelectSettings`
--

INSERT INTO `atSelectSettings` (`akID`, `akSelectAllowMultipleValues`, `akSelectOptionDisplayOrder`, `akSelectAllowOtherValues`) VALUES
(11, 1, 'display_asc', 1);

-- --------------------------------------------------------

--
-- Table structure for table `atTextareaSettings`
--

CREATE TABLE IF NOT EXISTS `atTextareaSettings` (
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `akTextareaDisplayMode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`akID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `atTextareaSettings`
--


-- --------------------------------------------------------

--
-- Table structure for table `btContentFile`
--

CREATE TABLE IF NOT EXISTS `btContentFile` (
  `bID` int(10) unsigned NOT NULL,
  `fID` int(10) unsigned DEFAULT NULL,
  `fileLinkText` varchar(255) DEFAULT NULL,
  `filePassword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `btContentFile`
--


-- --------------------------------------------------------

--
-- Table structure for table `btContentImage`
--

CREATE TABLE IF NOT EXISTS `btContentImage` (
  `bID` int(10) unsigned NOT NULL,
  `fID` int(10) unsigned DEFAULT '0',
  `fOnstateID` int(10) unsigned DEFAULT '0',
  `maxWidth` int(10) unsigned DEFAULT '0',
  `maxHeight` int(10) unsigned DEFAULT '0',
  `externalLink` varchar(255) DEFAULT NULL,
  `altText` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `btContentImage`
--


-- --------------------------------------------------------

--
-- Table structure for table `btContentLocal`
--

CREATE TABLE IF NOT EXISTS `btContentLocal` (
  `bID` int(10) unsigned NOT NULL,
  `content` longtext,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `btContentLocal`
--


-- --------------------------------------------------------

--
-- Table structure for table `btDateNav`
--

CREATE TABLE IF NOT EXISTS `btDateNav` (
  `bID` int(10) unsigned NOT NULL,
  `num` smallint(5) unsigned NOT NULL,
  `cParentID` int(10) unsigned NOT NULL DEFAULT '1',
  `cThis` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ctID` smallint(5) unsigned DEFAULT NULL,
  `flatDisplay` int(11) DEFAULT '0',
  `defaultNode` varchar(64) DEFAULT 'current_page',
  `truncateTitles` int(11) DEFAULT '0',
  `truncateSummaries` int(11) DEFAULT '0',
  `displayFeaturedOnly` int(11) DEFAULT '0',
  `truncateChars` int(11) DEFAULT '128',
  `truncateTitleChars` int(11) DEFAULT '128',
  `showDescriptions` int(11) DEFAULT '0',
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `btDateNav`
--


-- --------------------------------------------------------

--
-- Table structure for table `btExternalForm`
--

CREATE TABLE IF NOT EXISTS `btExternalForm` (
  `bID` int(10) unsigned NOT NULL,
  `filename` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `btExternalForm`
--


-- --------------------------------------------------------

--
-- Table structure for table `btFile`
--

CREATE TABLE IF NOT EXISTS `btFile` (
  `bID` int(10) unsigned NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `origfilename` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `generictype` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `btFile`
--


-- --------------------------------------------------------

--
-- Table structure for table `btFlashContent`
--

CREATE TABLE IF NOT EXISTS `btFlashContent` (
  `bID` int(10) unsigned NOT NULL,
  `fID` int(10) unsigned DEFAULT NULL,
  `quality` varchar(255) DEFAULT NULL,
  `minVersion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `btFlashContent`
--


-- --------------------------------------------------------

--
-- Table structure for table `btForm`
--

CREATE TABLE IF NOT EXISTS `btForm` (
  `bID` int(10) unsigned NOT NULL,
  `questionSetId` int(10) unsigned DEFAULT '0',
  `surveyName` varchar(255) DEFAULT NULL,
  `thankyouMsg` text,
  `notifyMeOnSubmission` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `recipientEmail` varchar(255) DEFAULT NULL,
  `displayCaptcha` int(11) DEFAULT '1',
  `redirectCID` int(11) DEFAULT '0',
  PRIMARY KEY (`bID`),
  KEY `questionSetIdForeign` (`questionSetId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `btForm`
--


-- --------------------------------------------------------

--
-- Table structure for table `btFormAnswerSet`
--

CREATE TABLE IF NOT EXISTS `btFormAnswerSet` (
  `asID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `questionSetId` int(10) unsigned DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uID` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`asID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `btFormAnswerSet`
--


-- --------------------------------------------------------

--
-- Table structure for table `btFormAnswers`
--

CREATE TABLE IF NOT EXISTS `btFormAnswers` (
  `aID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asID` int(10) unsigned DEFAULT '0',
  `msqID` int(10) unsigned DEFAULT '0',
  `answer` varchar(255) DEFAULT NULL,
  `answerLong` text,
  PRIMARY KEY (`aID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `btFormAnswers`
--


-- --------------------------------------------------------

--
-- Table structure for table `btFormQuestions`
--

CREATE TABLE IF NOT EXISTS `btFormQuestions` (
  `qID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `msqID` int(10) unsigned DEFAULT '0',
  `bID` int(10) unsigned DEFAULT '0',
  `questionSetId` int(10) unsigned DEFAULT '0',
  `question` varchar(255) DEFAULT NULL,
  `inputType` varchar(255) DEFAULT NULL,
  `options` text,
  `position` int(10) unsigned DEFAULT '1000',
  `width` int(10) unsigned DEFAULT '50',
  `height` int(10) unsigned DEFAULT '3',
  `required` int(11) DEFAULT '0',
  PRIMARY KEY (`qID`),
  KEY `questionSetId` (`questionSetId`),
  KEY `msqID` (`msqID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `btFormQuestions`
--


-- --------------------------------------------------------

--
-- Table structure for table `btGoogleMap`
--

CREATE TABLE IF NOT EXISTS `btGoogleMap` (
  `bID` int(10) unsigned NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `zoom` int(8) DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `btGoogleMap`
--


-- --------------------------------------------------------

--
-- Table structure for table `btGuestBook`
--

CREATE TABLE IF NOT EXISTS `btGuestBook` (
  `bID` int(10) unsigned NOT NULL,
  `requireApproval` int(11) DEFAULT '0',
  `title` varchar(100) DEFAULT 'Comments',
  `dateFormat` varchar(100) DEFAULT NULL,
  `displayGuestBookForm` int(11) DEFAULT '1',
  `displayCaptcha` int(11) DEFAULT '1',
  `authenticationRequired` int(11) DEFAULT '0',
  `notifyEmail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `btGuestBook`
--


-- --------------------------------------------------------

--
-- Table structure for table `btGuestBookEntries`
--

CREATE TABLE IF NOT EXISTS `btGuestBookEntries` (
  `bID` int(11) DEFAULT NULL,
  `cID` int(11) DEFAULT '1',
  `entryID` int(11) NOT NULL AUTO_INCREMENT,
  `uID` int(11) DEFAULT '0',
  `commentText` longtext,
  `user_name` varchar(100) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `entryDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `approved` int(11) DEFAULT '1',
  PRIMARY KEY (`entryID`),
  KEY `cID` (`cID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `btGuestBookEntries`
--


-- --------------------------------------------------------

--
-- Table structure for table `btNavigation`
--

CREATE TABLE IF NOT EXISTS `btNavigation` (
  `bID` int(10) unsigned NOT NULL,
  `orderBy` varchar(255) DEFAULT 'alpha_asc',
  `displayPages` varchar(255) DEFAULT 'top',
  `displayPagesCID` int(10) unsigned NOT NULL DEFAULT '1',
  `displayPagesIncludeSelf` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `displaySubPages` varchar(255) DEFAULT 'none',
  `displaySubPageLevels` varchar(255) DEFAULT 'none',
  `displaySubPageLevelsNum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `displayUnavailablePages` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `btNavigation`
--


-- --------------------------------------------------------

--
-- Table structure for table `btNextPrevious`
--

CREATE TABLE IF NOT EXISTS `btNextPrevious` (
  `bID` int(10) unsigned NOT NULL,
  `linkStyle` varchar(32) DEFAULT NULL,
  `nextLabel` varchar(128) DEFAULT NULL,
  `previousLabel` varchar(128) DEFAULT NULL,
  `parentLabel` varchar(128) DEFAULT NULL,
  `showArrows` int(11) DEFAULT '1',
  `loopSequence` int(11) DEFAULT '1',
  `excludeSystemPages` int(11) DEFAULT '1',
  `orderBy` varchar(20) DEFAULT 'display_asc',
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `btNextPrevious`
--


-- --------------------------------------------------------

--
-- Table structure for table `btPageList`
--

CREATE TABLE IF NOT EXISTS `btPageList` (
  `bID` int(10) unsigned NOT NULL,
  `num` smallint(5) unsigned NOT NULL,
  `orderBy` varchar(32) DEFAULT NULL,
  `cParentID` int(10) unsigned NOT NULL DEFAULT '1',
  `cThis` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `paginate` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `displayAliases` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `ctID` smallint(5) unsigned DEFAULT NULL,
  `rss` int(11) DEFAULT '0',
  `rssTitle` varchar(255) DEFAULT NULL,
  `rssDescription` longtext,
  `truncateSummaries` int(11) DEFAULT '0',
  `displayFeaturedOnly` int(11) DEFAULT '0',
  `truncateChars` int(11) DEFAULT '128',
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `btPageList`
--


-- --------------------------------------------------------

--
-- Table structure for table `btRssDisplay`
--

CREATE TABLE IF NOT EXISTS `btRssDisplay` (
  `bID` int(10) unsigned NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `dateFormat` varchar(100) DEFAULT NULL,
  `itemsToDisplay` int(10) unsigned DEFAULT '5',
  `showSummary` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `launchInNewWindow` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `btRssDisplay`
--


-- --------------------------------------------------------

--
-- Table structure for table `btSearch`
--

CREATE TABLE IF NOT EXISTS `btSearch` (
  `bID` int(10) unsigned NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `buttonText` varchar(128) DEFAULT NULL,
  `baseSearchPath` varchar(255) DEFAULT NULL,
  `resultsURL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `btSearch`
--


-- --------------------------------------------------------

--
-- Table structure for table `btSlideshow`
--

CREATE TABLE IF NOT EXISTS `btSlideshow` (
  `bID` int(10) unsigned NOT NULL,
  `fsID` int(10) unsigned DEFAULT NULL,
  `playback` varchar(50) DEFAULT NULL,
  `duration` int(10) unsigned DEFAULT NULL,
  `fadeDuration` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `btSlideshow`
--


-- --------------------------------------------------------

--
-- Table structure for table `btSlideshowImg`
--

CREATE TABLE IF NOT EXISTS `btSlideshowImg` (
  `slideshowImgId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bID` int(10) unsigned DEFAULT NULL,
  `fID` int(10) unsigned DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `duration` int(10) unsigned DEFAULT NULL,
  `fadeDuration` int(10) unsigned DEFAULT NULL,
  `groupSet` int(10) unsigned DEFAULT NULL,
  `position` int(10) unsigned DEFAULT NULL,
  `imgHeight` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`slideshowImgId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `btSlideshowImg`
--


-- --------------------------------------------------------

--
-- Table structure for table `btSurvey`
--

CREATE TABLE IF NOT EXISTS `btSurvey` (
  `bID` int(10) unsigned NOT NULL,
  `question` varchar(255) DEFAULT '',
  `requiresRegistration` int(11) DEFAULT '0',
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `btSurvey`
--


-- --------------------------------------------------------

--
-- Table structure for table `btSurveyOptions`
--

CREATE TABLE IF NOT EXISTS `btSurveyOptions` (
  `optionID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bID` int(11) DEFAULT NULL,
  `optionName` varchar(255) DEFAULT NULL,
  `displayOrder` int(11) DEFAULT '0',
  PRIMARY KEY (`optionID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `btSurveyOptions`
--


-- --------------------------------------------------------

--
-- Table structure for table `btSurveyResults`
--

CREATE TABLE IF NOT EXISTS `btSurveyResults` (
  `resultID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `optionID` int(10) unsigned DEFAULT '0',
  `uID` int(10) unsigned DEFAULT '0',
  `bID` int(11) DEFAULT NULL,
  `cID` int(11) DEFAULT NULL,
  `ipAddress` varchar(128) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`resultID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `btSurveyResults`
--


-- --------------------------------------------------------

--
-- Table structure for table `btTags`
--

CREATE TABLE IF NOT EXISTS `btTags` (
  `bID` int(10) unsigned NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `targetCID` int(11) DEFAULT NULL,
  `displayMode` varchar(20) DEFAULT 'page',
  `cloudCount` int(11) DEFAULT '10',
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `btTags`
--


-- --------------------------------------------------------

--
-- Table structure for table `btVideo`
--

CREATE TABLE IF NOT EXISTS `btVideo` (
  `bID` int(10) unsigned NOT NULL,
  `fID` int(10) unsigned DEFAULT NULL,
  `width` int(10) unsigned DEFAULT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `btVideo`
--


-- --------------------------------------------------------

--
-- Table structure for table `btYouTube`
--

CREATE TABLE IF NOT EXISTS `btYouTube` (
  `bID` int(10) unsigned NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `videoURL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `btYouTube`
--

