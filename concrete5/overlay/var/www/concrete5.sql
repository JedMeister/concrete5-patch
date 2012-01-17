-- phpMyAdmin SQL Dump
-- version 3.3.2deb1ubuntu1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 17, 2012 at 04:43 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.2-1ubuntu4.11

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `concrete5`
--
USE `concrete5`;

-- --------------------------------------------------------

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
  `arIsGlobal` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`arID`),
  KEY `arIsGlobal` (`arIsGlobal`),
  KEY `cID` (`cID`),
  KEY `arHandle` (`arHandle`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `Areas`
--

INSERT INTO `Areas` (`arID`, `cID`, `arHandle`, `arOverrideCollectionPermissions`, `arInheritPermissionsFromAreaOnCID`, `arIsGlobal`) VALUES
(1, 94, 'Header', 0, 0, 0),
(2, 94, 'Column 1', 0, 0, 0),
(3, 94, 'Column 2', 0, 0, 0),
(4, 94, 'Column 3', 0, 0, 0),
(5, 94, 'Column 4', 0, 0, 0),
(6, 93, 'Primary', 0, 0, 0),
(7, 93, 'Secondary 1', 0, 0, 0),
(8, 93, 'Secondary 2', 0, 0, 0),
(9, 93, 'Secondary 3', 0, 0, 0),
(10, 93, 'Secondary 4', 0, 0, 0),
(11, 93, 'Secondary 5', 0, 0, 0),
(12, 1, 'Header Nav', 0, 0, 0),
(13, 1, 'Header', 0, 0, 0),
(14, 1, 'Sidebar', 0, 0, 0),
(15, 1, 'Main', 0, 0, 0);

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
(1, 'collection', 1, NULL),
(2, 'user', 1, NULL),
(3, 'file', 1, NULL);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `AttributeKeys`
--

INSERT INTO `AttributeKeys` (`akID`, `akHandle`, `akName`, `akIsSearchable`, `akIsSearchableIndexed`, `akIsAutoCreated`, `akIsColumnHeader`, `akIsEditable`, `atID`, `akCategoryID`, `pkgID`) VALUES
(1, 'meta_title', 'Meta Title', 1, 1, 0, 0, 1, 1, 1, 0),
(2, 'meta_description', 'Meta Description', 1, 1, 0, 0, 1, 2, 1, 0),
(3, 'meta_keywords', 'Meta Keywords', 1, 1, 0, 0, 1, 2, 1, 0),
(4, 'exclude_nav', 'Exclude From Nav', 1, 1, 0, 0, 1, 3, 1, 0),
(5, 'exclude_page_list', 'Exclude From Page List', 1, 1, 0, 0, 1, 3, 1, 0),
(6, 'header_extra_content', 'Header Extra Content', 1, 1, 0, 0, 1, 2, 1, 0),
(7, 'exclude_search_index', 'Exclude From Search Index', 1, 1, 0, 0, 1, 3, 1, 0),
(8, 'exclude_sitemapxml', 'Exclude From sitemap.xml', 1, 1, 0, 0, 1, 3, 1, 0),
(9, 'profile_private_messages_enabled', 'I would like to receive private messages.', 1, 1, 0, 0, 1, 3, 2, 0),
(10, 'profile_private_messages_notification_enabled', 'Send me email notifications when I receive a private message.', 1, 1, 0, 0, 1, 3, 2, 0),
(11, 'width', 'Width', 1, 1, 0, 0, 1, 6, 3, 0),
(12, 'height', 'Height', 1, 1, 0, 0, 1, 6, 3, 0);

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

INSERT INTO `AttributeSetKeys` (`akID`, `asID`, `displayOrder`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(6, 1, 4),
(4, 2, 1),
(5, 2, 2),
(7, 2, 3),
(8, 2, 4);

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
  `asIsLocked` int(1) NOT NULL DEFAULT '1',
  `asDisplayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`asID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `AttributeSets`
--

INSERT INTO `AttributeSets` (`asID`, `asName`, `asHandle`, `akCategoryID`, `pkgID`, `asIsLocked`, `asDisplayOrder`) VALUES
(1, 'Page Header', 'page_header', 1, 0, 0, 0),
(2, 'Navigation and Indexing', 'navigation', 1, 0, 0, 1);

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
(2, 'textarea', 'Textarea', 0),
(3, 'boolean', 'Boolean', 0),
(4, 'date_time', 'Date Time', 0),
(5, 'image_file', 'Image File', 0),
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=73 ;

--
-- Dumping data for table `AttributeValues`
--

INSERT INTO `AttributeValues` (`avID`, `akID`, `avDateAdded`, `uID`, `atID`) VALUES
(1, 3, '2012-01-17 16:42:30', 1, 2),
(2, 3, '2012-01-17 16:42:30', 1, 2),
(3, 3, '2012-01-17 16:42:30', 1, 2),
(4, 3, '2012-01-17 16:42:30', 1, 2),
(5, 3, '2012-01-17 16:42:30', 1, 2),
(6, 3, '2012-01-17 16:42:30', 1, 2),
(7, 3, '2012-01-17 16:42:30', 1, 2),
(8, 3, '2012-01-17 16:42:30', 1, 2),
(9, 3, '2012-01-17 16:42:30', 1, 2),
(10, 3, '2012-01-17 16:42:30', 1, 2),
(11, 4, '2012-01-17 16:42:31', 1, 3),
(12, 3, '2012-01-17 16:42:31', 1, 2),
(13, 3, '2012-01-17 16:42:31', 1, 2),
(14, 3, '2012-01-17 16:42:31', 1, 2),
(15, 3, '2012-01-17 16:42:31', 1, 2),
(16, 3, '2012-01-17 16:42:31', 1, 2),
(17, 3, '2012-01-17 16:42:31', 1, 2),
(18, 3, '2012-01-17 16:42:31', 1, 2),
(19, 3, '2012-01-17 16:42:31', 1, 2),
(20, 3, '2012-01-17 16:42:31', 1, 2),
(21, 3, '2012-01-17 16:42:31', 1, 2),
(22, 3, '2012-01-17 16:42:31', 1, 2),
(23, 3, '2012-01-17 16:42:31', 1, 2),
(24, 3, '2012-01-17 16:42:31', 1, 2),
(25, 3, '2012-01-17 16:42:31', 1, 2),
(26, 3, '2012-01-17 16:42:31', 1, 2),
(27, 3, '2012-01-17 16:42:31', 1, 2),
(28, 3, '2012-01-17 16:42:31', 1, 2),
(29, 4, '2012-01-17 16:42:31', 1, 3),
(30, 7, '2012-01-17 16:42:31', 1, 3),
(31, 4, '2012-01-17 16:42:31', 1, 3),
(32, 3, '2012-01-17 16:42:31', 1, 2),
(33, 3, '2012-01-17 16:42:31', 1, 2),
(34, 3, '2012-01-17 16:42:31', 1, 2),
(35, 3, '2012-01-17 16:42:31', 1, 2),
(36, 3, '2012-01-17 16:42:31', 1, 2),
(37, 4, '2012-01-17 16:42:31', 1, 3),
(38, 3, '2012-01-17 16:42:31', 1, 2),
(39, 3, '2012-01-17 16:42:31', 1, 2),
(40, 3, '2012-01-17 16:42:31', 1, 2),
(41, 3, '2012-01-17 16:42:31', 1, 2),
(42, 3, '2012-01-17 16:42:31', 1, 2),
(43, 3, '2012-01-17 16:42:31', 1, 2),
(44, 3, '2012-01-17 16:42:31', 1, 2),
(45, 3, '2012-01-17 16:42:31', 1, 2),
(46, 3, '2012-01-17 16:42:31', 1, 2),
(47, 3, '2012-01-17 16:42:31', 1, 2),
(48, 3, '2012-01-17 16:42:31', 1, 2),
(49, 3, '2012-01-17 16:42:31', 1, 2),
(50, 3, '2012-01-17 16:42:31', 1, 2),
(51, 3, '2012-01-17 16:42:31', 1, 2),
(52, 3, '2012-01-17 16:42:31', 1, 2),
(53, 3, '2012-01-17 16:42:31', 1, 2),
(54, 3, '2012-01-17 16:42:31', 1, 2),
(55, 3, '2012-01-17 16:42:31', 1, 2),
(56, 3, '2012-01-17 16:42:31', 1, 2),
(57, 3, '2012-01-17 16:42:31', 1, 2),
(58, 3, '2012-01-17 16:42:32', 1, 2),
(59, 3, '2012-01-17 16:42:32', 1, 2),
(60, 3, '2012-01-17 16:42:32', 1, 2),
(61, 3, '2012-01-17 16:42:32', 1, 2),
(62, 3, '2012-01-17 16:42:32', 1, 2),
(63, 3, '2012-01-17 16:42:32', 1, 2),
(64, 3, '2012-01-17 16:42:32', 1, 2),
(65, 3, '2012-01-17 16:42:32', 1, 2),
(66, 3, '2012-01-17 16:42:32', 1, 2),
(67, 3, '2012-01-17 16:42:32', 1, 2),
(68, 3, '2012-01-17 16:42:32', 1, 2),
(69, 3, '2012-01-17 16:42:32', 1, 2),
(70, 4, '2012-01-17 16:42:32', 1, 3),
(71, 4, '2012-01-17 16:42:32', 1, 3),
(72, 7, '2012-01-17 16:42:32', 1, 3);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `BlockTypes`
--

INSERT INTO `BlockTypes` (`btID`, `btHandle`, `btName`, `btDescription`, `btActiveWhenAdded`, `btCopyWhenPropagate`, `btIncludeAll`, `btIsInternal`, `btInterfaceWidth`, `btInterfaceHeight`, `pkgID`) VALUES
(1, 'core_scrapbook_display', 'Scrapbook Display (Core)', 'Proxy block for blocks pasted through the scrapbook.', 1, 0, 0, 1, 400, 400, 0),
(2, 'core_stack_display', 'Stack Display (Core)', 'Proxy block for stacks added through the UI.', 1, 0, 0, 1, 400, 400, 0),
(3, 'dashboard_featured_addon', 'Dashboard Featured Add-On', 'Features an add-on from concrete5.org.', 1, 0, 0, 1, 300, 100, 0),
(4, 'dashboard_featured_theme', 'Dashboard Featured Theme', 'Features a theme from concrete5.org.', 1, 0, 0, 1, 300, 100, 0),
(5, 'dashboard_newsflow_latest', 'Dashboard Newsflow Latest', 'Grabs the latest newsflow data from concrete5.org.', 1, 0, 0, 1, 400, 400, 0),
(6, 'dashboard_app_status', 'Dashboard App Status', 'Displays update and welcome back information on your dashboard.', 1, 0, 0, 1, 400, 400, 0),
(7, 'dashboard_site_activity', 'Dashboard Site Activity', 'Displays a summary of website activity.', 1, 0, 0, 1, 400, 400, 0),
(8, 'autonav', 'Auto-Nav', 'Creates navigation trees and sitemaps.', 1, 0, 0, 0, 500, 350, 0),
(9, 'content', 'Content', 'HTML/WYSIWYG Editor Content.', 1, 0, 0, 0, 600, 465, 0),
(10, 'date_nav', 'Date Navigation', 'A collapsible date based navigation tree', 1, 0, 0, 0, 500, 350, 0),
(11, 'external_form', 'External Form', 'Include external forms in the filesystem and place them on pages.', 1, 0, 0, 0, 370, 100, 0),
(12, 'file', 'File', 'Link to files stored in the asset library.', 1, 0, 0, 0, 300, 250, 0),
(13, 'flash_content', 'Flash Content', 'Embeds SWF files, including flash detection.', 1, 0, 0, 0, 380, 200, 0),
(14, 'form', 'Form', 'Build simple forms and surveys.', 1, 0, 0, 0, 420, 430, 0),
(15, 'google_map', 'Google Map', 'Enter an address and a Google Map of that location will be placed in your page.', 1, 0, 0, 0, 400, 200, 0),
(16, 'guestbook', 'Guestbook / Comments', 'Adds blog-style comments (a guestbook) to your page.', 1, 0, 1, 0, 350, 460, 0),
(17, 'html', 'HTML', 'For adding HTML by hand.', 1, 0, 0, 0, 600, 465, 0),
(18, 'image', 'Image', 'Adds images and onstates from the library to pages.', 1, 0, 0, 0, 300, 450, 0),
(19, 'next_previous', 'Next & Previous Nav', 'Navigate through sibling pages.', 1, 0, 0, 0, 430, 400, 0),
(20, 'page_list', 'Page List', 'List pages based on type, area.', 1, 0, 0, 0, 500, 350, 0),
(21, 'rss_displayer', 'RSS Displayer', 'Fetch, parse and display the contents of an RSS or Atom feed.', 1, 0, 0, 0, 400, 330, 0),
(22, 'search', 'Search', 'Add a search box to your site.', 1, 0, 0, 0, 400, 240, 0),
(23, 'slideshow', 'Slideshow', 'Display a running loop of images.', 1, 0, 0, 0, 550, 400, 0),
(24, 'survey', 'Survey', 'Provide a simple survey, along with results in a pie chart format.', 1, 0, 1, 0, 420, 300, 0),
(25, 'tags', 'Tags', 'List pages based on type, area.', 1, 0, 0, 0, 450, 260, 0),
(26, 'video', 'Video Player', 'Embeds uploaded video into a web page. Supports AVI, WMV, Quicktime/MPEG4 and FLV formats.', 1, 0, 0, 0, 320, 220, 0),
(27, 'youtube', 'YouTube Video', 'Embeds a YouTube Video in your web page.', 1, 0, 0, 0, 400, 210, 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `Blocks`
--

INSERT INTO `Blocks` (`bID`, `bName`, `bDateAdded`, `bDateModified`, `bFilename`, `bIsActive`, `btID`, `uID`) VALUES
(1, '', '2012-01-17 16:42:32', '2012-01-17 16:42:32', NULL, '1', 9, 1),
(2, '', '2012-01-17 16:42:32', '2012-01-17 16:42:32', NULL, '1', 9, 1),
(3, '', '2012-01-17 16:42:32', '2012-01-17 16:42:32', NULL, '1', 9, 1),
(4, '', '2012-01-17 16:42:32', '2012-01-17 16:42:32', NULL, '1', 9, 1),
(5, '', '2012-01-17 16:42:32', '2012-01-17 16:42:32', NULL, '1', 9, 1),
(6, '', '2012-01-17 16:42:32', '2012-01-17 16:42:32', NULL, '1', 6, 1),
(7, '', '2012-01-17 16:42:32', '2012-01-17 16:42:32', NULL, '1', 7, 1),
(8, '', '2012-01-17 16:42:32', '2012-01-17 16:42:32', NULL, '1', 5, 1),
(9, '', '2012-01-17 16:42:32', '2012-01-17 16:42:32', NULL, '1', 5, 1),
(10, '', '2012-01-17 16:42:32', '2012-01-17 16:42:32', NULL, '1', 4, 1),
(11, '', '2012-01-17 16:42:32', '2012-01-17 16:42:32', NULL, '1', 3, 1),
(12, '', '2012-01-17 16:42:32', '2012-01-17 16:42:32', NULL, '1', 5, 1);

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

INSERT INTO `CollectionAttributeValues` (`cID`, `cvID`, `akID`, `avID`) VALUES
(3, 1, 3, 1),
(4, 1, 3, 2),
(5, 1, 3, 3),
(6, 1, 3, 4),
(7, 1, 3, 5),
(8, 1, 3, 6),
(9, 1, 3, 7),
(11, 1, 3, 8),
(12, 1, 3, 9),
(13, 1, 3, 10),
(14, 1, 4, 11),
(15, 1, 3, 12),
(16, 1, 3, 13),
(17, 1, 3, 14),
(18, 1, 3, 15),
(19, 1, 3, 16),
(20, 1, 3, 17),
(21, 1, 3, 18),
(22, 1, 3, 19),
(23, 1, 3, 20),
(24, 1, 3, 21),
(25, 1, 3, 22),
(26, 1, 3, 23),
(27, 1, 3, 24),
(28, 1, 3, 25),
(30, 1, 3, 26),
(31, 1, 3, 27),
(33, 1, 3, 28),
(37, 1, 4, 29),
(37, 1, 7, 30),
(39, 1, 4, 31),
(40, 1, 3, 32),
(41, 1, 3, 33),
(42, 1, 3, 34),
(43, 1, 3, 35),
(44, 1, 3, 36),
(45, 1, 4, 37),
(47, 1, 3, 38),
(48, 1, 3, 39),
(49, 1, 3, 40),
(50, 1, 3, 41),
(51, 1, 3, 42),
(53, 1, 3, 43),
(54, 1, 3, 44),
(55, 1, 3, 45),
(56, 1, 3, 46),
(58, 1, 3, 47),
(59, 1, 3, 48),
(60, 1, 3, 49),
(62, 1, 3, 50),
(63, 1, 3, 51),
(64, 1, 3, 52),
(65, 1, 3, 53),
(66, 1, 3, 54),
(67, 1, 3, 55),
(68, 1, 3, 56),
(69, 1, 3, 57),
(71, 1, 3, 58),
(72, 1, 3, 59),
(73, 1, 3, 60),
(74, 1, 3, 61),
(75, 1, 3, 62),
(76, 1, 3, 63),
(77, 1, 3, 64),
(81, 1, 3, 65),
(82, 1, 3, 66),
(83, 1, 3, 67),
(84, 1, 3, 68),
(87, 1, 3, 69),
(93, 1, 4, 71),
(93, 1, 7, 72),
(94, 1, 4, 70);

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
  PRIMARY KEY (`cID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CollectionSearchIndexAttributes`
--

INSERT INTO `CollectionSearchIndexAttributes` (`cID`, `ak_meta_title`, `ak_meta_description`, `ak_meta_keywords`, `ak_exclude_nav`, `ak_exclude_page_list`, `ak_header_extra_content`, `ak_exclude_search_index`, `ak_exclude_sitemapxml`) VALUES
(2, NULL, NULL, NULL, 0, 0, NULL, 0, 0),
(3, NULL, NULL, 'blog, blogging', 0, 0, NULL, 0, 0),
(4, NULL, NULL, 'new blog, write blog', 0, 0, NULL, 0, 0),
(5, NULL, NULL, 'blog drafts,composer', 0, 0, NULL, 0, 0),
(6, NULL, NULL, 'pages, add page, delete page, copy, move, alias', 0, 0, NULL, 0, 0),
(7, NULL, NULL, 'pages, add page, delete page, copy, move, alias', 0, 0, NULL, 0, 0),
(8, NULL, NULL, 'pages, add page, delete page, copy, move, alias', 0, 0, NULL, 0, 0),
(9, NULL, NULL, 'find page, search page, search, find', 0, 0, NULL, 0, 0),
(10, NULL, NULL, NULL, 0, 0, NULL, 0, 0),
(11, NULL, NULL, 'files, add file, delete file, copy, move, alias', 0, 0, NULL, 0, 0),
(12, NULL, NULL, 'file, file attributes', 0, 0, NULL, 0, 0),
(13, NULL, NULL, 'files, category, categories', 0, 0, NULL, 0, 0),
(14, NULL, NULL, NULL, 1, 0, NULL, 0, 0),
(15, NULL, NULL, 'users, groups, people', 0, 0, NULL, 0, 0),
(16, NULL, NULL, 'find, search, people', 0, 0, NULL, 0, 0),
(17, NULL, NULL, 'user, group, people', 0, 0, NULL, 0, 0),
(18, NULL, NULL, 'user attributes', 0, 0, NULL, 0, 0),
(19, NULL, NULL, 'new user', 0, 0, NULL, 0, 0),
(20, NULL, NULL, 'new user group, new group, group', 0, 0, NULL, 0, 0),
(21, NULL, NULL, 'forms, log, error, email, mysql, exception, survey', 0, 0, NULL, 0, 0),
(22, NULL, NULL, 'hits, pageviews, visitors, activity', 0, 0, NULL, 0, 0),
(23, NULL, NULL, 'forms, questions', 0, 0, NULL, 0, 0),
(24, NULL, NULL, 'survey, questions, quiz', 0, 0, NULL, 0, 0),
(25, NULL, NULL, 'forms, log, error, email, mysql, exception, survey', 0, 0, NULL, 0, 0),
(26, NULL, NULL, 'page types, themes, single pages', 0, 0, NULL, 0, 0),
(27, NULL, NULL, 'new theme, installed theme, active theme, change theme, template, css', 0, 0, NULL, 0, 0),
(28, NULL, NULL, 'add theme', 0, 0, NULL, 0, 0),
(29, NULL, NULL, NULL, 0, 0, NULL, 0, 0),
(30, NULL, NULL, 'custom theme, change theme, custom css, css', 0, 0, NULL, 0, 0),
(31, NULL, NULL, 'page type defaults, global block, global area', 0, 0, NULL, 0, 0),
(32, NULL, NULL, NULL, 0, 0, NULL, 0, 0),
(33, NULL, NULL, 'page attributes', 0, 0, NULL, 0, 0),
(34, NULL, NULL, NULL, 0, 0, NULL, 0, 0),
(35, NULL, NULL, NULL, 0, 0, NULL, 0, 0),
(36, NULL, NULL, NULL, 0, 0, NULL, 0, 0),
(37, NULL, NULL, NULL, 1, 0, NULL, 1, 0),
(38, NULL, NULL, NULL, 0, 0, NULL, 0, 0),
(39, NULL, NULL, NULL, 1, 0, NULL, 0, 0),
(40, NULL, NULL, 'add-on, addon, add on, package,applications, ecommerce, discussions, forums, themes, templates, blocks', 0, 0, NULL, 0, 0),
(41, NULL, NULL, 'update, upgrade', 0, 0, NULL, 0, 0),
(42, NULL, NULL, 'concrete5.org, my account, marketplace', 0, 0, NULL, 0, 0),
(43, NULL, NULL, 'buy theme, new theme, install theme, marketplace, template', 0, 0, NULL, 0, 0),
(44, NULL, NULL, 'buy addon, buy add on, buy add-on, purchase addon, purchase add on, purchase add-on, find addon, new addon, marketplace', 0, 0, NULL, 0, 0),
(45, NULL, NULL, NULL, 1, 0, NULL, 0, 0),
(46, NULL, NULL, NULL, 0, 0, NULL, 0, 0),
(47, NULL, NULL, 'website name', 0, 0, NULL, 0, 0),
(48, NULL, NULL, 'logo, favicon, iphone', 0, 0, NULL, 0, 0),
(49, NULL, NULL, 'tinymce, content block, fonts, editor', 0, 0, NULL, 0, 0),
(50, NULL, NULL, 'translate, translation', 0, 0, NULL, 0, 0),
(51, NULL, NULL, 'timezone', 0, 0, NULL, 0, 0),
(52, NULL, NULL, NULL, 0, 0, NULL, 0, 0),
(53, NULL, NULL, 'vanity,pretty url, clean url, seo', 0, 0, NULL, 0, 0),
(54, NULL, NULL, 'traffic, statistics, google analytics, quant', 0, 0, NULL, 0, 0),
(55, NULL, NULL, 'turn off statistics', 0, 0, NULL, 0, 0),
(56, NULL, NULL, 'configure search, site search, search option', 0, 0, NULL, 0, 0),
(57, NULL, NULL, NULL, 0, 0, NULL, 0, 0),
(58, NULL, NULL, 'cache option, change cache, turn on cache, turn off cache, no cache, page cache, caching', 0, 0, NULL, 0, 0),
(59, NULL, NULL, 'cache option, turn off cache, no cache, page cache, caching', 0, 0, NULL, 0, 0),
(60, NULL, NULL, 'index search, reindex search, build sitemap, sitemap.xml, clear old versions, page versions, remove old', 0, 0, NULL, 0, 0),
(61, NULL, NULL, NULL, 0, 0, NULL, 0, 0),
(62, NULL, NULL, 'editors, hide site, offline, private, public', 0, 0, NULL, 0, 0),
(63, NULL, NULL, 'file options, file manager', 0, 0, NULL, 0, 0),
(64, NULL, NULL, 'security, files, media ', 0, 0, NULL, 0, 0),
(65, NULL, NULL, 'security, users, actions, administrator, admin', 0, 0, NULL, 0, 0),
(66, NULL, NULL, 'security, lock ip, lock out, block ip', 0, 0, NULL, 0, 0),
(67, NULL, NULL, 'security, registration', 0, 0, NULL, 0, 0),
(68, NULL, NULL, 'antispam, block spam, security', 0, 0, NULL, 0, 0),
(69, NULL, NULL, 'lock site, under construction', 0, 0, NULL, 0, 0),
(70, NULL, NULL, NULL, 0, 0, NULL, 0, 0),
(71, NULL, NULL, 'profile', 0, 0, NULL, 0, 0),
(72, NULL, NULL, 'member profile, member page,community', 0, 0, NULL, 0, 0),
(73, NULL, NULL, 'signup, new user, community', 0, 0, NULL, 0, 0),
(74, NULL, NULL, 'smtp, mail settings', 0, 0, NULL, 0, 0),
(75, NULL, NULL, 'email server, mail settings, mail configuration', 0, 0, NULL, 0, 0),
(76, NULL, NULL, 'email server, mail settings, mail configuration, private message, message system', 0, 0, NULL, 0, 0),
(77, NULL, NULL, 'attribute configuration', 0, 0, NULL, 0, 0),
(78, NULL, NULL, NULL, 0, 0, NULL, 0, 0),
(79, NULL, NULL, NULL, 0, 0, NULL, 0, 0),
(80, NULL, NULL, NULL, 0, 0, NULL, 0, 0),
(81, NULL, NULL, 'overrides, system info, debug, support,help', 0, 0, NULL, 0, 0),
(82, NULL, NULL, 'errors,exceptions, develop, support, help', 0, 0, NULL, 0, 0),
(83, NULL, NULL, 'logs, email, error, exceptions', 0, 0, NULL, 0, 0),
(84, NULL, NULL, 'security, alternate storage, hide files', 0, 0, NULL, 0, 0),
(85, NULL, NULL, NULL, 0, 0, NULL, 0, 0),
(86, NULL, NULL, NULL, 0, 0, NULL, 0, 0),
(87, NULL, NULL, 'upgrade, new version', 0, 0, NULL, 0, 0),
(88, NULL, NULL, NULL, 0, 0, NULL, 0, 0),
(89, NULL, NULL, NULL, 0, 0, NULL, 0, 0),
(93, NULL, NULL, NULL, 1, 0, NULL, 1, 0),
(94, NULL, NULL, NULL, 1, 0, NULL, 0, 0),
(95, NULL, NULL, NULL, 0, 0, NULL, 0, 0),
(96, NULL, NULL, NULL, 0, 0, NULL, 0, 0),
(97, NULL, NULL, NULL, 0, 0, NULL, 0, 0),
(98, NULL, NULL, NULL, 0, 0, NULL, 0, 0),
(99, NULL, NULL, NULL, 0, 0, NULL, 0, 0),
(100, NULL, NULL, NULL, 0, 0, NULL, 0, 0),
(101, NULL, NULL, NULL, 0, 0, NULL, 0, 0),
(102, NULL, NULL, NULL, 0, 0, NULL, 0, 0),
(103, NULL, NULL, NULL, 0, 0, NULL, 0, 0),
(104, NULL, NULL, NULL, 0, 0, NULL, 0, 0),
(105, NULL, NULL, NULL, 0, 0, NULL, 0, 0),
(106, NULL, NULL, NULL, 0, 0, NULL, 0, 0),
(107, NULL, NULL, NULL, 0, 0, NULL, 0, 0),
(108, NULL, NULL, NULL, 0, 0, NULL, 0, 0),
(1, NULL, NULL, NULL, 0, 0, NULL, 0, 0);

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
  `isOriginal` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `cbOverrideAreaPermissions` tinyint(1) NOT NULL DEFAULT '0',
  `cbIncludeAll` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`cvID`,`bID`,`arHandle`),
  KEY `cbIncludeAll` (`cbIncludeAll`),
  KEY `isOriginal` (`isOriginal`),
  KEY `bID` (`bID`),
  KEY `cIDcvID` (`cID`,`cvID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CollectionVersionBlocks`
--

INSERT INTO `CollectionVersionBlocks` (`cID`, `cvID`, `bID`, `arHandle`, `cbDisplayOrder`, `isOriginal`, `cbOverrideAreaPermissions`, `cbIncludeAll`) VALUES
(94, 1, 1, 'Header', 0, 1, 0, 0),
(94, 1, 2, 'Column 1', 0, 1, 0, 0),
(94, 1, 3, 'Column 2', 0, 1, 0, 0),
(94, 1, 4, 'Column 3', 0, 1, 0, 0),
(94, 1, 5, 'Column 4', 0, 1, 0, 0),
(93, 1, 6, 'Primary', 0, 1, 0, 0),
(93, 1, 7, 'Primary', 1, 1, 0, 0),
(93, 1, 8, 'Secondary 1', 0, 1, 0, 0),
(93, 1, 9, 'Secondary 2', 0, 1, 0, 0),
(93, 1, 10, 'Secondary 3', 0, 1, 0, 0),
(93, 1, 11, 'Secondary 4', 0, 1, 0, 0),
(93, 1, 12, 'Secondary 5', 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `CollectionVersionRelatedEdits`
--

CREATE TABLE IF NOT EXISTS `CollectionVersionRelatedEdits` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '0',
  `cRelationID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvRelationID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`cvID`,`cRelationID`,`cvRelationID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CollectionVersionRelatedEdits`
--


-- --------------------------------------------------------

--
-- Table structure for table `CollectionVersions`
--

CREATE TABLE IF NOT EXISTS `CollectionVersions` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '1',
  `cvName` text,
  `cvHandle` varchar(255) DEFAULT NULL,
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
  KEY `cvIsApproved` (`cvIsApproved`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CollectionVersions`
--

INSERT INTO `CollectionVersions` (`cID`, `cvID`, `cvName`, `cvHandle`, `cvDescription`, `cvDatePublic`, `cvDateCreated`, `cvComments`, `cvIsApproved`, `cvIsNew`, `cvAuthorUID`, `cvApproverUID`, `cvActivateDatetime`) VALUES
(1, 1, 'Home', 'home', '', '2012-01-17 16:42:21', '2012-01-17 16:42:21', 'Initial Version', 1, 0, 1, NULL, NULL),
(2, 1, 'Dashboard', 'dashboard', '', '2012-01-17 16:42:24', '2012-01-17 16:42:24', 'Initial Version', 1, 0, 1, NULL, NULL),
(3, 1, 'Composer', 'composer', 'Write for your site.', '2012-01-17 16:42:24', '2012-01-17 16:42:24', 'Initial Version', 1, 0, 1, NULL, NULL),
(4, 1, 'Write', 'write', '', '2012-01-17 16:42:24', '2012-01-17 16:42:24', 'Initial Version', 1, 0, 1, NULL, NULL),
(5, 1, 'Drafts', 'drafts', '', '2012-01-17 16:42:25', '2012-01-17 16:42:25', 'Initial Version', 1, 0, 1, NULL, NULL),
(6, 1, 'Sitemap', 'sitemap', 'Whole world at a glance.', '2012-01-17 16:42:25', '2012-01-17 16:42:25', 'Initial Version', 1, 0, 1, NULL, NULL),
(7, 1, 'Full Sitemap', 'full', '', '2012-01-17 16:42:25', '2012-01-17 16:42:25', 'Initial Version', 1, 0, 1, NULL, NULL),
(8, 1, 'Flat View', 'explore', '', '2012-01-17 16:42:25', '2012-01-17 16:42:25', 'Initial Version', 1, 0, 1, NULL, NULL),
(9, 1, 'Page Search', 'search', '', '2012-01-17 16:42:25', '2012-01-17 16:42:25', 'Initial Version', 1, 0, 1, NULL, NULL),
(10, 1, 'Files', 'files', 'All documents and images.', '2012-01-17 16:42:25', '2012-01-17 16:42:25', 'Initial Version', 1, 0, 1, NULL, NULL),
(11, 1, 'File Manager', 'search', '', '2012-01-17 16:42:25', '2012-01-17 16:42:25', 'Initial Version', 1, 0, 1, NULL, NULL),
(12, 1, 'Attributes', 'attributes', '', '2012-01-17 16:42:25', '2012-01-17 16:42:25', 'Initial Version', 1, 0, 1, NULL, NULL),
(13, 1, 'File Sets', 'sets', '', '2012-01-17 16:42:25', '2012-01-17 16:42:25', 'Initial Version', 1, 0, 1, NULL, NULL),
(14, 1, 'Add File Set', 'add_set', '', '2012-01-17 16:42:25', '2012-01-17 16:42:25', 'Initial Version', 1, 0, 1, NULL, NULL),
(15, 1, 'Members', 'users', 'Add and manage the user accounts and groups on your website.', '2012-01-17 16:42:25', '2012-01-17 16:42:25', 'Initial Version', 1, 0, 1, NULL, NULL),
(16, 1, 'Search Users', 'search', '', '2012-01-17 16:42:25', '2012-01-17 16:42:25', 'Initial Version', 1, 0, 1, NULL, NULL),
(17, 1, 'User Groups', 'groups', '', '2012-01-17 16:42:25', '2012-01-17 16:42:25', 'Initial Version', 1, 0, 1, NULL, NULL),
(18, 1, 'Attributes', 'attributes', '', '2012-01-17 16:42:25', '2012-01-17 16:42:25', 'Initial Version', 1, 0, 1, NULL, NULL),
(19, 1, 'Add User', 'add', '', '2012-01-17 16:42:25', '2012-01-17 16:42:25', 'Initial Version', 1, 0, 1, NULL, NULL),
(20, 1, 'Add Group', 'add_group', '', '2012-01-17 16:42:26', '2012-01-17 16:42:26', 'Initial Version', 1, 0, 1, NULL, NULL),
(21, 1, 'Reports', 'reports', 'Get data from forms and logs.', '2012-01-17 16:42:26', '2012-01-17 16:42:26', 'Initial Version', 1, 0, 1, NULL, NULL),
(22, 1, 'Statistics', 'statistics', 'View your site activity.', '2012-01-17 16:42:26', '2012-01-17 16:42:26', 'Initial Version', 1, 0, 1, NULL, NULL),
(23, 1, 'Form Results', 'forms', 'Get submission data.', '2012-01-17 16:42:26', '2012-01-17 16:42:26', 'Initial Version', 1, 0, 1, NULL, NULL),
(24, 1, 'Surveys', 'surveys', '', '2012-01-17 16:42:26', '2012-01-17 16:42:26', 'Initial Version', 1, 0, 1, NULL, NULL),
(25, 1, 'Logs', 'logs', '', '2012-01-17 16:42:26', '2012-01-17 16:42:26', 'Initial Version', 1, 0, 1, NULL, NULL),
(26, 1, 'Pages & Themes', 'pages', 'Reskin your site.', '2012-01-17 16:42:26', '2012-01-17 16:42:26', 'Initial Version', 1, 0, 1, NULL, NULL),
(27, 1, 'Themes', 'themes', 'Reskin your site.', '2012-01-17 16:42:26', '2012-01-17 16:42:26', 'Initial Version', 1, 0, 1, NULL, NULL),
(28, 1, 'Add', 'add', '', '2012-01-17 16:42:26', '2012-01-17 16:42:26', 'Initial Version', 1, 0, 1, NULL, NULL),
(29, 1, 'Inspect', 'inspect', '', '2012-01-17 16:42:26', '2012-01-17 16:42:26', 'Initial Version', 1, 0, 1, NULL, NULL),
(30, 1, 'Customize', 'customize', '', '2012-01-17 16:42:26', '2012-01-17 16:42:26', 'Initial Version', 1, 0, 1, NULL, NULL),
(31, 1, 'Page Types', 'types', 'What goes in your site.', '2012-01-17 16:42:26', '2012-01-17 16:42:26', 'Initial Version', 1, 0, 1, NULL, NULL),
(32, 1, 'Add Page Type', 'add', 'Add page types to your site.', '2012-01-17 16:42:26', '2012-01-17 16:42:26', 'Initial Version', 1, 0, 1, NULL, NULL),
(33, 1, 'Attributes', 'attributes', '', '2012-01-17 16:42:26', '2012-01-17 16:42:26', 'Initial Version', 1, 0, 1, NULL, NULL),
(34, 1, 'Single Pages', 'single', '', '2012-01-17 16:42:27', '2012-01-17 16:42:27', 'Initial Version', 1, 0, 1, NULL, NULL),
(35, 1, 'Stacks & Blocks', 'blocks', 'Manage sitewide content and administer block types.', '2012-01-17 16:42:27', '2012-01-17 16:42:27', 'Initial Version', 1, 0, 1, NULL, NULL),
(36, 1, 'Stacks', 'stacks', 'Share content across your site.', '2012-01-17 16:42:27', '2012-01-17 16:42:27', 'Initial Version', 1, 0, 1, NULL, NULL),
(37, 1, 'Stack List', 'list', '', '2012-01-17 16:42:27', '2012-01-17 16:42:27', 'Initial Version', 1, 0, 1, NULL, NULL),
(38, 1, 'Block Types', 'types', 'Manage the installed block types in your site.', '2012-01-17 16:42:27', '2012-01-17 16:42:27', 'Initial Version', 1, 0, 1, NULL, NULL),
(39, 1, 'Extend concrete5', 'extend', 'Connect to the concrete5 marketplace, install custom add-ons, and download updates for marketplace add-ons and themes.', '2012-01-17 16:42:27', '2012-01-17 16:42:27', 'Initial Version', 1, 0, 1, NULL, NULL),
(40, 1, 'Add Functionality', 'install', 'Install add-ons & themes.', '2012-01-17 16:42:27', '2012-01-17 16:42:27', 'Initial Version', 1, 0, 1, NULL, NULL),
(41, 1, 'Update Add-Ons', 'update', 'Update your installed packages.', '2012-01-17 16:42:27', '2012-01-17 16:42:27', 'Initial Version', 1, 0, 1, NULL, NULL),
(42, 1, 'Connect to the Community', 'connect', 'Connect to the concrete5 community.', '2012-01-17 16:42:27', '2012-01-17 16:42:27', 'Initial Version', 1, 0, 1, NULL, NULL),
(43, 1, 'Get More Themes', 'themes', 'Download themes from concrete5.org.', '2012-01-17 16:42:27', '2012-01-17 16:42:27', 'Initial Version', 1, 0, 1, NULL, NULL),
(44, 1, 'Get More Add-Ons', 'add-ons', 'Download add-ons from concrete5.org.', '2012-01-17 16:42:27', '2012-01-17 16:42:27', 'Initial Version', 1, 0, 1, NULL, NULL),
(45, 1, 'System & Settings', 'system', 'Secure and setup your site.', '2012-01-17 16:42:27', '2012-01-17 16:42:27', 'Initial Version', 1, 0, 1, NULL, NULL),
(46, 1, 'Basics', 'basics', 'Basic information about your website.', '2012-01-17 16:42:27', '2012-01-17 16:42:27', 'Initial Version', 1, 0, 1, NULL, NULL),
(47, 1, 'Site Name', 'site_name', '', '2012-01-17 16:42:27', '2012-01-17 16:42:27', 'Initial Version', 1, 0, 1, NULL, NULL),
(48, 1, 'Bookmark Icons', 'icons', 'Bookmark icon and mobile home screen icon setup.', '2012-01-17 16:42:27', '2012-01-17 16:42:27', 'Initial Version', 1, 0, 1, NULL, NULL),
(49, 1, 'Rich Text Editor', 'editor', '', '2012-01-17 16:42:28', '2012-01-17 16:42:28', 'Initial Version', 1, 0, 1, NULL, NULL),
(50, 1, 'Languages', 'multilingual', '', '2012-01-17 16:42:28', '2012-01-17 16:42:28', 'Initial Version', 1, 0, 1, NULL, NULL),
(51, 1, 'Time Zone', 'timezone', '', '2012-01-17 16:42:28', '2012-01-17 16:42:28', 'Initial Version', 1, 0, 1, NULL, NULL),
(52, 1, 'SEO & Statistics', 'seo', 'Enable pretty URLs, statistics and tracking codes.', '2012-01-17 16:42:28', '2012-01-17 16:42:28', 'Initial Version', 1, 0, 1, NULL, NULL),
(53, 1, 'Pretty URLs', 'urls', '', '2012-01-17 16:42:28', '2012-01-17 16:42:28', 'Initial Version', 1, 0, 1, NULL, NULL),
(54, 1, 'Tracking Codes', 'tracking_codes', '', '2012-01-17 16:42:28', '2012-01-17 16:42:28', 'Initial Version', 1, 0, 1, NULL, NULL),
(55, 1, 'Statistics', 'statistics', '', '2012-01-17 16:42:28', '2012-01-17 16:42:28', 'Initial Version', 1, 0, 1, NULL, NULL),
(56, 1, 'Search Index', 'search_index', '', '2012-01-17 16:42:28', '2012-01-17 16:42:28', 'Initial Version', 1, 0, 1, NULL, NULL),
(57, 1, 'Optimization', 'optimization', 'Keep your site running well.', '2012-01-17 16:42:28', '2012-01-17 16:42:28', 'Initial Version', 1, 0, 1, NULL, NULL),
(58, 1, 'Cache & Speed Settings', 'cache', '', '2012-01-17 16:42:28', '2012-01-17 16:42:28', 'Initial Version', 1, 0, 1, NULL, NULL),
(59, 1, 'Clear Cache', 'clear_cache', '', '2012-01-17 16:42:28', '2012-01-17 16:42:28', 'Initial Version', 1, 0, 1, NULL, NULL),
(60, 1, 'Automated Jobs', 'jobs', '', '2012-01-17 16:42:28', '2012-01-17 16:42:28', 'Initial Version', 1, 0, 1, NULL, NULL),
(61, 1, 'Permissions & Access', 'permissions', 'Control who sees and edits your site.', '2012-01-17 16:42:28', '2012-01-17 16:42:28', 'Initial Version', 1, 0, 1, NULL, NULL),
(62, 1, 'Site Access', 'site', '', '2012-01-17 16:42:28', '2012-01-17 16:42:28', 'Initial Version', 1, 0, 1, NULL, NULL),
(63, 1, 'File Manager Permissions', 'files', '', '2012-01-17 16:42:29', '2012-01-17 16:42:29', 'Initial Version', 1, 0, 1, NULL, NULL),
(64, 1, 'Allowed File Types', 'file_types', '', '2012-01-17 16:42:29', '2012-01-17 16:42:29', 'Initial Version', 1, 0, 1, NULL, NULL),
(65, 1, 'Task Permissions', 'tasks', '', '2012-01-17 16:42:29', '2012-01-17 16:42:29', 'Initial Version', 1, 0, 1, NULL, NULL),
(66, 1, 'IP Blacklist', 'ip_blacklist', '', '2012-01-17 16:42:29', '2012-01-17 16:42:29', 'Initial Version', 1, 0, 1, NULL, NULL),
(67, 1, 'Captcha Setup', 'captcha', '', '2012-01-17 16:42:29', '2012-01-17 16:42:29', 'Initial Version', 1, 0, 1, NULL, NULL),
(68, 1, 'Spam Control', 'antispam', '', '2012-01-17 16:42:29', '2012-01-17 16:42:29', 'Initial Version', 1, 0, 1, NULL, NULL),
(69, 1, 'Maintenance Mode', 'maintenance_mode', '', '2012-01-17 16:42:29', '2012-01-17 16:42:29', 'Initial Version', 1, 0, 1, NULL, NULL),
(70, 1, 'Login & Registration', 'registration', 'Change login behaviors and setup public profiles.', '2012-01-17 16:42:29', '2012-01-17 16:42:29', 'Initial Version', 1, 0, 1, NULL, NULL),
(71, 1, 'Login Destination', 'postlogin', '', '2012-01-17 16:42:29', '2012-01-17 16:42:29', 'Initial Version', 1, 0, 1, NULL, NULL),
(72, 1, 'Public Profiles', 'profiles', '', '2012-01-17 16:42:29', '2012-01-17 16:42:29', 'Initial Version', 1, 0, 1, NULL, NULL),
(73, 1, 'Public Registration', 'public_registration', '', '2012-01-17 16:42:29', '2012-01-17 16:42:29', 'Initial Version', 1, 0, 1, NULL, NULL),
(74, 1, 'Email', 'mail', 'Control how your site send and processes mail.', '2012-01-17 16:42:29', '2012-01-17 16:42:29', 'Initial Version', 1, 0, 1, NULL, NULL),
(75, 1, 'SMTP Method', 'method', '', '2012-01-17 16:42:29', '2012-01-17 16:42:29', 'Initial Version', 1, 0, 1, NULL, NULL),
(76, 1, 'Email Importers', 'importers', '', '2012-01-17 16:42:29', '2012-01-17 16:42:29', 'Initial Version', 1, 0, 1, NULL, NULL),
(77, 1, 'Attributes', 'attributes', 'Setup attributes for pages, users, files and more.', '2012-01-17 16:42:29', '2012-01-17 16:42:29', 'Initial Version', 1, 0, 1, NULL, NULL),
(78, 1, 'Sets', 'sets', 'Group attributes into sets for easier organization', '2012-01-17 16:42:29', '2012-01-17 16:42:29', 'Initial Version', 1, 0, 1, NULL, NULL),
(79, 1, 'Types', 'types', 'Choose which attribute types are available for different items.', '2012-01-17 16:42:30', '2012-01-17 16:42:30', 'Initial Version', 1, 0, 1, NULL, NULL),
(80, 1, 'Environment', 'environment', 'Advanced settings for web developers.', '2012-01-17 16:42:30', '2012-01-17 16:42:30', 'Initial Version', 1, 0, 1, NULL, NULL),
(81, 1, 'Environment Information', 'info', '', '2012-01-17 16:42:30', '2012-01-17 16:42:30', 'Initial Version', 1, 0, 1, NULL, NULL),
(82, 1, 'Debug Settings', 'debug', '', '2012-01-17 16:42:30', '2012-01-17 16:42:30', 'Initial Version', 1, 0, 1, NULL, NULL),
(83, 1, 'Logging Settings', 'logging', '', '2012-01-17 16:42:30', '2012-01-17 16:42:30', 'Initial Version', 1, 0, 1, NULL, NULL),
(84, 1, 'File Storage Locations', 'file_storage_locations', '', '2012-01-17 16:42:30', '2012-01-17 16:42:30', 'Initial Version', 1, 0, 1, NULL, NULL),
(85, 1, 'Backup & Restore', 'backup_restore', 'Backup or restore your website.', '2012-01-17 16:42:30', '2012-01-17 16:42:30', 'Initial Version', 1, 0, 1, NULL, NULL),
(86, 1, 'Backup Database', 'backup', '', '2012-01-17 16:42:30', '2012-01-17 16:42:30', 'Initial Version', 1, 0, 1, NULL, NULL),
(87, 1, 'Update concrete5', 'update', '', '2012-01-17 16:42:30', '2012-01-17 16:42:30', 'Initial Version', 1, 0, 1, NULL, NULL),
(88, 1, 'Database XML', 'database', '', '2012-01-17 16:42:30', '2012-01-17 16:42:30', 'Initial Version', 1, 0, 1, NULL, NULL),
(89, 1, 'Composer', 'composer', '', '2012-01-17 16:42:30', '2012-01-17 16:42:30', 'Initial Version', 1, 0, 1, NULL, NULL),
(90, 1, '', NULL, NULL, '2012-01-17 16:42:30', '2012-01-17 16:42:30', 'Initial Version', 1, 0, NULL, NULL, NULL),
(91, 1, '', NULL, NULL, '2012-01-17 16:42:30', '2012-01-17 16:42:30', 'Initial Version', 1, 0, NULL, NULL, NULL),
(92, 1, '', NULL, NULL, '2012-01-17 16:42:30', '2012-01-17 16:42:30', 'Initial Version', 1, 0, NULL, NULL, NULL),
(93, 1, 'Customize Dashboard Home', 'home', '', '2012-01-17 16:42:30', '2012-01-17 16:42:30', 'Initial Version', 1, 0, 1, NULL, NULL),
(94, 1, 'Welcome to concrete5', 'welcome', 'Learn about how to use concrete5, how to develop for concrete5, and get general help.', '2012-01-17 16:42:30', '2012-01-17 16:42:30', 'Initial Version', 1, 0, 1, NULL, NULL),
(95, 1, 'Drafts', '!drafts', '', '2012-01-17 16:42:32', '2012-01-17 16:42:32', 'Initial Version', 1, 0, 1, NULL, NULL),
(96, 1, 'Trash', '!trash', '', '2012-01-17 16:42:32', '2012-01-17 16:42:32', 'Initial Version', 1, 0, 1, NULL, NULL),
(97, 1, 'Stacks', '!stacks', '', '2012-01-17 16:42:32', '2012-01-17 16:42:32', 'Initial Version', 1, 0, 1, NULL, NULL),
(98, 1, 'Login', 'login', '', '2012-01-17 16:42:33', '2012-01-17 16:42:33', 'Initial Version', 1, 0, 1, NULL, NULL),
(99, 1, 'Register', 'register', '', '2012-01-17 16:42:33', '2012-01-17 16:42:33', 'Initial Version', 1, 0, 1, NULL, NULL),
(100, 1, 'Profile', 'profile', '', '2012-01-17 16:42:33', '2012-01-17 16:42:33', 'Initial Version', 1, 0, 1, NULL, NULL),
(101, 1, 'Edit', 'edit', '', '2012-01-17 16:42:33', '2012-01-17 16:42:33', 'Initial Version', 1, 0, 1, NULL, NULL),
(102, 1, 'Avatar', 'avatar', '', '2012-01-17 16:42:33', '2012-01-17 16:42:33', 'Initial Version', 1, 0, 1, NULL, NULL),
(103, 1, 'Messages', 'messages', '', '2012-01-17 16:42:33', '2012-01-17 16:42:33', 'Initial Version', 1, 0, 1, NULL, NULL),
(104, 1, 'Friends', 'friends', '', '2012-01-17 16:42:33', '2012-01-17 16:42:33', 'Initial Version', 1, 0, 1, NULL, NULL),
(105, 1, 'Page Not Found', 'page_not_found', '', '2012-01-17 16:42:33', '2012-01-17 16:42:33', 'Initial Version', 1, 0, 1, NULL, NULL),
(106, 1, 'Page Forbidden', 'page_forbidden', '', '2012-01-17 16:42:33', '2012-01-17 16:42:33', 'Initial Version', 1, 0, 1, NULL, NULL),
(107, 1, 'Download File', 'download_file', '', '2012-01-17 16:42:33', '2012-01-17 16:42:33', 'Initial Version', 1, 0, 1, NULL, NULL),
(108, 1, 'Members', 'members', '', '2012-01-17 16:42:33', '2012-01-17 16:42:33', 'Initial Version', 1, 0, 1, NULL, NULL),
(109, 1, '', NULL, NULL, '2012-01-17 16:42:33', '2012-01-17 16:42:33', 'Initial Version', 1, 0, NULL, NULL, NULL);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=110 ;

--
-- Dumping data for table `Collections`
--

INSERT INTO `Collections` (`cID`, `cDateAdded`, `cDateModified`, `cHandle`) VALUES
(1, '2012-01-17 16:42:21', '2012-01-17 16:42:33', 'home'),
(2, '2012-01-17 16:42:24', '2012-01-17 16:42:24', 'dashboard'),
(3, '2012-01-17 16:42:24', '2012-01-17 16:42:24', 'composer'),
(4, '2012-01-17 16:42:24', '2012-01-17 16:42:25', 'write'),
(5, '2012-01-17 16:42:25', '2012-01-17 16:42:25', 'drafts'),
(6, '2012-01-17 16:42:25', '2012-01-17 16:42:25', 'sitemap'),
(7, '2012-01-17 16:42:25', '2012-01-17 16:42:25', 'full'),
(8, '2012-01-17 16:42:25', '2012-01-17 16:42:25', 'explore'),
(9, '2012-01-17 16:42:25', '2012-01-17 16:42:25', 'search'),
(10, '2012-01-17 16:42:25', '2012-01-17 16:42:25', 'files'),
(11, '2012-01-17 16:42:25', '2012-01-17 16:42:25', 'search'),
(12, '2012-01-17 16:42:25', '2012-01-17 16:42:25', 'attributes'),
(13, '2012-01-17 16:42:25', '2012-01-17 16:42:25', 'sets'),
(14, '2012-01-17 16:42:25', '2012-01-17 16:42:25', 'add_set'),
(15, '2012-01-17 16:42:25', '2012-01-17 16:42:25', 'users'),
(16, '2012-01-17 16:42:25', '2012-01-17 16:42:25', 'search'),
(17, '2012-01-17 16:42:25', '2012-01-17 16:42:25', 'groups'),
(18, '2012-01-17 16:42:25', '2012-01-17 16:42:25', 'attributes'),
(19, '2012-01-17 16:42:25', '2012-01-17 16:42:26', 'add'),
(20, '2012-01-17 16:42:26', '2012-01-17 16:42:26', 'add_group'),
(21, '2012-01-17 16:42:26', '2012-01-17 16:42:26', 'reports'),
(22, '2012-01-17 16:42:26', '2012-01-17 16:42:26', 'statistics'),
(23, '2012-01-17 16:42:26', '2012-01-17 16:42:26', 'forms'),
(24, '2012-01-17 16:42:26', '2012-01-17 16:42:26', 'surveys'),
(25, '2012-01-17 16:42:26', '2012-01-17 16:42:26', 'logs'),
(26, '2012-01-17 16:42:26', '2012-01-17 16:42:26', 'pages'),
(27, '2012-01-17 16:42:26', '2012-01-17 16:42:26', 'themes'),
(28, '2012-01-17 16:42:26', '2012-01-17 16:42:26', 'add'),
(29, '2012-01-17 16:42:26', '2012-01-17 16:42:26', 'inspect'),
(30, '2012-01-17 16:42:26', '2012-01-17 16:42:26', 'customize'),
(31, '2012-01-17 16:42:26', '2012-01-17 16:42:26', 'types'),
(32, '2012-01-17 16:42:26', '2012-01-17 16:42:26', 'add'),
(33, '2012-01-17 16:42:26', '2012-01-17 16:42:26', 'attributes'),
(34, '2012-01-17 16:42:27', '2012-01-17 16:42:27', 'single'),
(35, '2012-01-17 16:42:27', '2012-01-17 16:42:27', 'blocks'),
(36, '2012-01-17 16:42:27', '2012-01-17 16:42:27', 'stacks'),
(37, '2012-01-17 16:42:27', '2012-01-17 16:42:27', 'list'),
(38, '2012-01-17 16:42:27', '2012-01-17 16:42:27', 'types'),
(39, '2012-01-17 16:42:27', '2012-01-17 16:42:27', 'extend'),
(40, '2012-01-17 16:42:27', '2012-01-17 16:42:27', 'install'),
(41, '2012-01-17 16:42:27', '2012-01-17 16:42:27', 'update'),
(42, '2012-01-17 16:42:27', '2012-01-17 16:42:27', 'connect'),
(43, '2012-01-17 16:42:27', '2012-01-17 16:42:27', 'themes'),
(44, '2012-01-17 16:42:27', '2012-01-17 16:42:27', 'add-ons'),
(45, '2012-01-17 16:42:27', '2012-01-17 16:42:27', 'system'),
(46, '2012-01-17 16:42:27', '2012-01-17 16:42:27', 'basics'),
(47, '2012-01-17 16:42:27', '2012-01-17 16:42:27', 'site_name'),
(48, '2012-01-17 16:42:27', '2012-01-17 16:42:28', 'icons'),
(49, '2012-01-17 16:42:28', '2012-01-17 16:42:28', 'editor'),
(50, '2012-01-17 16:42:28', '2012-01-17 16:42:28', 'multilingual'),
(51, '2012-01-17 16:42:28', '2012-01-17 16:42:28', 'timezone'),
(52, '2012-01-17 16:42:28', '2012-01-17 16:42:28', 'seo'),
(53, '2012-01-17 16:42:28', '2012-01-17 16:42:28', 'urls'),
(54, '2012-01-17 16:42:28', '2012-01-17 16:42:28', 'tracking_codes'),
(55, '2012-01-17 16:42:28', '2012-01-17 16:42:28', 'statistics'),
(56, '2012-01-17 16:42:28', '2012-01-17 16:42:28', 'search_index'),
(57, '2012-01-17 16:42:28', '2012-01-17 16:42:28', 'optimization'),
(58, '2012-01-17 16:42:28', '2012-01-17 16:42:28', 'cache'),
(59, '2012-01-17 16:42:28', '2012-01-17 16:42:28', 'clear_cache'),
(60, '2012-01-17 16:42:28', '2012-01-17 16:42:28', 'jobs'),
(61, '2012-01-17 16:42:28', '2012-01-17 16:42:28', 'permissions'),
(62, '2012-01-17 16:42:28', '2012-01-17 16:42:28', 'site'),
(63, '2012-01-17 16:42:29', '2012-01-17 16:42:29', 'files'),
(64, '2012-01-17 16:42:29', '2012-01-17 16:42:29', 'file_types'),
(65, '2012-01-17 16:42:29', '2012-01-17 16:42:29', 'tasks'),
(66, '2012-01-17 16:42:29', '2012-01-17 16:42:29', 'ip_blacklist'),
(67, '2012-01-17 16:42:29', '2012-01-17 16:42:29', 'captcha'),
(68, '2012-01-17 16:42:29', '2012-01-17 16:42:29', 'antispam'),
(69, '2012-01-17 16:42:29', '2012-01-17 16:42:29', 'maintenance_mode'),
(70, '2012-01-17 16:42:29', '2012-01-17 16:42:29', 'registration'),
(71, '2012-01-17 16:42:29', '2012-01-17 16:42:29', 'postlogin'),
(72, '2012-01-17 16:42:29', '2012-01-17 16:42:29', 'profiles'),
(73, '2012-01-17 16:42:29', '2012-01-17 16:42:29', 'public_registration'),
(74, '2012-01-17 16:42:29', '2012-01-17 16:42:29', 'mail'),
(75, '2012-01-17 16:42:29', '2012-01-17 16:42:29', 'method'),
(76, '2012-01-17 16:42:29', '2012-01-17 16:42:29', 'importers'),
(77, '2012-01-17 16:42:29', '2012-01-17 16:42:29', 'attributes'),
(78, '2012-01-17 16:42:29', '2012-01-17 16:42:30', 'sets'),
(79, '2012-01-17 16:42:30', '2012-01-17 16:42:30', 'types'),
(80, '2012-01-17 16:42:30', '2012-01-17 16:42:30', 'environment'),
(81, '2012-01-17 16:42:30', '2012-01-17 16:42:30', 'info'),
(82, '2012-01-17 16:42:30', '2012-01-17 16:42:30', 'debug'),
(83, '2012-01-17 16:42:30', '2012-01-17 16:42:30', 'logging'),
(84, '2012-01-17 16:42:30', '2012-01-17 16:42:30', 'file_storage_locations'),
(85, '2012-01-17 16:42:30', '2012-01-17 16:42:30', 'backup_restore'),
(86, '2012-01-17 16:42:30', '2012-01-17 16:42:30', 'backup'),
(87, '2012-01-17 16:42:30', '2012-01-17 16:42:30', 'update'),
(88, '2012-01-17 16:42:30', '2012-01-17 16:42:30', 'database'),
(89, '2012-01-17 16:42:30', '2012-01-17 16:42:30', 'composer'),
(90, '2012-01-17 16:42:30', '2012-01-17 16:42:30', NULL),
(91, '2012-01-17 16:42:30', '2012-01-17 16:42:30', NULL),
(92, '2012-01-17 16:42:30', '2012-01-17 16:42:30', NULL),
(93, '2012-01-17 16:42:30', '2012-01-17 16:42:30', 'home'),
(94, '2012-01-17 16:42:30', '2012-01-17 16:42:30', 'welcome'),
(95, '2012-01-17 16:42:32', '2012-01-17 16:42:32', '!drafts'),
(96, '2012-01-17 16:42:32', '2012-01-17 16:42:32', '!trash'),
(97, '2012-01-17 16:42:32', '2012-01-17 16:42:32', '!stacks'),
(98, '2012-01-17 16:42:33', '2012-01-17 16:42:33', 'login'),
(99, '2012-01-17 16:42:33', '2012-01-17 16:42:33', 'register'),
(100, '2012-01-17 16:42:33', '2012-01-17 16:42:33', 'profile'),
(101, '2012-01-17 16:42:33', '2012-01-17 16:42:33', 'edit'),
(102, '2012-01-17 16:42:33', '2012-01-17 16:42:33', 'avatar'),
(103, '2012-01-17 16:42:33', '2012-01-17 16:42:33', 'messages'),
(104, '2012-01-17 16:42:33', '2012-01-17 16:42:33', 'friends'),
(105, '2012-01-17 16:42:33', '2012-01-17 16:42:33', 'page_not_found'),
(106, '2012-01-17 16:42:33', '2012-01-17 16:42:33', 'page_forbidden'),
(107, '2012-01-17 16:42:33', '2012-01-17 16:42:33', 'download_file'),
(108, '2012-01-17 16:42:33', '2012-01-17 16:42:33', 'members'),
(109, '2012-01-17 16:42:33', '2012-01-17 16:42:33', NULL);

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
('DO_PAGE_REINDEX_CHECK', '2012-01-17 16:42:49', '0', 0, 0),
('SITE_DEBUG_LEVEL', '2012-01-17 16:42:33', '1', 0, 0),
('ENABLE_LOG_EMAILS', '2012-01-17 16:42:33', '1', 0, 0),
('ENABLE_LOG_ERRORS', '2012-01-17 16:42:33', '1', 0, 0),
('ENABLE_CACHE', '2012-01-17 16:42:33', '1', 0, 0),
('FULL_PAGE_CACHE_GLOBAL', '2012-01-17 16:42:33', '0', 0, 0),
('ENABLE_MARKETPLACE_SUPPORT', '2012-01-17 16:42:33', '1', 0, 0),
('ANTISPAM_LOG_SPAM', '2012-01-17 16:42:33', '1', 0, 0),
('SITE', '2012-01-17 16:42:34', 'Turnkey Linux - Concrete5', 0, 0),
('SITE_APP_VERSION', '2012-01-17 16:42:34', '5.5.0', 0, 0),
('NEWSFLOW_LAST_VIEWED', '2012-01-17 16:42:48', '1326818568', 1, 0),
('SEEN_INTRODUCTION', '2012-01-17 16:42:46', '1', 0, 0);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `DashboardHomepage`
--


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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `Jobs`
--

INSERT INTO `Jobs` (`jID`, `jName`, `jDescription`, `jDateInstalled`, `jDateLastRun`, `pkgID`, `jLastStatusText`, `jLastStatusCode`, `jStatus`, `jHandle`, `jNotUninstallable`) VALUES
(1, 'Index Search Engine', 'Index the site to allow searching to work quickly and accurately.', '2012-01-17 16:42:23', NULL, 0, NULL, 0, 'ENABLED', 'index_search', 1),
(2, 'Generate Sitemap File', 'Generate the sitemap.xml file that search engines use to crawl your site.', '2012-01-17 16:42:23', NULL, 0, NULL, 0, 'ENABLED', 'generate_sitemap', 0),
(3, 'Process Email Posts', 'Polls an email account and grabs private messages/postings that are sent there..', '2012-01-17 16:42:23', NULL, 0, NULL, 0, 'ENABLED', 'process_email', 0),
(4, 'Remove Old Page Versions', 'Removes all except the 10 most recent page versions for each page.', '2012-01-17 16:42:23', NULL, 0, NULL, 0, 'ENABLED', 'remove_old_page_versions', 0);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `JobsLog`
--


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
  `miConnectionMethod` varchar(8) DEFAULT 'POP',
  PRIMARY KEY (`miID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `MailImporters`
--

INSERT INTO `MailImporters` (`miID`, `miHandle`, `miServer`, `miUsername`, `miPassword`, `miEncryption`, `miIsEnabled`, `miEmail`, `miPort`, `pkgID`, `miConnectionMethod`) VALUES
(1, 'private_message', NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 'POP');

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
  KEY `ppIsCanonical` (`ppIsCanonical`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=105 ;

--
-- Dumping data for table `PagePaths`
--

INSERT INTO `PagePaths` (`ppID`, `cID`, `cPath`, `ppIsCanonical`) VALUES
(1, 2, '/dashboard', '1'),
(2, 3, '/dashboard/composer', '1'),
(3, 4, '/dashboard/composer/write', '1'),
(4, 5, '/dashboard/composer/drafts', '1'),
(5, 6, '/dashboard/sitemap', '1'),
(6, 7, '/dashboard/sitemap/full', '1'),
(7, 8, '/dashboard/sitemap/explore', '1'),
(8, 9, '/dashboard/sitemap/search', '1'),
(9, 10, '/dashboard/files', '1'),
(10, 11, '/dashboard/files/search', '1'),
(11, 12, '/dashboard/files/attributes', '1'),
(12, 13, '/dashboard/files/sets', '1'),
(13, 14, '/dashboard/files/add_set', '1'),
(14, 15, '/dashboard/users', '1'),
(15, 16, '/dashboard/users/search', '1'),
(16, 17, '/dashboard/users/groups', '1'),
(17, 18, '/dashboard/users/attributes', '1'),
(18, 19, '/dashboard/users/add', '1'),
(19, 20, '/dashboard/users/add_group', '1'),
(20, 21, '/dashboard/reports', '1'),
(21, 22, '/dashboard/reports/statistics', '1'),
(22, 23, '/dashboard/reports/forms', '1'),
(23, 24, '/dashboard/reports/surveys', '1'),
(24, 25, '/dashboard/reports/logs', '1'),
(25, 26, '/dashboard/pages', '1'),
(26, 27, '/dashboard/pages/themes', '1'),
(27, 28, '/dashboard/pages/themes/add', '1'),
(28, 29, '/dashboard/pages/themes/inspect', '1'),
(29, 30, '/dashboard/pages/themes/customize', '1'),
(30, 31, '/dashboard/pages/types', '1'),
(31, 32, '/dashboard/pages/types/add', '1'),
(32, 33, '/dashboard/pages/attributes', '1'),
(33, 34, '/dashboard/pages/single', '1'),
(34, 35, '/dashboard/blocks', '1'),
(35, 36, '/dashboard/blocks/stacks', '1'),
(36, 37, '/dashboard/blocks/stacks/list', '1'),
(37, 38, '/dashboard/blocks/types', '1'),
(38, 39, '/dashboard/extend', '1'),
(39, 40, '/dashboard/extend/install', '1'),
(40, 41, '/dashboard/extend/update', '1'),
(41, 42, '/dashboard/extend/connect', '1'),
(42, 43, '/dashboard/extend/themes', '1'),
(43, 44, '/dashboard/extend/add-ons', '1'),
(44, 45, '/dashboard/system', '1'),
(45, 46, '/dashboard/system/basics', '1'),
(46, 47, '/dashboard/system/basics/site_name', '1'),
(47, 48, '/dashboard/system/basics/icons', '1'),
(48, 49, '/dashboard/system/basics/editor', '1'),
(49, 50, '/dashboard/system/basics/multilingual', '1'),
(50, 51, '/dashboard/system/basics/timezone', '1'),
(51, 52, '/dashboard/system/seo', '1'),
(52, 53, '/dashboard/system/seo/urls', '1'),
(53, 54, '/dashboard/system/seo/tracking_codes', '1'),
(54, 55, '/dashboard/system/seo/statistics', '1'),
(55, 56, '/dashboard/system/seo/search_index', '1'),
(56, 57, '/dashboard/system/optimization', '1'),
(57, 58, '/dashboard/system/optimization/cache', '1'),
(58, 59, '/dashboard/system/optimization/clear_cache', '1'),
(59, 60, '/dashboard/system/optimization/jobs', '1'),
(60, 61, '/dashboard/system/permissions', '1'),
(61, 62, '/dashboard/system/permissions/site', '1'),
(62, 63, '/dashboard/system/permissions/files', '1'),
(63, 64, '/dashboard/system/permissions/file_types', '1'),
(64, 65, '/dashboard/system/permissions/tasks', '1'),
(65, 66, '/dashboard/system/permissions/ip_blacklist', '1'),
(66, 67, '/dashboard/system/permissions/captcha', '1'),
(67, 68, '/dashboard/system/permissions/antispam', '1'),
(68, 69, '/dashboard/system/permissions/maintenance_mode', '1'),
(69, 70, '/dashboard/system/registration', '1'),
(70, 71, '/dashboard/system/registration/postlogin', '1'),
(71, 72, '/dashboard/system/registration/profiles', '1'),
(72, 73, '/dashboard/system/registration/public_registration', '1'),
(73, 74, '/dashboard/system/mail', '1'),
(74, 75, '/dashboard/system/mail/method', '1'),
(75, 76, '/dashboard/system/mail/importers', '1'),
(76, 77, '/dashboard/system/attributes', '1'),
(77, 78, '/dashboard/system/attributes/sets', '1'),
(78, 79, '/dashboard/system/attributes/types', '1'),
(79, 80, '/dashboard/system/environment', '1'),
(80, 81, '/dashboard/system/environment/info', '1'),
(81, 82, '/dashboard/system/environment/debug', '1'),
(82, 83, '/dashboard/system/environment/logging', '1'),
(83, 84, '/dashboard/system/environment/file_storage_locations', '1'),
(84, 85, '/dashboard/system/backup_restore', '1'),
(85, 86, '/dashboard/system/backup_restore/backup', '1'),
(86, 87, '/dashboard/system/backup_restore/update', '1'),
(87, 88, '/dashboard/system/backup_restore/database', '1'),
(88, 89, '/dashboard/pages/types/composer', '1'),
(89, 93, '/dashboard/home', '1'),
(90, 94, '/dashboard/welcome', '1'),
(91, 95, '/!drafts', '1'),
(92, 96, '/!trash', '1'),
(93, 97, '/!stacks', '1'),
(94, 98, '/login', '1'),
(95, 99, '/register', '1'),
(96, 100, '/profile', '1'),
(97, 101, '/profile/edit', '1'),
(98, 102, '/profile/avatar', '1'),
(99, 103, '/profile/messages', '1'),
(100, 104, '/profile/friends', '1'),
(101, 105, '/page_not_found', '1'),
(102, 106, '/page_forbidden', '1'),
(103, 107, '/download_file', '1'),
(104, 108, '/members', '1');

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
(2, 3, 0, 'r:wa:adm', NULL, NULL),
(37, 3, 0, 'r:wa:adm', NULL, NULL),
(37, 1, 0, 'r', NULL, NULL),
(98, 1, 0, 'r', NULL, NULL),
(98, 2, 0, 'r', NULL, NULL),
(99, 1, 0, 'r', NULL, NULL),
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
  `cRequiresReindex` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`cID`),
  KEY `cDateLastIndexed` (`cDateLastIndexed`),
  KEY `cDateLastSitemapped` (`cDateLastSitemapped`),
  KEY `cRequiresReindex` (`cRequiresReindex`),
  FULLTEXT KEY `cName` (`cName`),
  FULLTEXT KEY `cDescription` (`cDescription`),
  FULLTEXT KEY `content` (`content`),
  FULLTEXT KEY `content2` (`cName`,`cDescription`,`content`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PageSearchIndex`
--

INSERT INTO `PageSearchIndex` (`cID`, `content`, `cName`, `cDescription`, `cPath`, `cDatePublic`, `cDateLastIndexed`, `cDateLastSitemapped`, `cRequiresReindex`) VALUES
(2, '', 'Dashboard', '', '/dashboard', '2012-01-17 16:42:24', '2012-01-17 16:42:48', NULL, 0),
(3, '', 'Composer', 'Write for your site.', '/dashboard/composer', '2012-01-17 16:42:24', '2012-01-17 16:42:48', NULL, 0),
(4, '', 'Write', '', '/dashboard/composer/write', '2012-01-17 16:42:24', '2012-01-17 16:42:48', NULL, 0),
(5, '', 'Drafts', '', '/dashboard/composer/drafts', '2012-01-17 16:42:25', '2012-01-17 16:42:48', NULL, 0),
(6, '', 'Sitemap', 'Whole world at a glance.', '/dashboard/sitemap', '2012-01-17 16:42:25', '2012-01-17 16:42:48', NULL, 0),
(7, '', 'Full Sitemap', '', '/dashboard/sitemap/full', '2012-01-17 16:42:25', '2012-01-17 16:42:48', NULL, 0),
(8, '', 'Flat View', '', '/dashboard/sitemap/explore', '2012-01-17 16:42:25', '2012-01-17 16:42:48', NULL, 0),
(9, '', 'Page Search', '', '/dashboard/sitemap/search', '2012-01-17 16:42:25', '2012-01-17 16:42:48', NULL, 0),
(10, '', 'Files', 'All documents and images.', '/dashboard/files', '2012-01-17 16:42:25', '2012-01-17 16:42:48', NULL, 0),
(11, '', 'File Manager', '', '/dashboard/files/search', '2012-01-17 16:42:25', '2012-01-17 16:42:48', NULL, 0),
(12, '', 'Attributes', '', '/dashboard/files/attributes', '2012-01-17 16:42:25', '2012-01-17 16:42:48', NULL, 0),
(13, '', 'File Sets', '', '/dashboard/files/sets', '2012-01-17 16:42:25', '2012-01-17 16:42:48', NULL, 0),
(14, '', 'Add File Set', '', '/dashboard/files/add_set', '2012-01-17 16:42:25', '2012-01-17 16:42:48', NULL, 0),
(15, '', 'Members', 'Add and manage the user accounts and groups on your website.', '/dashboard/users', '2012-01-17 16:42:25', '2012-01-17 16:42:48', NULL, 0),
(16, '', 'Search Users', '', '/dashboard/users/search', '2012-01-17 16:42:25', '2012-01-17 16:42:48', NULL, 0),
(17, '', 'User Groups', '', '/dashboard/users/groups', '2012-01-17 16:42:25', '2012-01-17 16:42:48', NULL, 0),
(18, '', 'Attributes', '', '/dashboard/users/attributes', '2012-01-17 16:42:25', '2012-01-17 16:42:48', NULL, 0),
(19, '', 'Add User', '', '/dashboard/users/add', '2012-01-17 16:42:25', '2012-01-17 16:42:48', NULL, 0),
(20, '', 'Add Group', '', '/dashboard/users/add_group', '2012-01-17 16:42:26', '2012-01-17 16:42:48', NULL, 0),
(21, '', 'Reports', 'Get data from forms and logs.', '/dashboard/reports', '2012-01-17 16:42:26', '2012-01-17 16:42:48', NULL, 0),
(22, '', 'Statistics', 'View your site activity.', '/dashboard/reports/statistics', '2012-01-17 16:42:26', '2012-01-17 16:42:48', NULL, 0),
(23, '', 'Form Results', 'Get submission data.', '/dashboard/reports/forms', '2012-01-17 16:42:26', '2012-01-17 16:42:48', NULL, 0),
(24, '', 'Surveys', '', '/dashboard/reports/surveys', '2012-01-17 16:42:26', '2012-01-17 16:42:48', NULL, 0),
(25, '', 'Logs', '', '/dashboard/reports/logs', '2012-01-17 16:42:26', '2012-01-17 16:42:48', NULL, 0),
(26, '', 'Pages & Themes', 'Reskin your site.', '/dashboard/pages', '2012-01-17 16:42:26', '2012-01-17 16:42:48', NULL, 0),
(27, '', 'Themes', 'Reskin your site.', '/dashboard/pages/themes', '2012-01-17 16:42:26', '2012-01-17 16:42:48', NULL, 0),
(28, '', 'Add', '', '/dashboard/pages/themes/add', '2012-01-17 16:42:26', '2012-01-17 16:42:48', NULL, 0),
(29, '', 'Inspect', '', '/dashboard/pages/themes/inspect', '2012-01-17 16:42:26', '2012-01-17 16:42:48', NULL, 0),
(30, '', 'Customize', '', '/dashboard/pages/themes/customize', '2012-01-17 16:42:26', '2012-01-17 16:42:48', NULL, 0),
(31, '', 'Page Types', 'What goes in your site.', '/dashboard/pages/types', '2012-01-17 16:42:26', '2012-01-17 16:42:48', NULL, 0),
(32, '', 'Add Page Type', 'Add page types to your site.', '/dashboard/pages/types/add', '2012-01-17 16:42:26', '2012-01-17 16:42:48', NULL, 0),
(33, '', 'Attributes', '', '/dashboard/pages/attributes', '2012-01-17 16:42:26', '2012-01-17 16:42:48', NULL, 0),
(34, '', 'Single Pages', '', '/dashboard/pages/single', '2012-01-17 16:42:27', '2012-01-17 16:42:48', NULL, 0),
(35, '', 'Stacks & Blocks', 'Manage sitewide content and administer block types.', '/dashboard/blocks', '2012-01-17 16:42:27', '2012-01-17 16:42:48', NULL, 0),
(36, '', 'Stacks', 'Share content across your site.', '/dashboard/blocks/stacks', '2012-01-17 16:42:27', '2012-01-17 16:42:48', NULL, 0),
(37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(38, '', 'Block Types', 'Manage the installed block types in your site.', '/dashboard/blocks/types', '2012-01-17 16:42:27', '2012-01-17 16:42:48', NULL, 0),
(39, '', 'Extend concrete5', 'Connect to the concrete5 marketplace, install custom add-ons, and download updates for marketplace add-ons and themes.', '/dashboard/extend', '2012-01-17 16:42:27', '2012-01-17 16:42:48', NULL, 0),
(40, '', 'Add Functionality', 'Install add-ons & themes.', '/dashboard/extend/install', '2012-01-17 16:42:27', '2012-01-17 16:42:48', NULL, 0),
(41, '', 'Update Add-Ons', 'Update your installed packages.', '/dashboard/extend/update', '2012-01-17 16:42:27', '2012-01-17 16:42:48', NULL, 0),
(42, '', 'Connect to the Community', 'Connect to the concrete5 community.', '/dashboard/extend/connect', '2012-01-17 16:42:27', '2012-01-17 16:42:48', NULL, 0),
(43, '', 'Get More Themes', 'Download themes from concrete5.org.', '/dashboard/extend/themes', '2012-01-17 16:42:27', '2012-01-17 16:42:48', NULL, 0),
(44, '', 'Get More Add-Ons', 'Download add-ons from concrete5.org.', '/dashboard/extend/add-ons', '2012-01-17 16:42:27', '2012-01-17 16:42:48', NULL, 0),
(45, '', 'System & Settings', 'Secure and setup your site.', '/dashboard/system', '2012-01-17 16:42:27', '2012-01-17 16:42:49', NULL, 0),
(46, '', 'Basics', 'Basic information about your website.', '/dashboard/system/basics', '2012-01-17 16:42:27', '2012-01-17 16:42:49', NULL, 0),
(47, '', 'Site Name', '', '/dashboard/system/basics/site_name', '2012-01-17 16:42:27', '2012-01-17 16:42:49', NULL, 0),
(48, '', 'Bookmark Icons', 'Bookmark icon and mobile home screen icon setup.', '/dashboard/system/basics/icons', '2012-01-17 16:42:27', '2012-01-17 16:42:49', NULL, 0),
(49, '', 'Rich Text Editor', '', '/dashboard/system/basics/editor', '2012-01-17 16:42:28', '2012-01-17 16:42:49', NULL, 0),
(50, '', 'Languages', '', '/dashboard/system/basics/multilingual', '2012-01-17 16:42:28', '2012-01-17 16:42:49', NULL, 0),
(51, '', 'Time Zone', '', '/dashboard/system/basics/timezone', '2012-01-17 16:42:28', '2012-01-17 16:42:49', NULL, 0),
(52, '', 'SEO & Statistics', 'Enable pretty URLs, statistics and tracking codes.', '/dashboard/system/seo', '2012-01-17 16:42:28', '2012-01-17 16:42:49', NULL, 0),
(53, '', 'Pretty URLs', '', '/dashboard/system/seo/urls', '2012-01-17 16:42:28', '2012-01-17 16:42:49', NULL, 0),
(54, '', 'Tracking Codes', '', '/dashboard/system/seo/tracking_codes', '2012-01-17 16:42:28', '2012-01-17 16:42:49', NULL, 0),
(55, '', 'Statistics', '', '/dashboard/system/seo/statistics', '2012-01-17 16:42:28', '2012-01-17 16:42:49', NULL, 0),
(56, '', 'Search Index', '', '/dashboard/system/seo/search_index', '2012-01-17 16:42:28', '2012-01-17 16:42:49', NULL, 0),
(57, '', 'Optimization', 'Keep your site running well.', '/dashboard/system/optimization', '2012-01-17 16:42:28', '2012-01-17 16:42:49', NULL, 0),
(58, '', 'Cache & Speed Settings', '', '/dashboard/system/optimization/cache', '2012-01-17 16:42:28', '2012-01-17 16:42:49', NULL, 0),
(59, '', 'Clear Cache', '', '/dashboard/system/optimization/clear_cache', '2012-01-17 16:42:28', '2012-01-17 16:42:49', NULL, 0),
(60, '', 'Automated Jobs', '', '/dashboard/system/optimization/jobs', '2012-01-17 16:42:28', '2012-01-17 16:42:49', NULL, 0),
(61, '', 'Permissions & Access', 'Control who sees and edits your site.', '/dashboard/system/permissions', '2012-01-17 16:42:28', '2012-01-17 16:42:49', NULL, 0),
(62, '', 'Site Access', '', '/dashboard/system/permissions/site', '2012-01-17 16:42:28', '2012-01-17 16:42:49', NULL, 0),
(63, '', 'File Manager Permissions', '', '/dashboard/system/permissions/files', '2012-01-17 16:42:29', '2012-01-17 16:42:49', NULL, 0),
(64, '', 'Allowed File Types', '', '/dashboard/system/permissions/file_types', '2012-01-17 16:42:29', '2012-01-17 16:42:49', NULL, 0),
(65, '', 'Task Permissions', '', '/dashboard/system/permissions/tasks', '2012-01-17 16:42:29', '2012-01-17 16:42:49', NULL, 0),
(66, '', 'IP Blacklist', '', '/dashboard/system/permissions/ip_blacklist', '2012-01-17 16:42:29', '2012-01-17 16:42:49', NULL, 0),
(67, '', 'Captcha Setup', '', '/dashboard/system/permissions/captcha', '2012-01-17 16:42:29', '2012-01-17 16:42:49', NULL, 0),
(68, '', 'Spam Control', '', '/dashboard/system/permissions/antispam', '2012-01-17 16:42:29', '2012-01-17 16:42:49', NULL, 0),
(69, '', 'Maintenance Mode', '', '/dashboard/system/permissions/maintenance_mode', '2012-01-17 16:42:29', '2012-01-17 16:42:49', NULL, 0),
(70, '', 'Login & Registration', 'Change login behaviors and setup public profiles.', '/dashboard/system/registration', '2012-01-17 16:42:29', '2012-01-17 16:42:49', NULL, 0),
(71, '', 'Login Destination', '', '/dashboard/system/registration/postlogin', '2012-01-17 16:42:29', '2012-01-17 16:42:49', NULL, 0),
(72, '', 'Public Profiles', '', '/dashboard/system/registration/profiles', '2012-01-17 16:42:29', '2012-01-17 16:42:49', NULL, 0),
(73, '', 'Public Registration', '', '/dashboard/system/registration/public_registration', '2012-01-17 16:42:29', '2012-01-17 16:42:49', NULL, 0),
(74, '', 'Email', 'Control how your site send and processes mail.', '/dashboard/system/mail', '2012-01-17 16:42:29', '2012-01-17 16:42:49', NULL, 0),
(75, '', 'SMTP Method', '', '/dashboard/system/mail/method', '2012-01-17 16:42:29', '2012-01-17 16:42:49', NULL, 0),
(76, '', 'Email Importers', '', '/dashboard/system/mail/importers', '2012-01-17 16:42:29', '2012-01-17 16:42:49', NULL, 0),
(77, '', 'Attributes', 'Setup attributes for pages, users, files and more.', '/dashboard/system/attributes', '2012-01-17 16:42:29', '2012-01-17 16:42:49', NULL, 0),
(78, '', 'Sets', 'Group attributes into sets for easier organization', '/dashboard/system/attributes/sets', '2012-01-17 16:42:29', '2012-01-17 16:42:49', NULL, 0),
(79, '', 'Types', 'Choose which attribute types are available for different items.', '/dashboard/system/attributes/types', '2012-01-17 16:42:30', '2012-01-17 16:42:49', NULL, 0),
(80, '', 'Environment', 'Advanced settings for web developers.', '/dashboard/system/environment', '2012-01-17 16:42:30', '2012-01-17 16:42:49', NULL, 0),
(81, '', 'Environment Information', '', '/dashboard/system/environment/info', '2012-01-17 16:42:30', '2012-01-17 16:42:49', NULL, 0),
(82, '', 'Debug Settings', '', '/dashboard/system/environment/debug', '2012-01-17 16:42:30', '2012-01-17 16:42:49', NULL, 0),
(83, '', 'Logging Settings', '', '/dashboard/system/environment/logging', '2012-01-17 16:42:30', '2012-01-17 16:42:49', NULL, 0),
(84, '', 'File Storage Locations', '', '/dashboard/system/environment/file_storage_locations', '2012-01-17 16:42:30', '2012-01-17 16:42:49', NULL, 0),
(85, '', 'Backup & Restore', 'Backup or restore your website.', '/dashboard/system/backup_restore', '2012-01-17 16:42:30', '2012-01-17 16:42:49', NULL, 0),
(86, '', 'Backup Database', '', '/dashboard/system/backup_restore/backup', '2012-01-17 16:42:30', '2012-01-17 16:42:49', NULL, 0),
(87, '', 'Update concrete5', '', '/dashboard/system/backup_restore/update', '2012-01-17 16:42:30', '2012-01-17 16:42:49', NULL, 0),
(88, '', 'Database XML', '', '/dashboard/system/backup_restore/database', '2012-01-17 16:42:30', '2012-01-17 16:42:49', NULL, 0),
(89, '', 'Composer', '', '/dashboard/pages/types/composer', '2012-01-17 16:42:30', '2012-01-17 16:42:49', NULL, 0),
(93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(94, '	Welcome to concrete5.\n						It''s easy to edit content and add pages using in-context editing. \n						 \n							Building Your Own Site\n							 If you’re comfortable in PHP concrete5 should be a breeze to learn. Take a few moments to understand the architecture. \n							 Editor''s Guide \n							  \n							Developing Applications\n							 If you’re comfortable in PHP concrete5 should be a breeze to learn. Take a few moments to understand the architecture. \n							 Developer''s Guide \n							  \n							Designing Websites\n							 Good with CSS and HTML? You can easily theme anything with concrete5. \n							 \n							 Designer''s Guide \n							  \n						\n						Business Background\n						 Worried about license structures, white-labeling or why concrete5 is a good choice for your agency? \n						 Executive''s Guide \n						  ', 'Welcome to concrete5', 'Learn about how to use concrete5, how to develop for concrete5, and get general help.', '/dashboard/welcome', '2012-01-17 16:42:30', '2012-01-17 16:42:49', NULL, 0),
(95, '', 'Drafts', '', '/!drafts', '2012-01-17 16:42:32', '2012-01-17 16:42:49', NULL, 0),
(96, '', 'Trash', '', '/!trash', '2012-01-17 16:42:32', '2012-01-17 16:42:49', NULL, 0),
(97, '', 'Stacks', '', '/!stacks', '2012-01-17 16:42:32', '2012-01-17 16:42:49', NULL, 0),
(98, '', 'Login', '', '/login', '2012-01-17 16:42:33', '2012-01-17 16:42:49', NULL, 0),
(99, '', 'Register', '', '/register', '2012-01-17 16:42:33', '2012-01-17 16:42:49', NULL, 0),
(100, '', 'Profile', '', '/profile', '2012-01-17 16:42:33', '2012-01-17 16:42:49', NULL, 0),
(101, '', 'Edit', '', '/profile/edit', '2012-01-17 16:42:33', '2012-01-17 16:42:49', NULL, 0),
(102, '', 'Avatar', '', '/profile/avatar', '2012-01-17 16:42:33', '2012-01-17 16:42:49', NULL, 0),
(103, '', 'Messages', '', '/profile/messages', '2012-01-17 16:42:33', '2012-01-17 16:42:49', NULL, 0),
(104, '', 'Friends', '', '/profile/friends', '2012-01-17 16:42:33', '2012-01-17 16:42:49', NULL, 0),
(105, '', 'Page Not Found', '', '/page_not_found', '2012-01-17 16:42:33', '2012-01-17 16:42:49', NULL, 0),
(106, '', 'Page Forbidden', '', '/page_forbidden', '2012-01-17 16:42:33', '2012-01-17 16:42:49', NULL, 0),
(107, '', 'Download File', '', '/download_file', '2012-01-17 16:42:33', '2012-01-17 16:42:49', NULL, 0),
(108, '', 'Members', '', '/members', '2012-01-17 16:42:33', '2012-01-17 16:42:49', NULL, 0),
(1, '', 'Home', '', NULL, '2012-01-17 16:42:21', '2012-01-17 16:42:49', NULL, 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `PageStatistics`
--

INSERT INTO `PageStatistics` (`pstID`, `cID`, `date`, `timestamp`, `uID`) VALUES
(1, 1, '2012-01-17', '2012-01-17 16:42:46', 1),
(2, 94, '2012-01-17', '2012-01-17 16:42:48', 1);

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
(1, 'default', 'Plain Yogurt', 'Plain Yogurt is concrete5''s default theme.', 0),
(2, 'greensalad', 'Green Salad Theme', 'This is concrete5''s Green Salad site theme.', 0),
(3, 'dark_chocolate', 'Dark Chocolate', 'Dark Chocolate is concrete5''s default theme in black.', 0);

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


-- --------------------------------------------------------

--
-- Table structure for table `PageTypes`
--

CREATE TABLE IF NOT EXISTS `PageTypes` (
  `ctID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctHandle` varchar(32) NOT NULL,
  `ctIcon` varchar(128) DEFAULT NULL,
  `ctName` varchar(90) NOT NULL,
  `ctIsInternal` tinyint(1) NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ctID`),
  UNIQUE KEY `ctHandle` (`ctHandle`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `PageTypes`
--

INSERT INTO `PageTypes` (`ctID`, `ctHandle`, `ctIcon`, `ctName`, `ctIsInternal`, `pkgID`) VALUES
(1, 'core_stack', 'main.png', 'Stack', 1, 0),
(2, 'dashboard_primary_five', 'main.png', 'Dashboard Primary + Five', 1, 0),
(3, 'dashboard_header_four_col', 'main.png', 'Dashboard Header + Four Column', 1, 0),
(4, 'right_sidebar', 'right_sidebar.png', 'Right Sidebar', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Pages`
--

CREATE TABLE IF NOT EXISTS `Pages` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `ctID` int(10) unsigned NOT NULL DEFAULT '0',
  `cIsTemplate` int(1) unsigned NOT NULL DEFAULT '0',
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
  `cIsActive` tinyint(1) NOT NULL DEFAULT '1',
  `cChildren` int(10) unsigned NOT NULL DEFAULT '0',
  `cDisplayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  `cParentID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  `ptID` int(10) unsigned NOT NULL DEFAULT '0',
  `cCacheFullPageContent` int(4) NOT NULL DEFAULT '-1',
  `cCacheFullPageContentOverrideLifetime` varchar(32) NOT NULL DEFAULT '0',
  `cCacheFullPageContentLifetimeCustom` int(10) unsigned NOT NULL DEFAULT '0',
  `cIsSystemPage` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`),
  KEY `cParentID` (`cParentID`),
  KEY `cIsActive` (`cIsActive`),
  KEY `cCheckedOutUID` (`cCheckedOutUID`),
  KEY `uID` (`uID`),
  KEY `ctID` (`ctID`),
  KEY `cPointerID` (`cPointerID`),
  KEY `cIsTemplate` (`cIsTemplate`),
  KEY `cIsSystemPage` (`cIsSystemPage`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Pages`
--

INSERT INTO `Pages` (`cID`, `ctID`, `cIsTemplate`, `uID`, `cIsCheckedOut`, `cCheckedOutUID`, `cCheckedOutDatetime`, `cCheckedOutDatetimeLastEdit`, `cPendingAction`, `cPendingActionDatetime`, `cPendingActionUID`, `cPendingActionTargetCID`, `cOverrideTemplatePermissions`, `cInheritPermissionsFromCID`, `cInheritPermissionsFrom`, `cFilename`, `cPointerID`, `cPointerExternalLink`, `cPointerExternalLinkNewWindow`, `cIsActive`, `cChildren`, `cDisplayOrder`, `cParentID`, `pkgID`, `ptID`, `cCacheFullPageContent`, `cCacheFullPageContentOverrideLifetime`, `cCacheFullPageContentLifetimeCustom`, `cIsSystemPage`) VALUES
(1, 4, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 1, 'OVERRIDE', NULL, 0, NULL, 0, 1, 11, 0, 0, 0, 1, -1, '0', 0, 0),
(2, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'OVERRIDE', '/dashboard/view.php', 0, NULL, 0, 1, 11, 0, 0, 0, 0, -1, '0', 0, 1),
(3, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/composer/view.php', 0, NULL, 0, 1, 2, 0, 2, 0, 0, -1, '0', 0, 1),
(4, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/composer/write.php', 0, NULL, 0, 1, 0, 0, 3, 0, 0, -1, '0', 0, 1),
(5, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/composer/drafts.php', 0, NULL, 0, 1, 0, 1, 3, 0, 0, -1, '0', 0, 1),
(6, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/sitemap/view.php', 0, NULL, 0, 1, 3, 1, 2, 0, 0, -1, '0', 0, 1),
(7, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/sitemap/full.php', 0, NULL, 0, 1, 0, 0, 6, 0, 0, -1, '0', 0, 1),
(8, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/sitemap/explore.php', 0, NULL, 0, 1, 0, 1, 6, 0, 0, -1, '0', 0, 1),
(9, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/sitemap/search.php', 0, NULL, 0, 1, 0, 2, 6, 0, 0, -1, '0', 0, 1),
(10, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/files/view.php', 0, NULL, 0, 1, 4, 2, 2, 0, 0, -1, '0', 0, 1),
(11, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/files/search.php', 0, NULL, 0, 1, 0, 0, 10, 0, 0, -1, '0', 0, 1),
(12, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/files/attributes.php', 0, NULL, 0, 1, 0, 1, 10, 0, 0, -1, '0', 0, 1),
(13, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/files/sets.php', 0, NULL, 0, 1, 0, 2, 10, 0, 0, -1, '0', 0, 1),
(14, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/files/add_set.php', 0, NULL, 0, 1, 0, 3, 10, 0, 0, -1, '0', 0, 1),
(15, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/view.php', 0, NULL, 0, 1, 5, 3, 2, 0, 0, -1, '0', 0, 1),
(16, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/search.php', 0, NULL, 0, 1, 0, 0, 15, 0, 0, -1, '0', 0, 1),
(17, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/groups.php', 0, NULL, 0, 1, 0, 1, 15, 0, 0, -1, '0', 0, 1),
(18, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/attributes.php', 0, NULL, 0, 1, 0, 2, 15, 0, 0, -1, '0', 0, 1),
(19, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/add.php', 0, NULL, 0, 1, 0, 3, 15, 0, 0, -1, '0', 0, 1),
(20, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/add_group.php', 0, NULL, 0, 1, 0, 4, 15, 0, 0, -1, '0', 0, 1),
(21, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/reports.php', 0, NULL, 0, 1, 4, 4, 2, 0, 0, -1, '0', 0, 1),
(22, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/reports/statistics.php', 0, NULL, 0, 1, 0, 0, 21, 0, 0, -1, '0', 0, 1),
(23, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/reports/forms.php', 0, NULL, 0, 1, 0, 1, 21, 0, 0, -1, '0', 0, 1),
(24, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/reports/surveys.php', 0, NULL, 0, 1, 0, 2, 21, 0, 0, -1, '0', 0, 1),
(25, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/reports/logs.php', 0, NULL, 0, 1, 0, 3, 21, 0, 0, -1, '0', 0, 1),
(26, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/view.php', 0, NULL, 0, 1, 4, 5, 2, 0, 0, -1, '0', 0, 1),
(27, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/themes/view.php', 0, NULL, 0, 1, 3, 0, 26, 0, 0, -1, '0', 0, 1),
(28, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/themes/add.php', 0, NULL, 0, 1, 0, 0, 27, 0, 0, -1, '0', 0, 1),
(29, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/themes/inspect.php', 0, NULL, 0, 1, 0, 1, 27, 0, 0, -1, '0', 0, 1),
(30, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/themes/customize.php', 0, NULL, 0, 1, 0, 2, 27, 0, 0, -1, '0', 0, 1),
(31, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/types/view.php', 0, NULL, 0, 1, 2, 1, 26, 0, 0, -1, '0', 0, 1),
(32, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/types/add.php', 0, NULL, 0, 1, 0, 0, 31, 0, 0, -1, '0', 0, 1),
(33, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/attributes.php', 0, NULL, 0, 1, 0, 2, 26, 0, 0, -1, '0', 0, 1),
(34, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/single.php', 0, NULL, 0, 1, 0, 3, 26, 0, 0, -1, '0', 0, 1),
(35, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/blocks/view.php', 0, NULL, 0, 1, 2, 6, 2, 0, 0, -1, '0', 0, 1),
(36, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/blocks/stacks/view.php', 0, NULL, 0, 1, 1, 0, 35, 0, 0, -1, '0', 0, 1),
(37, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 37, 'OVERRIDE', '/dashboard/blocks/stacks/list/view.php', 0, NULL, 0, 1, 0, 0, 36, 0, 0, -1, '0', 0, 1),
(38, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/blocks/types/view.php', 0, NULL, 0, 1, 0, 1, 35, 0, 0, -1, '0', 0, 1),
(39, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/extend/view.php', 0, NULL, 0, 1, 5, 7, 2, 0, 0, -1, '0', 0, 1),
(40, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/extend/install.php', 0, NULL, 0, 1, 0, 0, 39, 0, 0, -1, '0', 0, 1),
(41, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/extend/update.php', 0, NULL, 0, 1, 0, 1, 39, 0, 0, -1, '0', 0, 1),
(42, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/extend/connect.php', 0, NULL, 0, 1, 0, 2, 39, 0, 0, -1, '0', 0, 1),
(43, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/extend/themes.php', 0, NULL, 0, 1, 0, 3, 39, 0, 0, -1, '0', 0, 1),
(44, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/extend/add-ons.php', 0, NULL, 0, 1, 0, 4, 39, 0, 0, -1, '0', 0, 1),
(45, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/view.php', 0, NULL, 0, 1, 9, 8, 2, 0, 0, -1, '0', 0, 1),
(46, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/view.php', 0, NULL, 0, 1, 5, 0, 45, 0, 0, -1, '0', 0, 1),
(47, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/site_name.php', 0, NULL, 0, 1, 0, 0, 46, 0, 0, -1, '0', 0, 1),
(48, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/icons.php', 0, NULL, 0, 1, 0, 1, 46, 0, 0, -1, '0', 0, 1),
(49, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/editor.php', 0, NULL, 0, 1, 0, 2, 46, 0, 0, -1, '0', 0, 1),
(50, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/multilingual/view.php', 0, NULL, 0, 1, 0, 3, 46, 0, 0, -1, '0', 0, 1),
(51, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/timezone.php', 0, NULL, 0, 1, 0, 4, 46, 0, 0, -1, '0', 0, 1),
(52, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/seo/view.php', 0, NULL, 0, 1, 4, 1, 45, 0, 0, -1, '0', 0, 1),
(53, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/seo/urls.php', 0, NULL, 0, 1, 0, 0, 52, 0, 0, -1, '0', 0, 1),
(54, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/seo/tracking_codes.php', 0, NULL, 0, 1, 0, 1, 52, 0, 0, -1, '0', 0, 1),
(55, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/seo/statistics.php', 0, NULL, 0, 1, 0, 2, 52, 0, 0, -1, '0', 0, 1),
(56, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/seo/search_index.php', 0, NULL, 0, 1, 0, 3, 52, 0, 0, -1, '0', 0, 1),
(57, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/optimization/view.php', 0, NULL, 0, 1, 3, 2, 45, 0, 0, -1, '0', 0, 1),
(58, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/optimization/cache.php', 0, NULL, 0, 1, 0, 0, 57, 0, 0, -1, '0', 0, 1),
(59, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/optimization/clear_cache.php', 0, NULL, 0, 1, 0, 1, 57, 0, 0, -1, '0', 0, 1),
(60, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/optimization/jobs.php', 0, NULL, 0, 1, 0, 2, 57, 0, 0, -1, '0', 0, 1),
(61, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/view.php', 0, NULL, 0, 1, 8, 3, 45, 0, 0, -1, '0', 0, 1),
(62, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/site.php', 0, NULL, 0, 1, 0, 0, 61, 0, 0, -1, '0', 0, 1),
(63, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/files.php', 0, NULL, 0, 1, 0, 1, 61, 0, 0, -1, '0', 0, 1),
(64, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/file_types.php', 0, NULL, 0, 1, 0, 2, 61, 0, 0, -1, '0', 0, 1),
(65, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/tasks.php', 0, NULL, 0, 1, 0, 3, 61, 0, 0, -1, '0', 0, 1),
(66, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/ip_blacklist.php', 0, NULL, 0, 1, 0, 4, 61, 0, 0, -1, '0', 0, 1),
(67, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/captcha.php', 0, NULL, 0, 1, 0, 5, 61, 0, 0, -1, '0', 0, 1),
(68, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/antispam.php', 0, NULL, 0, 1, 0, 6, 61, 0, 0, -1, '0', 0, 1),
(69, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/maintenance_mode.php', 0, NULL, 0, 1, 0, 7, 61, 0, 0, -1, '0', 0, 1),
(70, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/registration/view.php', 0, NULL, 0, 1, 3, 4, 45, 0, 0, -1, '0', 0, 1),
(71, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/registration/postlogin.php', 0, NULL, 0, 1, 0, 0, 70, 0, 0, -1, '0', 0, 1),
(72, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/registration/profiles.php', 0, NULL, 0, 1, 0, 1, 70, 0, 0, -1, '0', 0, 1),
(73, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/registration/public_registration.php', 0, NULL, 0, 1, 0, 2, 70, 0, 0, -1, '0', 0, 1),
(74, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/mail/view.php', 0, NULL, 0, 1, 2, 5, 45, 0, 0, -1, '0', 0, 1),
(75, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/mail/method.php', 0, NULL, 0, 1, 0, 0, 74, 0, 0, -1, '0', 0, 1),
(76, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/mail/importers.php', 0, NULL, 0, 1, 0, 1, 74, 0, 0, -1, '0', 0, 1),
(77, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/attributes/view.php', 0, NULL, 0, 1, 2, 6, 45, 0, 0, -1, '0', 0, 1),
(78, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/attributes/sets.php', 0, NULL, 0, 1, 0, 0, 77, 0, 0, -1, '0', 0, 1),
(79, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/attributes/types.php', 0, NULL, 0, 1, 0, 1, 77, 0, 0, -1, '0', 0, 1),
(80, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/environment/view.php', 0, NULL, 0, 1, 4, 7, 45, 0, 0, -1, '0', 0, 1),
(81, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/environment/info.php', 0, NULL, 0, 1, 0, 0, 80, 0, 0, -1, '0', 0, 1),
(82, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/environment/debug.php', 0, NULL, 0, 1, 0, 1, 80, 0, 0, -1, '0', 0, 1),
(83, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/environment/logging.php', 0, NULL, 0, 1, 0, 2, 80, 0, 0, -1, '0', 0, 1),
(84, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/environment/file_storage_locations.php', 0, NULL, 0, 1, 0, 3, 80, 0, 0, -1, '0', 0, 1),
(85, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/backup_restore/view.php', 0, NULL, 0, 1, 3, 8, 45, 0, 0, -1, '0', 0, 1),
(86, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/backup_restore/backup.php', 0, NULL, 0, 1, 0, 0, 85, 0, 0, -1, '0', 0, 1),
(87, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/backup_restore/update.php', 0, NULL, 0, 1, 0, 1, 85, 0, 0, -1, '0', 0, 1),
(88, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/backup_restore/database.php', 0, NULL, 0, 1, 0, 2, 85, 0, 0, -1, '0', 0, 1),
(89, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/types/composer.php', 0, NULL, 0, 1, 0, 1, 31, 0, 0, -1, '0', 0, 1),
(90, 1, 1, NULL, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 0, 'PARENT', NULL, 0, NULL, 0, 1, 0, 0, 0, 0, 0, -1, '0', 0, 0),
(91, 2, 1, NULL, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 0, 'PARENT', NULL, 0, NULL, 0, 1, 0, 0, 0, 0, 0, -1, '0', 0, 0),
(92, 3, 1, NULL, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 0, 'PARENT', NULL, 0, NULL, 0, 1, 0, 0, 0, 0, 0, -1, '0', 0, 0),
(93, 2, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', NULL, 0, NULL, 0, 1, 0, 9, 2, 0, 1, -1, '0', 0, 1),
(94, 3, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 2, 'PARENT', NULL, 0, NULL, 0, 1, 0, 10, 2, 0, 1, -1, '0', 0, 1),
(95, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 1, 'PARENT', '/!drafts/view.php', 0, NULL, 0, 1, 0, 0, 0, 0, 0, -1, '0', 0, 1),
(96, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 1, 'PARENT', '/!trash/view.php', 0, NULL, 0, 1, 0, 0, 0, 0, 0, -1, '0', 0, 1),
(97, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 1, 'PARENT', '/!stacks/view.php', 0, NULL, 0, 1, 0, 0, 0, 0, 0, -1, '0', 0, 1),
(98, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 98, 'OVERRIDE', '/login.php', 0, NULL, 0, 1, 0, 0, 0, 0, 0, -1, '0', 0, 1),
(99, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 99, 'OVERRIDE', '/register.php', 0, NULL, 0, 1, 0, 0, 0, 0, 0, -1, '0', 0, 1),
(100, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 1, 'PARENT', '/profile/view.php', 0, NULL, 0, 1, 4, 0, 1, 0, 0, -1, '0', 0, 1),
(101, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 1, 'PARENT', '/profile/edit.php', 0, NULL, 0, 1, 0, 0, 100, 0, 0, -1, '0', 0, 1),
(102, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 1, 'PARENT', '/profile/avatar.php', 0, NULL, 0, 1, 0, 1, 100, 0, 0, -1, '0', 0, 1),
(103, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 1, 'PARENT', '/profile/messages.php', 0, NULL, 0, 1, 0, 2, 100, 0, 0, -1, '0', 0, 1),
(104, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 1, 'PARENT', '/profile/friends.php', 0, NULL, 0, 1, 0, 3, 100, 0, 0, -1, '0', 0, 1),
(105, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 1, 'PARENT', '/page_not_found.php', 0, NULL, 0, 1, 0, 1, 0, 0, 0, -1, '0', 0, 1),
(106, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 1, 'PARENT', '/page_forbidden.php', 0, NULL, 0, 1, 0, 1, 0, 0, 0, -1, '0', 0, 1),
(107, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 1, 'PARENT', '/download_file.php', 0, NULL, 0, 1, 0, 1, 1, 0, 0, -1, '0', 0, 1),
(108, 0, 0, 1, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 1, 'PARENT', '/members.php', 0, NULL, 0, 1, 0, 2, 1, 0, 0, -1, '0', 0, 1),
(109, 4, 1, NULL, 0, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 1, 0, 'PARENT', NULL, 0, NULL, 0, 1, 0, 0, 0, 0, 0, -1, '0', 0, 0);

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
-- Table structure for table `Stacks`
--

CREATE TABLE IF NOT EXISTS `Stacks` (
  `stID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stName` varchar(255) NOT NULL,
  `stType` int(1) unsigned NOT NULL DEFAULT '0',
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`stID`),
  KEY `stType` (`stType`),
  KEY `stName` (`stName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Stacks`
--


-- --------------------------------------------------------

--
-- Table structure for table `SystemAntispamLibraries`
--

CREATE TABLE IF NOT EXISTS `SystemAntispamLibraries` (
  `saslHandle` varchar(64) NOT NULL,
  `saslName` varchar(255) DEFAULT NULL,
  `saslIsActive` int(1) NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`saslHandle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SystemAntispamLibraries`
--


-- --------------------------------------------------------

--
-- Table structure for table `SystemCaptchaLibraries`
--

CREATE TABLE IF NOT EXISTS `SystemCaptchaLibraries` (
  `sclHandle` varchar(64) NOT NULL,
  `sclName` varchar(255) DEFAULT NULL,
  `sclIsActive` int(1) NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`sclHandle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SystemCaptchaLibraries`
--

INSERT INTO `SystemCaptchaLibraries` (`sclHandle`, `sclName`, `sclIsActive`, `pkgID`) VALUES
('securimage', 'SecurImage (Default)', 1, 0);

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
(10, 3, 0, 1),
(11, 3, 0, 1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

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
(10, 'delete_user', 'Delete Users', '', 0),
(11, 'view_newsflow', 'View Newsflow Updates in an Overlay', '', 0);

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
(9, 0, 0, 1, 0, 1, 0, 1, 1),
(10, 0, 0, 1, 0, 1, 0, 2, 1);

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
(1, 'admin', 'admin@example.com', '0f31da05e3244fb4eb3036842a42a21a', '1', -1, 1, '2012-01-17 16:42:21', 0, 1326818566, 1326818541, 0, 1, NULL, NULL);

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

INSERT INTO `atBoolean` (`avID`, `value`) VALUES
(11, 1),
(29, 1),
(30, 1),
(31, 1),
(37, 1),
(70, 1),
(71, 1),
(72, 1);

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
(4, 0),
(5, 0),
(7, 0),
(8, 0),
(9, 1),
(10, 1);

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

INSERT INTO `atDefault` (`avID`, `value`) VALUES
(1, 'blog, blogging'),
(2, 'new blog, write blog'),
(3, 'blog drafts,composer'),
(4, 'pages, add page, delete page, copy, move, alias'),
(5, 'pages, add page, delete page, copy, move, alias'),
(6, 'pages, add page, delete page, copy, move, alias'),
(7, 'find page, search page, search, find'),
(8, 'files, add file, delete file, copy, move, alias'),
(9, 'file, file attributes'),
(10, 'files, category, categories'),
(12, 'users, groups, people'),
(13, 'find, search, people'),
(14, 'user, group, people'),
(15, 'user attributes'),
(16, 'new user'),
(17, 'new user group, new group, group'),
(18, 'forms, log, error, email, mysql, exception, survey'),
(19, 'hits, pageviews, visitors, activity'),
(20, 'forms, questions'),
(21, 'survey, questions, quiz'),
(22, 'forms, log, error, email, mysql, exception, survey'),
(23, 'page types, themes, single pages'),
(24, 'new theme, installed theme, active theme, change theme, template, css'),
(25, 'add theme'),
(26, 'custom theme, change theme, custom css, css'),
(27, 'page type defaults, global block, global area'),
(28, 'page attributes'),
(32, 'add-on, addon, add on, package,applications, ecommerce, discussions, forums, themes, templates, blocks'),
(33, 'update, upgrade'),
(34, 'concrete5.org, my account, marketplace'),
(35, 'buy theme, new theme, install theme, marketplace, template'),
(36, 'buy addon, buy add on, buy add-on, purchase addon, purchase add on, purchase add-on, find addon, new addon, marketplace'),
(38, 'website name'),
(39, 'logo, favicon, iphone'),
(40, 'tinymce, content block, fonts, editor'),
(41, 'translate, translation'),
(42, 'timezone'),
(43, 'vanity,pretty url, clean url, seo'),
(44, 'traffic, statistics, google analytics, quant'),
(45, 'turn off statistics'),
(46, 'configure search, site search, search option'),
(47, 'cache option, change cache, turn on cache, turn off cache, no cache, page cache, caching'),
(48, 'cache option, turn off cache, no cache, page cache, caching'),
(49, 'index search, reindex search, build sitemap, sitemap.xml, clear old versions, page versions, remove old'),
(50, 'editors, hide site, offline, private, public'),
(51, 'file options, file manager'),
(52, 'security, files, media '),
(53, 'security, users, actions, administrator, admin'),
(54, 'security, lock ip, lock out, block ip'),
(55, 'security, registration'),
(56, 'antispam, block spam, security'),
(57, 'lock site, under construction'),
(58, 'profile'),
(59, 'member profile, member page,community'),
(60, 'signup, new user, community'),
(61, 'smtp, mail settings'),
(62, 'email server, mail settings, mail configuration'),
(63, 'email server, mail settings, mail configuration, private message, message system'),
(64, 'attribute configuration'),
(65, 'overrides, system info, debug, support,help'),
(66, 'errors,exceptions, develop, support, help'),
(67, 'logs, email, error, exceptions'),
(68, 'security, alternate storage, hide files'),
(69, 'upgrade, new version');

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
  PRIMARY KEY (`avID`,`atSelectOptionID`)
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

INSERT INTO `atTextareaSettings` (`akID`, `akTextareaDisplayMode`) VALUES
(2, ''),
(3, ''),
(6, '');

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
  `internalLinkCID` int(10) unsigned DEFAULT '0',
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

INSERT INTO `btContentLocal` (`bID`, `content`) VALUES
(1, '	<div id="newsflow-header-first-run"><h1>Welcome to concrete5.</h1>\n						<h2>It''s easy to edit content and add pages using in-context editing.</h2></div>\n						'),
(2, '<div class="newsflow-column-first-run">\n							<h3>Building Your Own Site</h3>\n							<p>If you’re comfortable in PHP concrete5 should be a breeze to learn. Take a few moments to understand the architecture.</p>\n							<p><a href="javascript:void(0)" onclick="ccm_getNewsflowByPath(''/welcome/editors'')" class="btn primary">Editor''s Guide</a></p>\n							</div>'),
(3, '<div class="newsflow-column-first-run">\n							<h3>Developing Applications</h3>\n							<p>If you’re comfortable in PHP concrete5 should be a breeze to learn. Take a few moments to understand the architecture.</p>\n							<p><a href="javascript:void(0)" onclick="ccm_getNewsflowByPath(''/welcome/developers'')" class="btn primary">Developer''s Guide</a></p>\n							</div>'),
(4, '<div class="newsflow-column-first-run">\n							<h3>Designing Websites</h3>\n							<p>Good with CSS and HTML? You can easily theme anything with concrete5.</p>\n							<br/>\n							<p><a href="javascript:void(0)" onclick="ccm_getNewsflowByPath(''/welcome/designers'')" class="btn primary">Designer''s Guide</a></p>\n							</div>'),
(5, '\n						<div class="newsflow-column-first-run">\n						<h3>Business Background</h3>\n						<p>Worried about license structures, white-labeling or why concrete5 is a good choice for your agency?</p>\n						<p><a href="javascript:void(0)" onclick="ccm_getNewsflowByPath(''/welcome/executives'')" class="btn primary">Executive''s Guide</a></p>\n						</div>');

-- --------------------------------------------------------

--
-- Table structure for table `btCoreScrapbookDisplay`
--

CREATE TABLE IF NOT EXISTS `btCoreScrapbookDisplay` (
  `bID` int(10) unsigned NOT NULL,
  `bOriginalID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `btCoreScrapbookDisplay`
--


-- --------------------------------------------------------

--
-- Table structure for table `btCoreStackDisplay`
--

CREATE TABLE IF NOT EXISTS `btCoreStackDisplay` (
  `bID` int(10) unsigned NOT NULL,
  `stID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `btCoreStackDisplay`
--


-- --------------------------------------------------------

--
-- Table structure for table `btDashboardNewsflowLatest`
--

CREATE TABLE IF NOT EXISTS `btDashboardNewsflowLatest` (
  `bID` int(10) unsigned NOT NULL,
  `slot` varchar(1) NOT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `btDashboardNewsflowLatest`
--

INSERT INTO `btDashboardNewsflowLatest` (`bID`, `slot`) VALUES
(8, 'A'),
(9, 'B'),
(12, 'C');

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
  PRIMARY KEY (`asID`),
  KEY `questionSetId` (`questionSetId`)
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
  `includeAllDescendents` tinyint(3) unsigned NOT NULL DEFAULT '0',
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
  `vHeight` varchar(255) DEFAULT NULL,
  `vWidth` varchar(255) DEFAULT NULL,
  `vPlayer` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `btYouTube`
--

