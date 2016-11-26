-- MySQL dump 10.13  Distrib 5.7.12, for linux-glibc2.5 (x86_64)
--
-- Host: localhost    Database: vmv2db
-- ------------------------------------------------------
-- Server version	5.7.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `disease`
--

DROP TABLE IF EXISTS `disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disease` (
  `disease_id` int(11) NOT NULL AUTO_INCREMENT,
  `disease_name` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`disease_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='Disease''s information table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease`
--

LOCK TABLES `disease` WRITE;
/*!40000 ALTER TABLE `disease` DISABLE KEYS */;
INSERT INTO `disease` VALUES (3,'Bệnh viêm gan B','Mô tả 0'),(4,'Bệnh tả','Mô tả 1'),(5,'Bệnh dại','Mô tả 2'),(6,'Bệnh thủy đậu','Mô tả 3'),(7,'Bệnh sởi','Mô tả 4'),(8,'Bệnh quai bị','Mô tả 5'),(9,'Bệnh bại liệt','Mô tả 6'),(10,'Bệnh uống ván','Mô tả 7'),(11,'Bệnh thương hàn','Mô tả 8'),(12,'Bệnh rubella','Mô tả 9'),(13,'Bệnh tiêu chảy cấp','Mô tả 10'),(14,'Bệnh sởi','Mô tả 11'),(15,'Bệnh ho gà và bạch hầu','Mô tả 12'),(16,'Bệnh bại liệt','Mô tả 13'),(17,'Bệnh viêm gan siêu vi B','Mô tả 14'),(18,'Bệnh cúm','Mô tả 15'),(19,'Bệnh viêm não Nhật Bản','Mô tả 16'),(20,'Bệnh HPV gây ung thư cổ tử cung','Mô tả 17'),(21,'Phế cầu khuẩn','Mô tả 18'),(22,'Bệnh thủy đậu','Mô tả 19'),(23,'Bệnh Viêm gan A','Mô tả 20'),(24,'Bệnh do Hib ','Mô tả 21'),(25,'Bệnh dại','Mô tả 22'),(26,'Bệnh Lao','Mô tả 23'),(27,'Bệnh thương hàn','Mô tả 24');
/*!40000 ALTER TABLE `disease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `content` text,
  `image` text,
  `created_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (3,'sdgf','asdf',NULL,'2016-11-14 00:59:14','2016-11-23 00:50:00'),(5,'dgd','sdfgsdfg',NULL,'2016-11-14 01:19:23','2016-11-14 00:00:00');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `gender` int(11) NOT NULL,
  `birthday` date NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` bit(1) NOT NULL,
  `avatar` text,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='User''s information table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (4,'nguyen van a',1,'1994-01-01','123456789','','noname','123456','',NULL),(5,'Huynh Minh Kiet',1,'1994-09-21','012141215','Hoa Khanh, Lien Chieu, Da Nang','minhkiet','123456','',''),(6,'b',1,'1994-10-10','2','2','bbbbbbbbbbbbb','bbbbbb','',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vaccination_record`
--

DROP TABLE IF EXISTS `vaccination_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vaccination_record` (
  `user_id` int(11) NOT NULL,
  `vaccine_id` int(11) NOT NULL,
  `dose` int(11) NOT NULL,
  `injection_date` date NOT NULL,
  `next_dose_date` date NOT NULL,
  PRIMARY KEY (`user_id`,`vaccine_id`,`dose`),
  KEY `fk_vaccination_record_1_idx` (`vaccine_id`),
  CONSTRAINT `fk_vaccination_record_1` FOREIGN KEY (`vaccine_id`) REFERENCES `vaccine` (`vaccine_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_vaccination_record_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Vacinnaction-record''s information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vaccination_record`
--

LOCK TABLES `vaccination_record` WRITE;
/*!40000 ALTER TABLE `vaccination_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `vaccination_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vaccine`
--

DROP TABLE IF EXISTS `vaccine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vaccine` (
  `vaccine_id` int(11) NOT NULL AUTO_INCREMENT,
  `vaccine_name` varchar(255) NOT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `number_of_doses` int(11) NOT NULL,
  `side_effects` text,
  `indication` text,
  `contraindication` text,
  `dosage_and_usage` text,
  `image` text,
  PRIMARY KEY (`vaccine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COMMENT='Vaccine''s information table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vaccine`
--

LOCK TABLES `vaccine` WRITE;
/*!40000 ALTER TABLE `vaccine` DISABLE KEYS */;
INSERT INTO `vaccine` VALUES (7,'r-HBvax','Nha san xuat A',200,4,'Vắcxin viêm gan B không gây ra những phản ứng phụ đáng kể song cũng có thể gây đau nhẹ tại chỗ tiêm nhưng sẽ hết vài ngày sau khi tiêm.\n','Phòng bệnh viêm gan B cho tất cả các đối tượng có nguy cơ bị nhiễm, cụ thể:\nNhóm người khỏe mạnh có nguy cơ cao. - Nhân viên y tế (bác sỹ, nha sỹ, phẫu thuật, y tá, hộ lý...) - Nhân viên bệnh viện thường xuyên phải tiếp xúc với máu. - Nhân viên phòng thí nghiệm. - Gia đình tiếp xúc với người mang virút viêm gan B, đặc biệt là những cháu bé sinh ra từ những người mẹ mang HBsAg và HBeAg. Nhóm bệnh nhân: - Bệnh nhân thường xuyên phải truyền máu có thể bị nhiễm virút viêm gan B. - Bệnh nhân suy giảm miễn dịch. - Bệnh nhân viêm thận mãn tính hoặc phải điều trị ở các đơn vị thấm tích máu. Các nhóm khác: - Nhân viên hành chính, bộ đội, tù nhân, giúp việc trong các gia đình... - Những người đồng tính luyến ái hoặc tiêm chích ma túy. - Dân cư và những người du lịch vào những vùng có tỷ lệ mắc cao như Địa Trung Hải, Trung Âu, Nam Mỹ, Châu Phi và các nước Châu Á.\n','Không có chống chỉ định,vắc xin có thể tiêm phòng cho tất cả các đối tượng mà không gây hại gì, bao gồm các phụ nữ có thai (khuyến cáo không nên tiêm trong 3 tháng đầu), trẻ sơ sinh, bệnh nhân nhiễm virút viêm gan B hoặc người mang HBsAg, những người có anti –HBc dương tính hoặc anti – HBs dương tính và những người bị suy giảm miễn dịch. Nên hoãn tiêm khi trẻ đang mắc các căn bệnh nhiễm trùng cấp tính hoặc bệnh đang tiến triển.\n','- Loại 20 µg/ml dùng trong chương trình CTTCMRQG.\n2 liều trẻ em/lọ 1ml vắcxin có chứa 20 µg HBsAg\n1 liều trẻ em : 0.5ml\nTiêm miễn phí cho trẻ em trong CTTCMRQG.\nMũi tiêm 1 : Tháng 0 Mũi tiêm 2 : Tháng 2 Mũi tiêm 3 : Tháng 4 Mũi tiêm nhắc lại : Sau 1 năm\n- Loại 20µg/ml dùng cho các đối tượng có nhu cầu sử dụng.\nMũi tiêm 1 : Tháng 0 Mũi tiêm 2 : Tháng 1 Mũi tiêm 3 : Tháng 6 Nhắc lại: Sau 5 năm\nLiều dùng:\n1 ml - 20 µg cho người lớn 0,5 ml - 10 µg cho trẻ em (< 10 tuổi)\nCách tiêm:\nLắc kỹ trước khi lấy thuốc. Không được tiêm vào đường tĩnh mạch hoặc trong da.  r-HBvax phải tiêm vào bắp vùng cơ delta, đùi hoặc có thể tiêm dưới da.\n','5a_mnqgq.jpg'),(8,'mORC-VAX','Nha san xuat A',200,4,'Sau khi uống có thể có cảm giác buồn nôn, nôn. Tác dụng phụ hiếm gặp: đau đầu, đau bụng, tiêu chảy nhẹ, sốt.... Các triệu chứng này tự khỏi mà không cần điều trị.\n','Dùng cho trẻ trên 2 tuổi và người lớn sống trong vùng dịch tả lưu hành. Người đi vào vùng có dịch tả lưu hành.\n','Tiền sử dị ứng với bất cứ thành phần nào có trong vắc-xin. Các bệnh nhiễm trùng đường ruột cấp tính. Các bệnh cấp tính và mạn tính đang thời kỳ tiến triển. Đang sử dụng các thuốc ức chế miễn dịch, thuốc chống ung thư. Trường hợp có dị ứng hoặc phản ứng quá mẫn với lần uống trước của vắc-xin tả thì không được uống những liều tiếp theo.\n','Liều dùng 1,5ml/liều Gây miễn dịch cơ bản: uống 2 liều, khoảng cách giữa 2 liều là 14 ngày. Gây miễn dịch nhắc lại: trước mỗi mùa dịch tả, uống 2 liều, khoảng cách giữa 2 liều là 14 ngày.\n','morc-vax_bpghq.jpg'),(9,'HAVRIX','Nha san xuat A',200,4,'Là một hỗn dịch chứa virus viêm gan A đã bất hoạt bằng formaldehyd (chủng HM 175 virus viêm gan A) được hấp phụ trên hydroxid nhôm.\n','Havrix 1440 được dung nạp tốt.\nTrong các nghiên cứu lâm sàng có kiểm soát, các dấu hiệu và triệu chứng được theo dõi trong vòng 4 ngày sau khi tiêm vaccine. Một bảng liệt kê được sử dụng trong nghiên cứu này. Người được tiêm chủng được yêu cầu tường trình tất cả những dấu hiệu lâm sàng xảy ra trong thời gian tiến hành nghiên cứu.\nTrong số các tác dụng phụ tại chỗ hay gặp nhất là đau tại nơi tiêm (có < 0,5% trường hợp nặng) nhưng tự khỏi. Các tác dụng phụ gợi ý tại chỗ khác nhau bao gồm đỏ nhẹ và sưng nơi tiêm chiếm tỷ lệ 4% trong tổng số các đối tượng được tiêm. Các tác dụng phụ toàn thân chủ yếu đều \"nhẹ\", kéo dài không quá 24 giờ, bao gồm nhức đầu, mệt mỏi, sốt, buồn nôn và chán ăn. Các tác dụng phụ này có tần suất thay đổi từ 1 đến 13,9% và tự khỏi.\nMối liên quan giữa các tác dụng phụ này với việc chủng ngừa vẫn chưa được xác minh.\nTần suất các tác dụng phụ gợi ý càng thấp sau khi tiêm liều nhắc lại.\n','- Ở những vùng có tần suất viêm gan A thấp hay trung bình, cần chủng ngừa Havrix đặc biệt ở những đối tượng đang có hoặc sẽ có nguy cơ cao bị lây nhiễm viêm gan như :\nNgười du lịch: những người du lịch đến những vùng có tần suất viêm gan A cao đó là châu Phi, châu Á, vùng Địa Trung Hải, Trung Đông, Trung và Nam Mỹ. Quân đội: nhân viên quân đội đi đến những vùng có bệnh dịch địa phương nhiều hơn hay những vùng điều kiện vệ sinh kém sẽ có nguy cơ viêm gan A. Miễn dịch chủ động được chỉ định ở những đối tượng này. Những người có nguy cơ mắc viêm gan A do nghề nghiệp hoặc có nguy cơ bị lây nhiễm: bao gồm nhân viên làm việc tại các trung tâm giữ trẻ ban ngày, y tá, nhân viên lâm sàng và cận lâm sàng trong bệnh viện và viện nghiên cứu, đặc biệt ở khoa Tiêu hóa và khoa Nhi, công nhân vệ sinh, người bán thực phẩm.\n- Người có tiếp xúc với người nhiễm viêm gan A: do người bị viêm gan A có thể lây truyền virus trong một thời gian dài nên cần chủng ngừa chủ động cho những người có quan hệ gần gũi.\n- Những nhóm người đặc biệt có tần suất viêm gan A cao như người da đỏ, người Eskimo, những người sống trong vùng dịch viêm gan A lưu hành rộng.\n- Có thể tạo miễn dịch chủ động cho những đối tượng nhạy cảm ở những vùng tần suất viêm gan A từ trung bình đến cao như châu Phi, châu Á, vùng Địa Trung Hải, Trung Đông, Trung và Nam Mỹ.\n- Người đồng tính luyến ái.\n- Người bệnh ưa chảy máu.\n- Người chích ma túy.\n- Nguời có quan hệ tình dục với nhiều đối tượng.\n','Như những vaccine khác, nên tạm hoãn tiêm vaccine Havrix ở những đối tượng bị sốt cao cấp tính. Tuy vậy nhiễm trùng nhẹ không phải là một chống chỉ định đối với việc chủng ngừa. Không nên tiêm Havrix 1440 ở những đối tượng có biểu hiện mẫn cảm sau lần chích Havrix 1440 trước đây.\n','havrix_vavbl.jpg'),(10,'Sci-B-Vac','Nha san xuat A',200,4,'Đau nhức tại nơi tiêm chích, nhức đầu, tình trạng khó chịu.\n','Những người chưa bị nhiềm vius viêm gan B. Những người tiếp xúc với người bị nhiễm virus viêm gan B cần được tiêm chủng như: chồng, vợ, con của người bị nhiễm virus viêm gan B hoặc những người chăm sóc bệnh nhân bị nhiễm virus viêm gan B.\n','Người có tiền sử mẫn cảm với vaccin viêm gan B hoặc bất cứ một thành phần nào của vaccin. Ðang sốt cao do nhiễm khuẩn.\n','Vaccin được dùng theo nguyên dạng cung ứng, không pha loãng. Lọ đựng vaccin phải được lắc kỹ và dùng ngay sau đó. Cần lắc vaccin trong khi tiến hành tiêm để duy trì thuốc dưới dạng hỗn dịch. Sau khi lắc, vaccin là một hỗn dịch đục nhẹ, màu trắng. Tuyệt đối không được tiêm vào tĩnh mạch hoặc trong da. Vaccin chỉ được tiêm bắp. Vị trí thích hợp nhất là cơ delta cánh tay đối với người lớn, mặt ngoài đùi cho trẻ em. Khi rút lượng hỗn dịch vaccin ra khỏi lọ, cần dùng kim và bơm tiêm vô khuẩn, không chứa các chất bảo quản, chất sát khuẩn và chất tẩy rửa.\nChú ý: Cách dùng và liều dùng, theo hướng dẫn của nhà sản xuất.\n','sci-b-vac_dbjvc.jpg'),(11,'Rabipur','Nha san xuat A',200,4,'Phản ứng nhẹ tại nơi tiêm, sốt, nhức đầu, đau cơ, sưng hạch, viêm khớp, rối loạn tiêu hóa. Hiếm: phản ứng tim mạch, ra mồ hôi, ớn lạnh, dị cảm, dị ứng, liệt nhẹ\n','Dự phòng & điều trị bệnh dại cho người. Điều trị cho người sau khi tiếp xúc động vật nghi dại ở bệnh nhân chưa miễn dịch hay miễn dịch một phần.\n','Tiêm chủng trước khi phơi nhiễm: không nên tiêm dự phòng bệnh dại cho người đã biết quá mẫn với thành phần vaccine, đang mắc bệnh cấp tính, phụ nữ có thai. Điều trị sau khi phơi nhiễm: không có chống chỉ định tiêm chủng sau khi phơi nhiễm với con vật nghi mắc bệnh\n','Tiêm IM 1 mL/liều. Tiêm ID 0.1 mL/liều. Dự phòng dại 1 liều (IM/ID) vào các ngày 0, 7, 21 (hay 28). Tiêm IM: phác đồ gồm 5 liều vào các ngày 0, 3, 7, 14, 28; cách khác: 2 liều vào ngày 0 (cơ delta phải & trái) & 1 liều vào các ngày 7 & 21. Trẻ nhỏ: có thể tiêm ở vùng trước bên của đùi phải & trái. Tiêm ID:2 liều ID vào cơ delta phải & trái, mỗi bên 1 liều, vào ngày 0, 3, 7; sau đó 1 liều vào ngày 28 & 90; (hoặc 2 liều vào các ngày 0, 3, 7, 28) Cách khác: 8 liều vào ngày 0 (2 bên cơ delta, 2 bên trên xương bã vai, 2 bên đùi, 2 bên vùng phần tư dưới của bụng) & 4 liều vào ngày thứ 7 (2 bên cơ delta & 2 bên đùi) & 1 liều vào ngày 28 & 90. Bệnh nhân đã miễn dịch đủ 2 liều (IM/ID) vào các ngày 0 & 3 (không phụ thuộc vào khoảng cách với lần tiêm cuối)\n','rabipur_rnoar.jpg'),(12,'DTaP','Nha san xuat A',200,4,'Tác dụng phụ thường gặp bao gồm đau và sưng tại chỗ tiêm, sốt nhẹ, khó chịu. Tác dụng phụ nghiêm trọng bao gồm phản ứng dị ứng với các thành phần của thuốc chủng.\n','Là một trong những chủng ngừa được khuyến khích cho trẻ từ 2 tháng đến 6 tuổi. Là một loại vacxin \"3 trong 1\" để chống lại bệnh bạch hầu, uốn ván và ho gà. \n','Trẻ mẫn cảm với thành phần của thuốc. Trẻ nhận được liều bất kỳ của vacxin có uốn ván, bạch hầu, ho gà ho và phát triển dị ứng từ thuốc chủng. Trẻ bị bệnh nặng hơn cảm lạnh, sốt nên dời lịch tiêm đến khi sức khỏe phục hồi. Trẻ có vấn đề về thần kinh, động kinh cần hỏi ý kiến của các chuyên viên chăm sóc y tế.\n','Trẻ nhỏ cần được tiêm 5 liều của thuốc chủng. Mỗi liều nên nhận được tại mỗi lứa tuổi như sau:\nTrẻ được 2 tháng tuổi Trẻ được 4 tháng tuổi Trẻ được 6 tháng tuổi Trẻ từ 15-18 tháng tuổi Trẻ từ 4-6 năm tuổi\nĐể giảm số lần tiêm, bạn có thể tiêm kết hợp DTaP trong những lần tiêm chủng cho bé. Chẳng hạn, DTaP có thể tiêm cùng vacxin ngừa viêm gan B hay vacxin phòng bại liệt…\n','dtap_zgjbs.jpg'),(13,'VARIVAX','Nha san xuat A',200,4,'Bất thường chỗ tiêm (đau và đỏ, ngứa, khối tụ máu, cứng, nốt chai cứng, tê), phát ban dạng thủy đậu, sốt. Viêm võng mạc hoại tử (ở người suy giảm miễn dịch). Buồn nôn, nôn. Thiếu máu bất sản, giảm tiểu cầu, bệnh hạch bạch huyết. Nhiễm bệnh thủy đậu. Viêm não, tai biến mạch máu não, viêm tủy ngang, h/c Guillain-Barré, liệt Bell, mất điều hòa, co giật, viêm màng não vô khuẩn, chóng mặt, dị cảm, dễ bị kích thích. Viêm họng, viêm phổi thùy/kế. H/c Stevens-Johnson, ban đỏ đa dạng, ban xuất huyết Henoch-Schönlein, nhiễm khuẩn da và mô mềm thứ phát, Herpes zoster.\n','Phòng bệnh thủy đậu cho đối tượng ≥ 12 tháng tuổi. Dự phòng cho người nhạy cảm bị phơi nhiễm bệnh thủy đậu trong vòng 3 ngày và có thể đến 5 ngày sau khi tiếp xúc.\n','Tiền sử quá mẫn với thành phần vắc-xin, kể cả gelatin. Tiền sử phản ứng phản vệ với neomycin. Tiền sử gia đình suy giảm miễn dịch bẩm sinh hoặc di truyền (trừ khi miễn dịch tiềm tàng của người nhận vắc-xin đã được chứng minh). Loạn sản máu, bệnh bạch cầu, u lympho hoặc u ác tính khác ảnh hưởng tủy xương hoặc hệ bạch huyết. Điều trị bằng thuốc ức chế miễn dịch (bao gồm corticosteroid liều cao). Suy giảm miễn dịch nguyên phát hoặc mắc phải, bao gồm ức chế miễn dịch liên quan AIDS hoặc biểu hiện lâm sàng khác của nhiễm vi-rút gây suy giảm miễn dịch ở người (trừ ức chế miễn dịch ở trẻ em không có triệu chứng với CD4 T ≥ 25%). Lao hoạt động chưa được điều trị. Bệnh lý hoạt động có sốt > 38.5oC. Phụ nữ có thai.\n','Trẻ em 12 tháng-12t. : 1 liều đơn 0.5 mL. Thanh thiếu niên ≥ 13t. và người lớn: 1 liều 0.5 mL vào ngày đã chọn và 1 liều thứ hai 0.5 mL vào 4-8 tuần sau đó.\n','varivax_owlxa.jpg'),(14,'Tdap','Nha san xuat A',200,4,'Sưng, đỏ, viêm tại vị trí tiêm Đau đầu Mệt mỏi Sốt\n','Trẻ từ 7 đến 18 tuổi: Bác sỹ khuyến cáo vắc xin Tdap nên được nhắc lại để nhắc cơ thể cách phòng tránh nhiễm trùng. Tiêm phòng nhắc lại là vô cùng quan trọng, vì một số vắc xin bao gồm các mũi phòng bệnh bạch hầu, ho gà, uốn ván có thể dừng hoạt động hiệu quả theo thời gian. Nếu con bạn nhỡ liều vắc xin sớm hơn, chúng có thể tiêm vắc xin Tdap bất cứ khi nào theo khuyến cáo của bác sỹ. Người lớn từ 19 tuổi trở đi mà chưa từng tiêm vắc xin Tdap. Vắc xin này đặc biệt quan trọng với những người từ 65 tuổi trở đi và tiếp xúc với trẻ dưới 1 tuổi, bao gồm ông bà, người chăm sóc trẻ, bác sỹ, điều dưỡng và những nhân viên y tế khác.\n','Người dị ứng với thành phần của vắc xin Người đang hôn mê, co giật Người có bệnh về thần kinh Người có hội chứng Guillain Barre Người đang bị sốt\n','Mỗi liều 0.5 ml cho một lần tiêm.\n','tdap_mnrho.jpg'),(15,'Vắc xin Sởi','Nha san xuat A',200,4,'Lọ đơn liều bột đông khô virus sởi sống giảm độc lực để pha thành 0,5ml. Chế phẩm có neomycin.\n','Vắc xin sởi được đánh giá là an toàn. Các phản ứng sau tiêm thường nhẹ, có thể biểu hiện như với các vắc xin khác: sốt (5-15%), phát ban (5%), sưng, nóng, đỏ đau tại chỗ tiêm… Hầu hết những tác dụng phụ sẽ hết trong khoảng từ 1-2 ngày mà không cần điều trị gì.  Phản ứng nghiêm trọng sau tiêm vắc xin sởi là rất hiếm gặp nhưng cũng có thể xảy ra. Tuy nhiên, để đảm bảo an toàn tiêm chủng, cần theo dõi trẻ trong vòng 30 phút sau tiêm tại điểm tiêm. \n','Miễn dịch chủ động phòng sởi.\n','Mẫn cảm với trứng. Dị ứng với bất kỳ thành phần nào có trong vacxin, ví dụ với neomycin. Có tiền sử sốc hoặc có phản ứng nghiêm trọng sau tiêm chủng vắc xin chứa thành phần sởi như: sốt cao trên 39oC kèm co giật hoặc dấu hiệu não/màng não, tím tái, khó thở, sốc. Các trường hợp chống chỉ định khác theo hướng dẫn của nhà sản xuất.\n','2a1_beysl.jpg'),(16,'MUMPS','Nha san xuat A',200,4,'Sưng, đỏ tại vị trí tiêm ngay sau khi tiêm.\n','Vắcxin được chỉ định cho tiêm chủng phòng bệnh quai bị định kỳ và khẩn cấp.\nTiêm chủng được định kỳ tiến hành 2 lần ở các tuổi 12 -15 tháng và 6 tuổi ở trẻ chưa có tiền sử mắc quai bị. Khoảng cách giữa mũi tiêm chủng lần đầu và liều nhắc lại không ít hơn 6 tháng. Tiêm chủng khẩn cấp được chỉ định cho trẻ từ 12 tháng tuổi, trẻ vị thành niên và người lớn nếu đã có tiếp xúc với bệnh nhân quai bị nhưng chưa có tiền sử mắc quai bị và chưa được tiêm chủng theo lịch phòng bệnh quai bị. Trong trường hợp không có chống chỉ định, vắcxin cần được tiêm không muộn hơn 72 giờ kể từ khi có tiếp xúc với bệnh nhân.\n','Các trường hợp dị ứng nặng với Aminoglycozid (Gentamycin sunfat...), trứng gà.\nTình trạng suy giảm miễn dịch tiên phát, bệnh ác tính về máu và khối u. Phản ứng mạnh (sốt hơn 400c, phù nề, đường kính vết đỏ ở nơi tiêm vắcxin lớn hơn 8cm) hoặc có các biến chứng trong lần tiêm chủng trước. Phụ nữ mang thai.\nVào ngày tiêm chủng, với mục đích phát hiện lý do chống chỉ định của các bác sỹ (y sỹ) phải hỏi kỹ, thăm khám những người tiêm trong trường hợp cần thiết phải làm các xét nghiệm.\nGhi chú: Nhiễm HIV không là chống chỉ định.\n','0.5 ml cho một liều tiêm.\n','mumps_kralg.jpg'),(17,'Bại liệt bất hoạt (IPV)','Nha san xuat A',200,4,'Vắc xin bại liệt bất hoạt là một hỗn dịch vô khuẩn của virus bại liệt tuýp 1, tuýp 2 và tuýp 3 phát triển trên nuôi cấy tế bào, được cô đặc, tinh khiết, bất hoạt và dùng để gây miễn dịch chủ động, đặc hiệu cho người, phòng bệnh bại liệt do virus Polio gây nên.\n','Có thể gây viêm tấy tại chố tiêm, sốt, chán ăn và nôn. Phản ứng quá mẫn cảm với kháng sinh trong vacxin.\n','Miễn dịch chủ động phòng bại liệt cho người có chống chỉ định dùng vacxin sống hoặc cho người sinh sống ở các nước không muốn dùng vacxin sống. \n','Bệnh bạch cầu, u lympho, và các bệnh ác tính toàn thân khác; các bệnh suy giảm hoặc không có miễn dịch tế bào (giảm hoặc không có gamaglobulin huyết); dùng các thuốc ức chế miễn dịch; nôn; ỉa chảy; có tiền sử dị ứng với vaccin. Ðối với các bệnh cấp sốt cao, bệnh mạn tính nặng, nhiễm khuẩn cấp kèm sốt, nên hoãn dùng vaccin.\n','bai-liet-ipv_sgebc.jpg'),(18,'VAT','Nha san xuat A',200,4,'Đôi khi có sốt, chỗ tiêm có xuất hiện quầng đỏ, đau, sưng nhẹ và tự mất đi. Có thể bị dị ứng trong những trường hợp tiêm nhắc lại quá nhiều lần.\n','Dùng để gây miễn dịch chủ động phòng bệnh uốn ván.\n','Tạm hoãn trong những trường hợp bệnh cấp tính. Không tiêm cho những người có biểu hiện dị ứng với lần tiêm trước.\n','Tiêm bắp, liều 0,5 ml\nGây miễn dịch cơ bản gồm hai liều cách nhau ít nhất 30 ngày. Sau 6 đến 12 tháng tiêm nhắc lại liều thứ 3.\nĐối với phụ nữ ở lứa tuổi sinh đẻ:\n+Liều 1: tiêm ở lứa tuổi dậy thì hoặc càng sớm càng tốt.\n+Liều 2: cách liều 1 ít nhất 30 ngày\n+Liều 3: cách liều 2 ít nhất 6 tháng hoặc khi có thai lần sau.\n+Liều 4: cách liều 3 ít nhất 1 năm hoặc khi có thai lần sau.\n+Liều 5: cách liều 4 ít nhất 1 năm hoặc khi có thai lần sau.\nĐối với thai phụ chưa tiêm lần nào thì gây miễn dịch cơ bản 2 liều và liều thứ hai trước khi sinh ít nhất 30 ngày\n','uon-van-hap-thu_cyxid.jpg'),(19,'DPT','Nha san xuat A',200,4,'Thường gặp: Sờ nắn đau, ban đỏ, rắn tại chỗ tiêm. Ít gặp: Sốt 39 - 40ºC, thường kéo dài tới 48 giờ. Hiếm gặp: Hạch cổ, phản ứng phản vệ; co giật có sốt hoặc không, thường xảy ra trong vòng 3 ngày sau khi tiêm phòng; kêu khóc kéo dài, không dỗ được thường xảy ra trong vòng 48 giờ và lâu khoảng 3 giờ hoặc hơn; bệnh não xảy ra trong vòng 7 ngày; sốt 40,50C hoặc cao hơn xảy ra trong vòng 48 giờ. Triệu chứng bệnh não cấp (kích thích, ngủ quá mức hoặc nôn nặng liên tục).\n','Mọi trẻ em từ 2 tháng đến 7 tuổi đều cần được tiêm vaccin phòng bạch hầu - uốn ván và ho gà, bao gồm cả: Trẻ em đang trong giai đoạn bình phục sau khi bị mắc bệnh bạch hầu và uốn ván. Trẻ em đang trong giai đoạn bình phục sau khi bị mắc hội chứng giống ho gà. Trẻ em chưa được tiêm đủ liều vaccin phòng ho gà. Người trong gia đình hoặc những đối tượng khác có tiếp xúc chặt chẽ với người mắc bệnh ho gà. Trẻ có suy giảm miễn dịch. Trẻ đẻ thiếu tháng.\n','Không dùng vaccin cho những người có tiền sử quá mẫn toàn thân với giải độc tố bạch hầu và uốn ván hoặc vaccin ho gà, những người có tiền sử quá mẫn với thimerosal, những người bị giảm tiểu cầu hoặc bất cứ rối loạn đông máu nào không cho phép tiêm bắp. Những người có tổn thương hệ thần kinh trung ương, đang còn tiến triển hoặc có động kinh chưa kiểm soát được. Người có tiền sử tổn thương não khi đẻ vẫn phải tiêm chủng trừ phi có chứng cứ bệnh vẫn còn tiến triển. Sốt vừa hoặc cao (trên 40,50C).\n','Lắc kỹ trước khi dùng. Chỉ dùng cho trẻ em từ 2 tháng đến 7 tuổi. Không dùng cho trẻ em trên 7 tuổi; ưu tiên cho các trẻ em từ 2 - 6 tuổi để tạo miễn dịch cơ bản, lý tưởng nhất là từ 2 đến 3 tháng tuổi. Tạo miễn dịch cơ bản: Tiêm bắp, mỗi liều 0,5 ml, tiêm 3 lần với khoảng cách từ 4 đến 8 tuần, có một liều tăng cường vào thời điểm 15 - 18 tháng tuổi. Tiêm nhắc lại cho những trẻ em 4 - 6 tuổi với liều 0,5 ml, tiêm bắp. Chương trình tiêm chủng mở rộng của Việt Nam đã triển khai lịch tiêm DPT cho trẻ em từ 2 đến 4 tháng tuổi để gây miễn dịch cơ bản như sau: Từ 2 tháng tuổi 1 liều; 3 tháng tuổi 1 liều; 4 tháng tuổi 1 liều.\n','dpt_klcos.jpg'),(20,'Td','Nha san xuat A',200,4,'Phản ứng tại chỗ như đau, quầng đỏ, sưng nơi tiêm (từ 10% - 75%). Đôi khi có sốt nhẹ 38ºC đến 39ºC, vài ngày sau tự hết. Áp xe vô khuẩn khoảng 6 -10 trường hợp/1 triệu liều. Có thể xuất hiện phản ứng phụ toàn thân như sốt, đau cơ cánh tay, đau đầu (khoảng 10% trường hợp). Các phản ứng phụ nói chung là nhẹ và tự khỏi. Có thể xuất hiện viêm dây thần kinh ngoại biên, hội chứng Guillain-Barré nhưng rất hiếm gặp.\n','Dùng để gây miễn dịch nhắc lại nhằm phòng bệnh uốn ván và bạch hầu cho trẻ em lứa tuổi lớn (từ 10 tuổi trở lên) và người lớn.\n','Khi có biểu hiện dị ứng với kháng nguyên Bạch hầu và Uốn ván ở những lần tiêm trước. Tạm hoãn  tiêm vắc xin Td trong những trường hợp có bệnh nhiễm trùng cấp tính, sốt chưa rõ nguyên nhân. Không tiêm bắp cho người có rối loạn chảy máu như Hemophili hoặc giảm tiểu cầu.\n','Đường tiêm: Tiêm bắp sâu.\n \nLiều tiêm: 0,5 ml\n \nTiêm nhắc lại: \n \nTrường hợp A: Với trẻ em đã tiêm đủ 3 liều vắc xin DPT gây miễn dịch cơ bản : Tiêm nhắc lại 1 liều vắc xin Td vào lứa tuổi thứ 10 hoặc hơn và  sau đó cứ 10 năm sau tiêm nhắc lại 1 liều vắc xin Td.   Trường hợp B: Với trẻ em trước 10 tuổi chưa được tiêm vắc xin DPT hay vắc xin TD: Tiêm miễn dịch cơ bản 2 liều, cách nhau 1 tháng, sau 6 tháng tiêm nhắc 1 liều; và  sau đó cứ 10 năm sau tiêm nhắc lại 1 liều vắc xin Td.  \n','td_jlkge.jpg'),(21,'Polysaccharide','Nha san xuat A',200,4,'Phản ứng phụ thường nhẹ, nhanh chóng biến mất. Khi tiêm vắc xin, tại nơi tiêm có sưng nề nhẹ và hết trong 24 giờ đầu. Thường có sốt nhẹ 37,5oC- 38,5oC, hiếm có trường hợp sốt cao trên 39oC. Triệu chứng sốt nhẹ thường hết sau 24 giờ kể từ khi tiêm vắc xin.\n','Vắc xin dùng để gây miễn dịch chủ động phòng bệnh thương hàn cho người lớn và trẻ em từ 2 tuổi trở lên.\n','Không dùng vắc xin này cho những trường hợp có tiền sử dị ứng với một trong các thành phần của vắc xin. Phụ nữ đang mang thai, trường hợp bắt buộc phải tiêm, cần có ý kiến của bác sĩ điều trị. Trẻ em dưới 2 tuổi. Trẻ em từ 2- 5 tuổi cần hỏi ý kiến của bác sĩ.   \n','Tiêm một liều duy nhất 0,5ml (tiêm dưới da hoặc bắp thịt). Tẩy trùng nắp lọ vắc xin trước khi lấy ra một liều vắc xin bằng cách dùng syringe, tiệt trùng phù hợp với kim tiêm.\n','polysaccharide_vmfqr.jpg'),(22,'Tetatox','Nha san xuat A',200,4,'Vắc xin uốn ván hấp phụ được điều chế từ độc tố uốn ván đã được xử lý bằng formaldehyd và nhiệt độ để mất tính độc mà vẫn còn tính sinh miễn dịch, chứa ít nhất 1000 Lf/ mg protein nitrogen và hấp phụ với một tá chất thích hợp như nhôm phosphat hoặc nhôm hydroxyd trong dung dịch muối đẳng trương. Có thể cho thêm chất bảo quản thích hợp.\n','Thành phần uốn ván hiếm gây viên dây thần kinh ngoại biên. Ít gặp sốt nhẹ < 38 độ C, nhức đầu, ngứa, sưng đỏ và mệt mỏi. Hiếm khi nôn, hay nổi hạch.\n','Phòng uốn ván cho người lớn và trẻ em trên 10 tuổi. Miễn dịch chủ động chống uốn ván và uốn ván rốn Xử trí vết thương (vết thương dễ gây uốn ván và vết thương sạch).\n','Mẫn cảm với các thành phần của thuốc. Trẻ em dưới 10 tuổi.\n','tetatox_qvphu.jpg'),(23,'Rubella','Nha san xuat A',200,4,'Các phản ứng thường nhẹ và thoáng qua. Vắcxin rubella có thể gây đau nhẹ và nhạy cảm tại vùng tiêm trong vòng 24 giờ sau khi tiêm. Thành phần rubella có thể gây nên những triệu chứng rõ ràng như đau khớp (25%) và viêm khớp (10%) ở nữ giới thanh thiếu niên và trưởng thành, các triệu chứng này thường kéo dài từ vài ngày đến 2 tuần. Tuy nhiên, các phản ứng này rất hiếm gặp ở trẻ em và nam giới (0-3%).Các triệu chứng điển hình bắt đầu từ 1 ngày đến 2 tuần. Các phản ứng này thường xảy ra ở những người không có miễn dịch, và vì vậy việc tiêm vắcxin là quan trọng. Sốt nhẹ và ngứa, nổi hạch bạch huyết, đau cơ và cảm giác khó chịu phổ biến được báo cáo. Sự giảm lượng tiểu cầu rất hiếm gặp và được báo cáo với tỉ lệ dưới 1 trường hợp/30.000 liều tiêm. Các phản ứng sốc phản vệ cũng hiếm khi gặp.\n','Vắcxin rubella được chỉ định trong các trường hợp sau :\nTiêm phòng rubella cho đối tượng từ 12 tháng tuổi đến tuổi dậy thì.\nTiêm chủng vắcxin rubella sống giảm độc lực cho nữ giới không có thai tuổi thanh thiếu niên và trưởng thành nếu có những dấu hiệu cảnh báo. Việc tiêm phòng cho nữ giới tuổi trưởng thành tạo nên một sự bảo vệ chống lại việc lây nhiễm rubella trong thai kỳ, và do đó bảo vệ được thai nhi và tránh được hậu quả nhiễm rubella bẩm sinh.Phụ nữ ở độ tuổi sinh đẻ không nên có thai trong vòng 28 ngày sau khi tiêm.\nPhụ nữ hết tuổi sinh đẻ:\nĐã có rất nhiều trường hợp cho thấy lợi ích của việc tiêm phòng vắcxin rubella ở đối tượng này.\nTiêm nhắc lại:\nTrẻ em được tiêm lần đầu ở dộ tuổi dưới 12 tháng phải được tiêm nhắc lại.\nDựa trên những bằng chứng hiện có, không có lý do để tiêm nhắc lại đối với những đối tượng đã tiêm lần đầu ở độ tuổi đủ 12 tháng tuổi trở lên.\nTuy nhiên, những người có bằng chứng cho thấy lần tiêm trước không có hiệu quả cần được nhắc lại, vắcxin rubella là an toàn và có hiệu lực khi tiêm đồng thời với vắc xin DTP, DT, TT, Td, BCG và Polio (OPV và IPV), Haemophilus influenza tuýp b, vắcxin viêm gan B, vắcxin sốt vàng và bổ xung vitamin A.\n','Những người đang sử dụng corticosteroids, các thuốc ức chế miễn dịch khác hoặc đang xạ trị có thể không có đáp ứng được miễn dịch tối ưu. Không được tiêm vắcxin cho những người đang mắc các bệnh truyền nhiễm cấp tính, bệnh bạch hầu, thiếu máu nghiêm trọng và các bệnh nặng khác về máu, có tổn thương chức năng thận, bệnh tim mất bù, đang sử dụng gammaglobulin hoặc truyền máu. Vắcxin có thể còn vết của neomycin. Chống chỉ định tuyệt đối với người có phản ứng quá mẫn hoặc dạng quá mẫn với neomycin, có tiền sử phản ứng quá mẫn hoặc dạng quá mẫn. Không chống chỉ định đối với các trường hợp sốt nhẹ, viêm đường hô hấp nhẹ hoặc tiêu chảy, các triệu chứng ốm nhẹ khác. Đặc biệt cần tiêm phong cho trẻ em suy dinh dưỡng. Vì ảnh hưởng của vắcxin rubella lên thai nhi còn chưa được biết tới, nên tiêm vắcxin rubella cho phụ nữ mang thai là chống chỉ định.\n','Một liều đơn 0,5ml được tiêm theo đường tiêm dưới da sâu ở mặt trước bên đùi đối với trẻ nhỏ và bắp tay đối với trẻ lớn hơn.\n','rubella_mjtjc.jpg'),(24,'ROTAVIN-M1','Nha san xuat A',200,4,'Kết quả thử nghiệm lâm sàng tại 2 địa điểm nghiên cứu tại Việt Nam (Phú Thọ và Thái Bình) với gần 1000 trẻ từ 6 đến 12 tuần tuổi cho thấy:\n- Các triệu chứng có thể gặp ở trẻ sau khi uống  vắc xin là: nôn, sốt, tiêu chảy, đau bụng, ho, quấy khóc... nhưng rất ít và không có sự khác biệt có ý nghĩa thống kê giữa nhóm trẻ uống vắc xin và nhóm trẻ uống giả dược.\n- Có một số trường hợp bị tiêu chảy nhưng chưa có bằng chứng nào chứng minh có liên quan đến vắc xin Rotavin-M1.\n- Không có trường hợp nào bị phản ứng phụ nghiêm trọng.\nThông báo cho bác sĩ các tác dụng không mong muốn khi sử dụng vắc xin.\n','Vắc xin Rotavin-M1 được chỉ định để phòng viêm dạ dày ruột gây tiêu chảy cấp do virus rota. Đối tượng thích hợp uống liều 1 là trẻ từ 6-12 tuần tuổi.\n','Không dùng Rotavin-M1 cho trẻ quá mẫn sau khi uống liều vắc xin đầu tiên hoặc quá mẫn với bất kỳ thành phần nào của vắc xin. Không sử dụng vắc xin Rotavin-M1 nếu trẻ có bệnh lý nặng, cấp tính, sốt cao, trẻ đang bị tiêu chảy hoặc nôn. Không sử dụng Rotavin-M1 cho trẻ bị dị tật bẩm sinh đường tiêu hóa, bị lồng ruột hay đang bị suy giảm miễn dịch nặng.\n','Lịch uống:\nLiều đầu tiên cho trẻ từ 6 tuần. Liều thứ hai uống sau liều 1 - 2 tháng\nNên cho trẻ hoàn thành uống vắc xin  Rotavin-M1 trước 6 tháng tuổi.\nCách uống:\nĐể tan băng vắc xin, lắc đều, sau đó để trên phiến đá trước khi cho uống. Dùng xi lanh vô trùng hút 2ml vắc xin, bỏ kim tiêm; Cho uống vắc xin: cho trẻ dựa lưng vào lòng mẹ, đưa xi lanh có vắc xin vào phía trong má, từ từ cho trẻ uống hết lượng vắc xin.\n','rotavin-m1_hjbxz.jpg'),(25,'MVVAC','Nha san xuat A',200,4,'Không thấy xuất hiện phản ứng phụ nghiêm trọng sau khi tiêm vắc xin Sởi. Những phản ứng phụ có thể gặp là đau, sưng và ban đỏ tại chỗ tiêm. Phản ứng này thường là nhẹ và sẽ hết sau khi tiêm 1-3 ngày. Những phản ứng toàn thân như sốt, ban, ho và sổ mũi cũng có thể xảy ra ở một vài trẻ em và thường kéo dài từ 1 đến 3 ngày rồi tự khỏi mà không cần điều trị. Có xuất hiện trường hợp tiêu chảy nhẹ và nôn nhưng chưa đủ bằng chứng kết luận nguyên nhân là do vắc xin. Rất hiếm gặp trường hợp bị co giật, viêm não hay giảm tiểu cầu (tỉ lệ xuất hiện ≤ 1/1.000.000)\n','Vắc xin sởi được chỉ định để gây miễn dịch chủ động phòng bệnh sởi. Đối tượng chỉ định là trẻ từ 9 tháng tuổi trở lên và người chưa có kháng thể sởi.\n','Trường hợp mẫn cảm với bất cứ thành phần nào của vắc xin. Phụ nữ có thai. Trường hợp bị nhiễm trùng cấp tính, mắc bệnh lao tiến triển chưa được điều trị hay suy giảm miễn dịch (trừ trẻ em bị HIV).\n','Liều tiêm: 0,5mL/liều.\nĐường tiêm: Vắc xin sởi chỉ được tiêm dưới da. Không được tiêm tĩnh mạch\nLịch tiêm: Liều vắc xin thứ nhất tiêm cho trẻ từ 9 tháng tuổi trở lên (theo lịch tiêm của chương trình TCMR) và liều thứ hai tiêm nhắc lại khi trẻ được 6 tuổi.\n','mvvac_xvczl.jpg'),(26,'Tritanrix HB','Nha san xuat A',200,4,'Tritanrix HB được chỉ định cho trẻ từ 6 tuần tuổi trở lên để tạo miễn dịch chủ động chống lại các bệnh bạch hầu, uốn ván, ho gà và viêm gan B (HB) \n','Không nên dùng Tritanrix HB cho những người đã biết là quá mẫn với bất kỳ thành phần nào của vaccine hoặc những người đã có biểu hiện quá mẫn sau khi tiêm vaccine bạch hầu, uốn ván, ho gà hoặc vaccine viêm gan B. Chống chỉ định dùng Tritanrix HB cho trẻ đang có bệnh não chưa rõ căn nguyên, xuất hiện trong vòng 7 ngày sau lần tiêm chủng trước với vaccine chứa thành phần ho gà. Nên tiếp tục lịch tiêm chủng với vaccine DT và HB.\n','Phải dùng liều đề nghị của vaccine là 0,5ml.\nLịch tiêm chủng cơ bản gồm 3 mũi trong vòng 6 tháng tuổi đầu tiên. Ở những nơi vaccine HB không được tiêm ngay khi sinh thì có thể tiêm vaccine kết hợp ngay lúc 8 tuần tuổi. Nên duy trì việc tiêm vaccine HB ngay khi sinh tại những vùng có tần suất HB cao. Trong những trường hợp này nên tiêm vaccine kết hợp cho trẻ ngay từ lúc 6 tuần tuổi.Ba mũi vaccine này phải được tiêm cách nhau ít nhất là 4 tuần.\nKhông nên thay đổi các biện pháp dự phòng viêm gan B ở những trẻ được sinh ra từ những bà mẹ đã biết mang virus HB. Những trẻ này có thể cần tiêm riêng các vaccine HB và DTPw cũng cần tiêm HBIg ngay khi sinh.Tritanrix HB đã được chứng minh là có thể tiêm liều nhắc lại một cách an toàn vào năm 2 tuổi.\n','Nên bảo quản Tritanrix HB ở 2 – 80C. Không được làm đông vaccin. Loại bỏ vaccin đã bị đông đá.\n','tritanrix_cxcls.jpg'),(27,'Trivivac','Nha san xuat A',200,4,'Sau khi tiêm vắc xin, tăng thân nhiệt là biểu hiện hay gặp nhất, hiếm khi vượt qua 39°C.   Các triệu chứng chứng phát ban, viêm kết mạc, triệu chứng viêm hô hấp trên, mệt mỏi, chán ăn, sưng tuyến nước bọt, hạch lân cận, đau khớp có thể xảy ra. Phần lớn tác dụng phụ xảy ra trong khoảng từ ngày 6-12 sau khi tiêm và tồn tại 1-3 ngày, ít khi lâu hơn. Vắc xin TRIVIVAC không gây ra viêm màng não sau khi tiêm chủng vắc xin.\n','Vắc xin này sử dụng phòng bệnh đặc hiệu cho sởi, quai bị, sốt rubella cho người lớn và trẻ em. Vắc xin được chỉ định đặc biệt cho các đối tượng phụ nữ đang ở lứa tuổi sinh đẻ và trẻ em. Tiêm chủng vắc xin cũng được áp dụng đặc biệt cho các đối tượng trẻ em nhiễm lao đang điều trị hoặc đã điều trị khỏi, bệnh kén xơ và các bệnh tim (còn bù), phổi mãn tính.\n','Các tình trạng sốt trong thời kỳ dưỡng bệnh (2 tuần). Điều trị các thuốc ACTH, corticosteroid, xạ trị, các thuốc thuộc nhóm alkyl hoặc ức chế chuyển hoá, suy giảm miễn dịch nặng. Bệnh bạch cầu, các u bạch huyết lympho hoặc các bệnh ác tính khác ảnh hưởng đến chức năng tuỷ xương hoặc hạch bạch huyết. Mẫn cảm với các thành phần của vắc xin. Có thai. Không dùng Vắc xin trong vòng 4 tuần tước hoặc sau khi tiêm các Vắc xin sống khác trừ bại liệt có thể tiêm đồng thời trên trẻ khoẻ mạnh. Sau khi truyền máu, huyết tương hoặc các globulin miễn dịch trong vòng 3 tháng không tiêm Vắc xin.\n','Lịch tiêm:\nLiều đầu tiên tiêm cho trẻ em sau tháng thứ 15 và ở mọi lứa tuổi với người lớn. Liều nhắc lại nên tiêm sau mũi thứ nhất 6 đến 10 tháng.\nCách dùng:\nDùng dung môi MOPASOL để pha Vắc xin. Tiêm Vắc xin dưới da, vị trí thích hợp là mặt ngoài của phần trên cánh tay với thể tích khoảng 0,7 ml bằng xylanh dùng 1 lần.\nKhông tiêm vắc xin vào tĩnh mạch.\n','trivivac_gcvpi.jpg'),(28,'D.T.Vax','Nha san xuat A',200,4,'Đau tại chỗ tiêm hiếm khi gặp. Có thể sốt nhẹ trong vòng 24-48 giờ sau khi tiêm. Nổi nốt cứng hay nốt dưới da có thể xảy ra và tồn tại một hay vài tuần. Ngoại lệ, các phản ứng có thể nặng, đặc biệt khi tiêm nhắc thường là do phản ứng dị ứng với biến độc tố bạch hầu.\n','Phòng ngừa đồng thời bệnh bạch hầu và uốn ván ở trẻ nhỏ và trẻ em.\nVaccin D.T.Vax được dùng để thay thế vaccin D.T.Coq/D.T.P khi có chống chỉ định dùng vaccin ho gà. Trẻ em bị nhiễm virus làm suy giảm miễn dịch ở người (HIV): Theo khuyến cáo của Tổ Chức Y Tế Thế Giới, trẻ em nhiễm HIV có triệu chứng hay không có triệu chứng, nên tiêm chủng D.T.Vax theo lịch thông thường.\n','Mẫn cảm với bất cứ thành phần nào của thuốc.\nThận trọng:\nHoãn tiêm nếu đang sốt, nhiễm khuẩn cấp hay đợt tiến triển bệnh mạn tính Dị ứng hay phản ứng nghiêm trọng ở lần tiêm trước Suy giảm mien dịch hay đang dung thuốc ức chế mien dịch\n','Tiêm ngừa cơ bản: 3 mũi tiêm 0,5 ml vaccin cách nhau 1 tháng.\nTiêm nhắc: 1 mũi tiêm 0,5 ml vaccin lúc 1 năm sau mũi tiêm thứ ba, và sau đó tiêm lại mỗi 5 đến 10 năm, dùng vaccin loại giảm liều biến độc tố bạch hầu.\n','d-t-vax_egdgr.jpg'),(29,'Meningococcal A+C','Nha san xuat A',200,4,'Hoạt chất: polysaccharide của Neisseria meningitidis týp A (50mcg trong một liều 0.5ml) và polysaccharide của Neisseria meningitidis týp C (50mcg trong một liều 0.5ml).\nCác thành phần khác:\nBột: lactose monohydrate. Dung môi: sodium chloride, disodium phosphate dihydrate, monosodium phosphate và nước pha tiêm.\n','Cũng như các dược phẩm khác, khi dùng vắc-xin MENINGOCOCCAL A+C có thể gặp các tác dụng không mong muốn, mặc dù không phải ai cũng gặp các tác dụng không mong muốn sau khi tiêm vắc-xin. Trong các nghiên cứu lâm sàng, người ta ghi nhận các tác dụng không mong muốn sau đây:\nRất thường gặp (nhiều hơn 1/10 người gặp sau khi tiêm vắc-xin): nhức đầu, phản ứng tại nơi tiêm như đau tại nơi tiêm thoáng qua đôi khi kèm với sưng hay quầng đỏ, mệt mỏi nhiều, dễ bị kích thích. Thường gặp (nhiều hơn 1/100 người gặp sau khi tiêm vắc-xin): tiêu chảy, sốt (≥ 38oC). Trong quá trình lưu hành sản phẩm, người ta ghi nhận rất hiếm gặp các tác dụng không mong muốn sau đây (ít hơn 1/10.000 người gặp sau khi tiêm vắc-xin).\nKhông thể tính toán chính xác tần suất gặp:\nCác phản ứng kiểu dị ứng (phát ban, mày đay, ban đỏ hay phản ứng phản vệ), Ăn kém ngon.. Nôn. Cảm giác kiến bò, cảm giác bị kim châm (dị cảm), các triệu chứng như đau đầu, sốt, nhạy cảm với ánh sáng, cứng cổ (kích thích màng não), co giật. Đau cơ hay đau khớp.\n','Vắc-xin MENINGOCOCCAL A+C được dùng để phòng ngừa các bệnh do Neisseria meningitidis (Não mô cầu) týp A và týp C gây ra ở người lớn và trẻ em từ hai tuổi trở lên. Vắc-xin này giúp cơ thể tạo ra sự bảo vệ cho mình (kháng thể) kháng lại vi khuẩn này. Vi khuẩn Não mô cầu týp A và týp C có thể gây nên các trường hợp nhiễm khuẩn nặng và đôi khi gây tử vong, như là viêm màng não hay nhiễm khuẩn huyết (nhiễm khuẩn toàn thân). Vắc-xin chỉ bảo vệ cơ thể phòng các bệnh do Não mô cầu týp A và týp C gây ra. Vắcxin này không phòng ngừa được viêm màng não hay nhiễm khuẩn huyết (nhiễm khuẩn toàn thân) do Não mô cầu các týp khác hay các tác nhân khác gây ra.\n','Không được dùng vắc-xin MENINGOCOCCAL A+C nếu:\nBị dị ứng với bất kỳ một thành phần nào của vắc-xin. Trước đây đã từng bị phản ứng nghiêm trọng trong khi tiêm vắc-xin này. Bị sốt cao hay bị nhiễm khuẩn cấp tính, nên hoãn việc tiêm ngừa lại. Không được tiêm bắp cho người bị rối loạn chảy máu như hemophili hoặc giảm tiểu cầu vì họ có thể bị chảy máu hay tụ máu tại chỗ tiêm.\n \n','meningococcal-ac_ijyul.jpg'),(30,'Imovax Polio','Nha san xuat A',200,4,'Sốt do bệnh nhiễm trùng cấp tính: đợi đến khi khỏi bệnh. Bị dị ứng với hoạt chất, một trong các tá dược của vắc-xin, với neomycin, với streptomycin hay với polymycine B hay trước nay đã từng bị dị ứng sau khi tiêm vắc-xin này.\n','Phòng ngừa bệnh bại liệt ở trẻ nhỏ, thiếu niên và người lớn; để tiêm liều cơ bản hoặc liều nhắc lại.\n','Dị ứng với hoạt chất, streptomycine, neomycine hoặc polymycin B. Sốt do bệnh nhiễm trùng cấp tính: hoãn tiêm ngừa.\n','Cách dùng:\nTiêm bắp hoặc tiêm dưới da. Vắc-xin này được khuyến cáo tiêm từ hai tháng tuổi. Hủy bơm kim tiêm sau khi sử dụng.\nChủng ngừa cơ bản & liều lượng:\nTrẻ em từ 2 tháng tuổi: tiêm 3 liều 0,5 ml cách nhau ít nhất là 1 tháng. Người lớn chưa chủng ngừa: tiêm 2 liều liên tiếp, mỗi liều 0.5 ml cách nhau ít nhất 1 tháng. Nhắc lại:\n              - Đối với trẻ em, liều thứ tư (nhắc lại lần 1) được tiêm một năm sau mũi tiêm thứ 3.\n              - Đối với người lớn, liều thứ 3 (nhắc lại lần 1) được tiêm lúc 8-12 tháng sau mũi thứ 2\n              - Tiêm nhắc mỗi 5 năm đối với trẻ em và thanh thiếu niên, và mỗi 10 năm đối với người lớn\n','imovax-polio_lkdvj.jpg'),(31,'Heberbiovac HB','Nha san xuat A',200,4,'Các thử nghiệm đã tiến hành chứng minh tính phản ứng thấp của vắc xin. Thường gặp các phản ứng tại chỗ nhẹ như chai cứng da tại chỗ tiêm, hồng ban, và đau tại chỗ tiêm, có thể là do tá dược hydroxide nhôm. Các phản ứng toàn thân như sốt, đau đầu và mệt mỏi có thể xuất hiện trong 1 số ít trường hợp, nhưng chưa mối liên hệ với vắc xin là chưa rõ ràng.\n','Heberbiovac HB tạo miễn dịch chủ động chống nhiễm HBV và ngăn ngừa các biến chứng có thể xảy ra như Viêm gan cấp và mãn tính, xơ gan, ung thư gan nguyên phát. Vắc xin này nên được tiêm cho tất cả trẻ sơ sinh và thanh thiếu niên.\nĐặc biệt những nhóm đối tượng có nguy cơ cao sau đây được khuyến cáo nên tiêm vắc xin:\nNhân viên y tế có tiếp xúc trực tiếp với bệnh nhân, nhân viên nhà tang lễ, nhân viên pháp y. Sinh viên Y khoa, học sinh y tá và trung cấp kỹ thuật y tế thường tiếp xúc với bệnh nhân. Những người tiếp xúc với máu và các chế phẩm từ máu. Người đi du lịch tới hoặc đến từ nước hoặc vùng có tỉ lệ bệnh cao. Người cùng gia đình với người bị nhiễm bệnh. Người tàn tật được xã hội chăm sóc, những người sống trong các cơ sở xã hội, nhà dưỡng lão và các nhân viên làm việc ở đây. Bệnh nhân được truyền máu, bị ung thư, bệnh thận, xơ gan hoặc bệnh nhân được thẩm tách máu hoặc lọc huyết tương… Trẻ sơ sinh có mẹ bị nhiễm bệnh hoặc trẻ sơ sinh ở những nước hoặc vùng có nguy cơ cao. Bệnh nhân sắp được phẫu thuật và có đủ thời gian để chuyển đổi huyết thanh. Bệnh nhân được ghép tạng. Người bị chứng máu khó đông hoặc được truyền máu thường xuyên Bộ đội và nhân viên quân sự đang tại ngũ. Phạm nhân, giám thị trại giam và những người làm việc trong trại giam. Những người có nguy cơ cao với các hoạt động tình dục Người nghiện ma túy.\n','Không tiêm vắc xin cho những đối tượng đang bị sốt cao do nhiễm trùng nặng hoặc quá mẫn với một trong các thành phần có trong vắc xin.\n','Liều lượng:\nĐối với người lớn và trẻ em trên 10 tuổi dùng liều 20µg. Đối với trẻ em sơ sinh và dưới 10 tuổi dùng liều 10µg.\nLịch tiêm chủng:\nNên dùng 3 liều cứ mỗi tháng tiêm 1 lần (0 -1 -2) hoặc (0-1-6). Đối với người đang bị viêm gan siêu vi ngoài 3 lần tiêm trên, 12 tháng sau đó cần tiêm thêm 1 liều tăng cường (0-1-2+12).\n','heberbiovac-hb_ipnuz.jpg'),(32,'Euvax B','Nha san xuat A',200,4,'* Tổng quát: - Các phản ứng tại chỗ như quầng đỏ, đau, sưng hay hơi nóng hiếm khi xuất hiện; các triệu chứng này khỏi trong vòng 2 ngày. * Hiếm: - Sốt (trên 38.8°C). - Phản ứng toàn thân như khó chịu, suy nhược, đau đầu, nôn, buồn nôn, chóng mặt, đau cơ, đau khớp. - Ban đỏ ở da và tăng men transaminase thoáng qua. * Rất hiếm: - Các báo cáo không thể xác định được nguyên nhân gây nên di chứng và ảnh hưởng về viêm đa dây thần kinh, viêm thần kinh mắt, liệt mặt, làm bệnh xơ cứng rải rác nặng lên, và hội chứng Guilain-Barré.\n','Tạo miễn dịch chống lại sự nhiễm các tiểu nhóm (subtype) virus viêm gan siêu vi B được biết.\n','- Mẫn cảm với bất kỳ thành phần nào của Euvax B.\n','Euvax B chỉ dùng đường tiêm bắp.\nMột liều trẻ em (sơ sinh, trẻ nhỏ và trẻ dưới 16 tuổi) là 0,5 mL chứa 10 mcg HBsAg. Một liều người lớn (từ 16 tuổi trở lên): là 1,0 mL chứa 20 mcg HBsAg.\nLịch tiêm chủng gồm 3 liều vắc-xin được tiêm theo phác đồ sau:\nLiều thứ nhất: vào ngày lựa chọn để tiêm ngừa. Liều thứ hai: 1 tháng sau khi tiêm liều đầu tiên. Liều thứ ba: 6 tháng sau khi tiêm liều đầu tiên. Tiêm nhắc: Tổ Chức Y Tế Thế Giới (WHO) không khuyến cáo việc tiêm nhắc, vì người ta thấy rằng một đợt tiêm 3 liều viêm gan B bảo vệ được đến 15 năm, và đáp ứng bảo vệ từ bộ nhớ miễn dịch vẫn xảy ra sau khi phơi nhiễm virus viêm gan B, thậm chí nếu kháng thể bảo vệ đó mất theo thời gian. Tuy nhiên, có một số chương trình tiêm chủng tại một số nơi trên thế giới hiện vẫn khuyến cáo tiêm liều nhắc lại, và nên tuân theo điều này. Sự lựa chọn phác đồ 0,1 và 2 tháng và nhắc lại lúc 12 tháng có thể áp dụng cho vài nhóm đối tượng (ví dụ như trẻ sơ sinh có mẹ bị nhiễm virus Viêm Gan B, những người trước kia hay gần đây có nguy cơ phơi nhiễm với virus này, những người đi du lịch đến những vùng có nguy cơ nhiễm bệnh cao). Các liều vắc-xin bổ sung có thể được yêu cầu ở những người phải thẩm tách máu hay những người suy giảm miễn dịch, khi nồng độ kháng thể bảo vệ (> 10 IU/L) không đạt được sau đợt chủng ngừa cơ bản.\n','euvax-b_rxruj.jpg'),(33,'Inflexal V','Nha san xuat A',200,4,'Phản ứng tại chỗ: quần đỏ, sưng, đau, bầm máu, nốt cứng. Phản ứng toàn thân: sốt, khó chịu, run rẩy, mệt mỏi, đau đầu, đổ mồ hôi, đau khớp, đau cơ. Các phản ứng này thường tự khỏi sau 1-2 ngày, không cần phải điều trị. Hiếm khi gặp phản ứng dị ứng dẫn đến sốc. Viêm mạch máu, kèm theo ảnh hưởng đến thận, rất hiếm gặp.\n','Phòng bệnh cúm, đặc biệt ở những người có nguy cơ bị biến chứng kèm theo cao\n','Quá mẫn cảm với trứng, protein gà, polymyxin B, neomycine hay với một trong các thành phần của vắc xin. Trong trường hợp sốt hay bệnh cấp tính thì nên trì hoãn việc tiêm chủng. Giống như tất cả các vắc xin tiêm khác, phải chuẩn bị sẵn thuốc xử lý trường hợp quá mẫn sau khi tiêm vắc xin dù hiếm khi xảy ra. Không bao giờ được tiêm vắc xin Inflexal vào mạch máu. Không chắc vắc xin có ảnh hưởng đến khả năng lái xe và vận hành máy móc.\n','Người lớn và trẻ em trên 36 tháng: một liều 0.5ml. Trẻ em từ 6 tháng đến 35 tháng: một liều 0.25ml, hoặc 0.5ml. Đối với trẻ em mà chưa bị bệnh cúm hay chưa tiêm chủng, phải tiêm liều thứ 2, tiêm cách liều đầu ít nhất 4 tuần.\n','inflexal-v_azsao.jpg'),(34,'Adacel','Nha san xuat A',200,4,'Đau nơi tiêm. Mệt mỏi ở trẻ em. Nhức đầu ở thiếu niên và người lớn.\n','Gây miễn dịch chủ động nhắc lại nhằm phòng bệnh uốn ván, bạch hầu và ho gà ở người 4-64 tuổi.\n','Tiền sử quá mẫn toàn thân với bất kỳ thành phần nào của ADACEL. Từng bị phản ứng gây nguy kịch tính mạng sau khi tiêm vắc-xin này hoặc vắc-xin chứa thành phần tương tự. Bệnh lý não (hôn mê, giảm tri giác, co giật kéo dài) không do một nguyên nhân xác định nào khác xảy ra trong vòng 7 ngày sau khi tiêm một liều vắc-xin bất kỳ có thành phần ho gà.\n','Tiêm IM 1 liều duy nhất toàn bộ thể tích 0,5 mL, nên tiêm vùng cơ delta. Không nên chia nhỏ liều (liều nhỏ hơn  0.5mL). Tác dụng về mặt an toàn và hiệu quả khi tiêm các liều nhỏ hơn 0.5mL chưa được xác định.\n','adacel_aztsj.jpg'),(35,'Rotateq','Nha san xuat A',200,4,'Tiêu chảy, nôn, sốt...\n','RotaTeq là một vắc-xin ngũ giá dùng đường uống, chỉ định cho phòng ngừa viêm dạ dày-ruột do rotavirus ở trẻ nhỏ gây ra bởi các týp vi-rút G1, G2, G3, G4 và các týp vi-rút G có chứa P1A[8] (ví dụ như G9). RotaTeq có thể dùng từ khi trẻ được 7,5 tuần tuổi.\n','Mẫn cảm với thành phần vắc-xin. Nếu xuất hiện các triệu chứng giống mẫn cảm sau khi dùng 1 liều không nên dùng các liều tiếp theo. Suy giảm miễn dịch kết hợp trầm trọng.\n','Liều lượng:\nMỗi lịch trình đầy đủ bao gồm 3 liều pha sẵn dùng được ngay. Liều đầu tiên khi trẻ được 7.5-12 tuần tuổi, những liều tiếp theo cách nhau tối thiểu 4 tuần. Liều thứ ba cần hoàn thành trước khi trẻ được 32 tuần tuổi.\nCách dùng: \nDùng đường uống. Không trộn với dung dịch hay vắc-xin nào khác. Không pha loãng hay thêm nước.\n','rotateq_lctpn.jpg'),(36,'Abhayrab','Nha san xuat A',200,4,'Abhayrab là vắc xin dại tế bào vero tinh chế nên rất an toàn. Các tác dụng phụ nhẹ tại chỗ tiêm và toàn thân như: đau tại chỗ tiêm, ngứa, sốt, chóng mặt đau đầu… nói chung ít gặp. Hiếm hơn nữa là các phản ứng sốc phản vệ, mề đay.\n','Tạo miễn dịch chủ động chống lại virus dại để dự phòng và điều trị sau khi phơi nhiễm cho người ở tất cả các lứa tuổi. Để tạo miễn dịch chủ động chống lại virus dại sau khi phơi nhiễm (sau khi tiếp xúc với con vật bị dại hoặc nghi ngờ bị dại). Để tạo miễn dịch dự phòng của những nhóm đối tượng có nguy cơ cao như bác sỹ thú y, nhân viên y tế, nhân viên làm việc trong rừng hoặc sở thú, thợ săn, nhân viên phòng thí nghiệm có tiếp xúc với nguyên liệu có nghi ngờ mang virus dại, người có vật nuôi trong nhà.\n','Không tiêm bắp ở người có rối loạn chảy máu như hemophili hoặc giảm tiểu cầu.\nTrường hợp trước phơi nhiễm:\nSốt nhiễm trùng nặng, bệnh cấp tính, đợt tiến triển của bệnh mạn tính. Mẫn cảm với bất kỳ thành phần nào của vắc xin.\nTrường hợp sau phơi nhiễm:\nBệnh dại là bệnh rất nguy hiểm, do vậy không có chống chỉ định nào trong trường hợp điều trị sau phơi nhiễm.\nChú ý:\nPhụ nữ có thai: Hiện chưa có các bằng chứng liệu Abhayrab có gây ra quái thai hay không hoặc ảnh hưởng trên khả năng sinh sản. Vì vậy chỉ dùng trên phụ nữ có thai khi rõ ràng cần thiết. Phụ nữ cho con bú: bệnh dại là bệnh chết người vì vậy không có hạn chế nào trên phụ nữ cho con bú. Sử dụng ở trẻ em: bệnh dại là bệnh chết người, không có giới hạn tuổi tác và sử dụng cho trẻ em ở mọi lứa tuổi.\n','Một liều tiêm bắp (IM) là 0,5mL vaccine đã hoàn nguyên. Một liều tiêm trong da (ID) là 0,1mL vaccine đã hoàn nguyên, nghĩa là bằng 1/5 liều tiêm bắp.\nPhác đồ tiêm vaccine nên được áp dụng theo tình huống tiêm vaccine và tình trạng miễn dịch đối với bệnh dại của người tiêm.\n','abhayrab_uadwz.jpg'),(37,'Hepavax Gene','Nha san xuat A',200,4,'Các phản ứng cục bộ thông thường như đau, nổi ban đỏ và sưng tại tại vị trí tiêm cũng như các loại vắc-xin hấp thụ khác. Các phản ứng này nhẹ và thường biến mất sau khoảng 2 ngày sau khi tiêm. Một số phản ứng phụ khác ít gặp như sốt, nhức đầu, buồn nôn, chóng mặt và mệt mỏi cũng như ở một số loại vắc-xin khác nhưng mối liên hệ với vắc-xin vẫn chưa được xác định.\n','Phòng ngừa bệnh viêm gan B qua miễn dịch chủ động. Vắc – xin không có hiệu quả phòng ngừa các tác nhân gây viêm gan khác như: viêm gan siêu vi A, viêm gan siêu vi C hay những loại vi rút hướng gan khác…\nCác nhóm nguy cơ cao:\nNha sĩ, Bác sĩ điều dưỡng, người làm vệ sinh, các nhân viên y tế khác, nhân viên làm việc có liên quan đến huyết dịch, các đơn vị huyết học và ung thư, nhân viên phòng thí nghiệm, ngân hàng máu, phân đoạn plasma, hay các đơn vị vệ sinh và nhân viên cấp cứu.\nBệnh nhân: Bệnh nhân trong nhiều trường hợp nhận máu. Các cá nhân:\n           - Các cá nhân thường xuyên tiếp xúc với các nhóm nguy cơ cao.\n           - Cá nhân thường xuyên tiếp xúc hay quan hệ tình dục với những nhóm nguy cơ cao.\n','Các phản ứng cục bộ thông thường như đau, nổi ban đỏ và sưng tại vị trí tiêm cũng như tất cả các vắc-xin khác. Hepavax Gene không được tiêm cho các trường hợp sốt cao. Tuy nhiên, không chống chỉ định tiêm phòng trong những trường hợp lây nhiễm thông thường.\n','Không được tiêm vào tĩnh mạch hoặc trong da. Chỉ tiêm Hepavax-Gene vào trong cơ.\nỞ người lớn nên tiêm vào cơ delta nhưng đối với trẻ sơ sinh và trẻ em tiêm Hepavax-Gene vào mặt trước của cơ đùi do cơ delta của chúng còn nhỏ.\nTrường hợp ngoại lệ có thể tiêm dưới da đối với các bệnh nhân có vấn đề về máu nghiêm trọng như bệnh màu khó đông.\nNên lắc kỹ vắc-xin trước khi sử dụng. Phác đồ tiêm vắc-xin căn bả gồm 3 liều tiêm vào trong cơ:\nLiều thứ 1 : Tại ngày tiêm đã chọn Liều thứ 2 :1 tháng sau liều thứ nhất Liều thứ 3 : 2 – 6 tháng sau liều thứ nhất.\n','hepavax-gene_mwnit.jpg'),(38,'Jevax','Nha san xuat A',200,4,'Những phản ứng thương gặp là đau, sưng và ban đỏ tại chỗ tiêm. Những phản ứng này thường nhẹ và sẽ hết trong vòng 2 ngày sau tiêm. Những phản ứng toàn thân ít gặp như sốt, đau đầu, buồn nôn, chóng mặt và mệt mỏi cũng có thể xảy ra ở một vài người sau tiêm.\n','Là vaccine phòng chống bệnh viêm não Nhật Bản, là bệnh nhiễm virut cấp tính, gây tổn thương trực tiếp đến hệ thần kinh trung ương.\nSố khỏi bệnh thường để lại di chứng thần kinh. Thể nhẹ nhất là kém phát triển về tinh thần. Thể nặng nhất là liệt toàn thân. Bệnh xảy ra ở mọi đối tượng, mọi lứa tuổi, đặc biệt ở trẻ từ 1-15 tuổi. Vaccine viêm não Nhật Bản dùng để dự phòng bệnh viêm não Nhật Bản cho mọi đối tượng người lớn và trẻ em đủ 12 tháng tuổi trở lên.\nChỉ định tiêm phòng cho những người chưa tiêm vaccine viêm não Nhật Bản và có ý định đi công tác, du lịch đến nhưng vùng có dịch viêm não Nhật Bản.\n','Không tiêm vaccine cho những người quá nhạy cảm với bất cứ thành phần nào của vaccine. Mệt mỏi, sốt cao hoặc phản ứng toàn thân với bệnh nhiễm trùng đang tiến triển. Bệnh tim, bệnh thận và bệnh gan. Bệnh tiểu đường hoặc suy dinh dưỡng. Bệnh ung thư máu nói riêng và các bệnh ác tính nói chung. Bệnh quá mẫn cảm. Phụ nữ có thai.\n','Lịch tiêm cơ bản:\nMũi 1: mũi đầu tiên đến  tiêm. Mũi 2: sau mũi 1-2 tuần. Mũi 3: sau mũi thứ nhất 1 năm Tiêm nhắc lại: 3 năm tiêm nhắc lại 1 liều để duy trì khả năng miễn dịch. Những người có trang thấy miễn dịch tốt thì tiêm nhắc lại trước lúc có dịch viêm não Nhật Bản xảy ra.\nLiều tiêm:\nDưới 36 tháng tuổi:  tiêm 0,5ml/liều. Trên 36 tháng tuổi: tiêm 1ml/liều\nĐường tiêm: tiêm dưới da\n','jevax_wveef.jpg'),(39,'RS.JEV','Nha san xuat A',200,4,'Một số đối tượng có xảy ra sốt, nhưng thường không quá 2 ngày và tự hết. Đôi khi có thể có xuất hiện ban da rải rác và thường không cần phải điều trị hoặc chỉ cần điều trị triệu chứng.\n','Tạo miễn dịch phòng bệnh viêm não Nhật Bản.\n','Sốt, mắc bệnh truyền nhiễm cấp tính, viêm tai giữa, nhiễm lao thể hoạt động, các bệnh tim, gan hoặc thận Thể chất yếu, đối tượng có tiền sử dị ứng hoặc động kinh Các đối tượng suy giảm miễn dịch bẩm sinh và những người sử dụng các liệu pháp ức chế miễn dịch trong khoảng thời gian gần đó. Phụ nữ có thai hoặc đang cho con bú  Đối tượng dị ứng hoặc tiền sử nghi ngờ quá mẫn với bất kỳ thành phần nào của vắc xin, kể cả gelatin\n','Liều đơn vắc xin gồm 0,5 ml vắc xin sau hoàn nguyên. Tiêm vắc xin dưới da, ở vùng cơ delta của cánh tay. Cần sát trùng vị trí tiêm bằng cồn hoặc iod rồi để khô trước khi tiêm. Không tiêm vắc xin vào tĩnh mạch. Theo dõi tình trạng sức khỏe của các đối tượng trong và sau khi tiêm vắc xin, nếu có bất kỳ phản ứng nào xảy ra (sốt, co giật, v.v...) cần thông báo ngay cho bác sĩ.\nCũng như các vắc xin khác, cần chuẩn bị sẵn epinephrine để xử trí khi có trường hợp sốc phản vệ xảy ra.\nVắc xin đông khô phải được hoàn nguyên ngay trước khi tiêm. Không tiêm vắc xin khi chưa hoàn nguyên hoàn toàn.\nLiều cơ bản: 01 mũi duy nhất lúc 9 tháng tuổi.\nCó thể sử dụng mũi bổ sung (booster dose) sau khi tiêm mũi cơ bản 01 năm.\n','24a_vdcxb.jpg'),(40,'Meningococcal BC (VA-MENGOC-BC)','Nha san xuat A',200,4,'Không có phản ứng phụ nghiêm trọng nào được báo cáo ở phần lớn những người được tiêm trong các đánh giá thực địa lâm sàng lớn và các nghiêm cứu sau khi cấp phép ở Cuba và nhiều nước khác.\nCác dấu hiệu và triệu chứng tại chỗ được biết như đau, nổi ban đỏ và cứng vùng tiêm thường nhẹ và có cường độ tần suất xuất hiện khác nhau, xuất hiện trong vòng 24 giờ đầu sau tiêm và có xu hướng biến mất sau 72 giờ sau khi tiêm.\nCác phản ứng tại chỗ với mức độ mạnh hơn có thể xuất hiện trong một vài trường hợp đơn lẻ. Những phản ứng và các dấu hiệu này cũng tương tự phản ứng đối với các vắc xin hấp thụ khác.\nTrong các triệu chứng toàn thân thường thấy có báo cáo về thân nhiệt 38 độ C hoặc cao hơn; và ít khi kéo dài quá hai ngày.\nTuy nhiên ít khi thấy có báo cáo về trường hợp sốt 39 độ C hoặc cao hơn, triệu chứng này xảy ra nhanh. Có thể có cảm giác khó chịu, đau đầu, buồn ngủ.\nCác dấu hiệu và triệu chứng toàn thân cũng như tại chỗ thường giảm sau liều thứ hai.\nHơn 40 triệu liều vắcxin meningococcal BC đã được sử dụng đều cho thấy tính an toàn. Vắcxin không gây ra bệnh hoặc những triệu chứng và dấu hiệu chính của bệnh.\n','Vắcxin Meningococcal BC được chỉ định nhằm tạo miễn dịch chủ động phòng bệnh viêm màng não do não mô cầu nhóm huyết thanh thanh B và C. Vắcxin được tiêm cho trẻ từ tháng tuổi thứ ba và các đối tượng sống trong vùng dịch hay phải di đến vùng dịch.\n','Không được tiêm cho người quá mẫn cảm với bất cứ thành phần nào của vắcxin. Chống chỉ định trong các trường hợp sốt, nhiễm khuẩn cấp tính và dị ứng đang tiến triển và các bệnh mãn tính không tự điều chỉnh. Hiếm khi có phản ứng nghiêm trọng nào xảy ra khi tiêm mũi đầu tiên, nhưng nếu có thì chống chỉ định tiêm mũi thứ hai.\n','Liều lượng & lịch trình tiêm:\nLịch tiêm cơ bản gồm hai liều 0,5ml, khoảng cách giữa các lần tiêm là sáu đến tám tuần. Liều tiêm thứ hai là bắt buộc để đạt được mức bảo vệ. Lịch tiêm đuợc áp dụng với trẻ từ 6 tháng tuổi trở lên và người lớn đến 45 tuổi.\nTheo kinh nghiệm sử dụng vắcxin, không cần thiết phải tiêm nhắc lại. Khi tiến hành các chiến dịch tiêm nhắc lại, việc tiêm nhắc lại không loại trừ những người không có bằng chứng cho thấy đã tiêm theo lịch hai mũi trước đó.\n','meningococcal-bc_qhrli.jpg'),(41,'Cervarix','Nha san xuat A',200,4,NULL,NULL,NULL,NULL,NULL),(42,'Quimi-Hib','Nha san xuat A',200,4,'Quimi-Hib rất an toàn, dung nạp tốt và rất ít khi gây dị ứng.\nỞ trẻ sơ sinh, các phản ứng tại chỗ như: đỏ, đau tại chỗ, cứng và phản ứng toàn thân như: sốt nhẹ, khích thích, đỏ da, buồn nôn có thể xây ra mặc dù rất hiếm. Ở trẻ lớn hơn, tác dụng phụ có thể xẩy ra là đau, đỏ, ngứa cứng tại chỗ tiêm, sốt nhẹ, đau đầu nhẹ, mệt mỏi, buồn nôn và nôn.\nTât cả tác dụng phụ thường rất nhẹ và không tôn tại quá 72 giờ. Nếu tác dụng phụ xảy ra cần báo cho bác sỹ biết.\n','Phòng bệnh chỉ định cho nhiễm khuẩn Hemophilus influenzae nhóm (viêm phổi viêm màng não mủ) cho trẻ em từ 2 tháng đến 15 tuổi.\n','Không tiêm vắc xin cho mọi đối tượng dị ứng với các thành thần của vắc xin. Không tiêm vắc xin cho các đối tượng đang bị sốt.\n','Liệu trình tiêm chủng cho trẻ em dưới 1 tuổi là 3 mũi tiêm Quimi-Hib  với khoảng cách 4 – 8 tuần (+) 7 ngày cho các mũi tiêm, mũi đầu tiên bắt đầu sau tuần thứ 6. Trẻ em trên 15 tháng tuổi  nếu chưa được tiêm chủng trước đó chỉ cần tiêm 1 mũi.\nTiêm Quimi-Hib vào mặt ngoài bắp đùi cho trẻ em nhỏ hơn 2 tuổi và vào cơ delta cho trẻ em trên 2 tuổi. Mỗi liều vắc xin có dung tích tương đương 0,5ml.\n','quimi-hib_ahymu.jpg'),(43,'Synflorix','Nha san xuat A',200,4,'Những phản ứng thương gặp là đau, sưng và ban đỏ tại chỗ tiêm. Những phản ứng toàn thân ít gặp như sốt, đau đầu, buồn nôn, chóng mặt và mệt mỏi cũng có thể xảy ra ở một vài người sau tiêm.\n','Ngừa các bệnh gây bởi Streptococcus pneumoniae tuýp huyết thanh 1, 4, 5, 6B, 7F, 9V, 14, 18C, 19F và 23F (như h/c nhiễm trùng, viêm màng não, viêm phổi, NK huyết và viêm tai giữa cấp) và ngừa viêm tai giữa cấp gây bởi Haemophilus influenzae không định tuýp.\n','Không được tiêm cho người quá mẫn với bất cứ thành phần nào của vắcxin.\n','Liều lượng:\nLiệu trình 3 liều cơ bản: 6 tuần tuổi-6 tháng tuổi: Để đảm bảo khả năng bảo vệ tối ưu hoặc ở trẻ sinh non sau ít nhất tuần 27 thai kỳ: 4 liều, 0.5 mL/liều.\n– Liều đầu tiên lúc 2 tháng tuổi (có thể lúc 6 tuần tuổi) và khoảng cách các mũi tiêm ít nhất 1 tháng.\n– Liều nhắc lại: ít nhất 6 tháng sau mũi tiêm cơ bản cuối cùng.\nLiệu trình 2 liều cơ bản (sử dụng trong chương trình tiêm chủng thường xuyên): 2 liều, 0.5 ml/liều.\n– Liều đầu tiên lúc 2 tháng tuổi (có thể lúc 6 tuần tuổi) và liều thứ hai sau đó 2 tháng.\n– Liều nhắc lại: ít nhất 6 tháng sau mũi tiêm cơ bản cuối cùng.\nTrẻ lớn chưa từng được tiêm phòng vắc-xin trước đó:\n– Trẻ từ 7-11 tháng tuổi: 2 liều, 0.5 mL/liều với khoảng cách các mũi tiêm ít nhất 1 tháng, liều thứ ba vào năm tuổi thứ hai với khoảng cách ít nhất 2 tháng.\n– Trẻ từ 12-23 tháng tuổi: 2 liều, 0.5 mL/liều với khoảng cách các mũi tiêm ít nhất 2 tháng. Chưa cần thiết tiêm nhắc lại sau liệu trình này.\n– Trẻ từ 24 tháng-5 tuổi: 2 liều, 0.5 mL/liều với khoảng cách các mũi tiêm ít nhất 2 tháng.\nCách dùng: Tiêm bắp, mặt trước bên của đùi (trẻ nhỏ) và cơ delta cánh tay (trẻ lớn).\n','synflorix_lonsg.jpg'),(44,'Varicella','Nha san xuat A',200,4,'Trong một lọ vắcxin (0,7 ml sau khi hoàn nguyên) có chứa :\nVirut thủy đậu (Varicella) sống giảm độc lực ............ ≥ 1.400PFU\nSucrose ...................................................................... 25 mg\nAxit Aminoacetic ......................................................... 2.5 mg\nSodium L-glutamate .................................................. 0,55 mg\nGelatin ..................................................................... 12,5 mg\nCystein .................................................................... 0,25 mg\nAxit Ethylene diaminetetraacetic ................................. 0,25 mg\nSodium phosphate, dibasic ................................................. vđ\nSodium phosphate, monobasic ........................................... vđ\nLọ nước hồi chỉnh kèm theo:\nNước cất pha tiêm (dùng để pha vacxin) .....................0,7 ml\n','Ở bệnh nhân có nguy cơ cao, 14 đến 30 ngày sau khi tiêm vacxin có thể xuất hiện các nốt phát ban dạng nốt sần hoặc phỏng nước kèm theo sốt nhẹ. Gần 20% bệnh nhân bệnh bạch cầu lymphô cấp tính có các phản ứng phụ này. Các biểu hiện của bệnh do Herpes zoster gây ra cũng có thể xảy ra ở các bệnh nhân có nguy cơ cao, tuy nhiên tần xuất mắc và mức độ nghiêm trọng không cao hơn so với những bệnh nhân bị nhiễm bệnh mắc một cách tự nhiên.\nCác phản ứng phụ thường gặp là: các biểu hiện tại chỗ tiêm (như đau, sưng tấy đỏ, nổi ban, ngứa, tụ máu, nổi cục cứng), sốt cao trên 102 độ F (39 độ C), phát ban dạng thủy đậu (toàn thân hoặc tại chỗ tiêm).\n','Vacxin được sử dụng để phòng bệnh thủy đậu cho các đối tượng từ 12 tháng tuổi trở lên. Vacxin nên được tiêm cho các đối tượng chưa mắc bệnh thủy đậu.\n','Vacxin không sử dụng cho các đối tượng sau :\nĐang sốt hoặc suy dinh dưỡng. Bệnh tim mạch, rối loạn chức năng gan thận. Có tiền sử quá mẫn với Kanamycin và Erythromycin. Có tiền sử co giật trong vòng một năm trước khi tiêm vac xin. Suy giảm miễn dịch tế bào. Có thai hoặc hai tháng trước khi định có thai. Đã tiêm phòng các vacxin sống khác (vắcxin bại liệt uống, vacxin sởi, vacxin rubella, vacxin quai bị và vacxin BCG) trong 1 tháng gần đây. Có tiền sử quá mẫn với bất cứ thành phần nào của vacxin. Suy giảm hệ thống miễn dịch tiên phát hoặc mắc phải như suy giảm hệ miễn dịch trong bệnh AIDS hoặc các biểu hiện lâm sàng của nhiễm virut gây suy giảm miễn dịch ở người. Trẻ em dưới 12 tháng tuổi. Bệnh nhân mắc bệnh bạch cầu tủy cấp, bệnh bạch cầu tế bào lymphô T hoặc u lympho ác tính. Bệnh nhân bị ức chế mạnh hệ thống miễn dịch do xạ trị hoặc giai đoạn tấn công trong điều trị các bệnh bạch cầu.\n','varicella_mphyj.jpg'),(45,'Vắc xin Tả','Nha san xuat A',200,4,NULL,NULL,NULL,NULL,NULL),(46,'Varilrix','Nha san xuat A',200,4,'Đối tượng khoẻ mạnh Varilrix được chỉ định để tạo miễn dịch chủ động chống thủy đậu ở những người khoẻ mạnh từ 9 tháng trở lên. Nên tiêm phòng cho những người khỏe mạnh tiếp xúc gần gũi với những người có nguy cơ nhiễm varicella nặng để làm giảm nguy cơ lan truyền virus thể hoang dại cho những đối tượng này. Những người tiếp xúc gần bao gồm bố mẹ, anh chị em của bệnh nhân có nguy cơ cao và nhân viên y tế. Bệnh nhân có nguy cơ cao nhiễm varicella nặng Bệnh nhân đang mắc bệnh bạch cầu cấp tính, điều trị ức chế miễn dịch (kể cả điều trị bằng corticosteroid) cho khối u ác tính, cho bệnh mạn tính nặng (như suy thận mạn, bệnh tự miễn, bệnh tạo keo, hen phế quản nặng) hoặc sau khi ghép tạng; dễ nhiễm nặng varicella trong tự nhiên. Đã thấy các biến chứng của varicella giảm khi tiêm phòng bằng chủng Oka cho những bệnh nhân này.\nSố liệu từ các thử nghiệm lâm sàng khi dùng Varilrix cho những bệnh nhân có nguy cơ cao nhiễm nặng varicella còn hạn chế; nếu cần tiêm chủng, nên lưu ý những điểm sau:\nNên ngưng hoá trị liệu trước và sau tiêm chủng một tuần ở những bệnh nhân trong giai đoạn cấp của bệnh bạch cầu. Bệnh nhân đang xạ trị bình thường cũng không nên tiêm chủng trong giai đoạn trị liệu. Nói chung, bệnh nhân được gây miễn dịch khi họ hoàn toàn thuyên giảm về mặt huyết học. Tổng lượng tế bào lympho nên ít nhất là 1.200/mm3 hoặc không có bằng chứng nào khác về sự thiếu hụt khả năng miễn dịch tế bào. Nên tiêm vaccine vài tuần trước khi điều trị ức chế miễn dịch ở những bệnh nhân ghép tạng (như ghép thận).\n','Cũng như các vaccine khác, nên trì hoãn việc tiêm chủng ở những người đang sốt cao cấp tính. Tuy nhiên không chống chỉ định tiêm vaccine cho những người khoẻ mạnh mắc nhiễm khuẩn nhẹ. Chống chỉ định tiêm Varilrix cho những người có số lượng tế bào lympho ít hơn 1.200/mm3 hoặc có bằng chứng nào khác về sự thiếu hụt khả năng miễn dịch tế bào. Chống chỉ định tiêm Varilrix cho những người đã biết quá mẫn toàn thân với neomycin nhưng không chống chỉ định cho những người có tiền sử viêm da tiếp xúc với neomycin. Chống chỉ định tiêm Varilrix trong thai kỳ. Hơn thế, nên tránh có thai sau khi tiêm vaccine 3 tháng.\n','Liều lượng:\nMỗi liều tiêm chủng là 0,5ml vaccine hoàn nguyên.\nTrẻ từ 9 tháng đến 12 tuổi, kể cả tuổi thứ 12: 1 liều. Có thể tiêm thêm 1 liều vaccine Varilrix hay một vaccine chứa thủy đậu khác sau khi tiêm liều thứ nhất cho trẻ từ 9 tháng đến 12 tuổi. Tốt nhất nên tiêm liều thứ 2 sau liều thứ nhất ít nhất là 6 tuần nhưng bất luận tình huống nào không được tiêm trước 4 tuần. Trẻ từ 13 tuổi trở lên: 2 liều. Tốt nhất nên tiêm liều thứ 2 sau liều thứ nhất ít nhất là 6 tuần nhưng không được tiêm trước 4 tuần. Đối với bệnh nhân có nguy cơ cao: áp dụng lịch tiêm chủng tương tự như lịch tiêm chủng cho người khoẻ mạnh. Có thể yêu cầu đánh giá định kỳ lượng kháng thể varicella sau khi tiêm phòng ở những bệnh nhân này để nhận biết những người cần tiêm liều nhắc lại.\nCách dùng:\nChỉ nên tiêm Varilrix dưới da.\n','Vaccine đông khô nên được bảo quản trong tủ lạnh ở nhiệt độ từ +2°C đến +8°C và tránh ánh sáng. Dung môi có thể được bảo quản trong tủ lạnh hoặc ở nhiệt độ môi trường ngoài. Vaccine đông khô không bị ảnh hưởng bởi sự đông lạnh. Khi Varilrix được phân phối đi từ trung tâm bảo quản lạnh, cần chuẩn bị cho việc chuyên chở dưới điều kiện tủ lạnh.\n','varilrix_mglts.jpg'),(47,'Priorix','Nha san xuat A',200,4,'Trong các thử nghiệm lâm sàng có kiểm soát, các dấu hiệu và triệu chứng đã được chủ động kiểm soát trên hơn 5.400 đối tượng tiêm chủng tròng vòng 42 ngày sau khi tiêm. Các đối tượng được tiêm chủng cũng được yêu cầu báo cáo mọi biểu hiện lâm sàng xảy ra trong thời gian thử nghiệm. Những tác dụng ngoại ý sau đây, theo thứ tự tần suất xảy ra, đã được các đối tượng tiêm chủng báo cáo :\nĐỏ tại chỗ : 7,2% Ngoại ban : 7,1% Sốt trên 39°5C : 6,4% Đau tại chỗ : 3,1% Sưng tại chỗ : 2,6% Sưng tuyến mang tai : 0,7% Sốt co giật : 0,1%\nTrong suốt quá trình chủ động giám sát các dấu hiệu và triệu chứng, tổng cộng có dưới 6% số đối tượng được tiêm vacxin có một trong các triệu chứng (mà ở mức tối thiểu được xem là có khả năng liên quan đến việc tiêm chủng) sau đây:\nHồi hộp lo âu (0,90%), Viêm họng (0,68%), Nhiễm trùng đường hô hấp trên (0,57%), Viêm mũi (0,56%), tiêu chảy (0,54%), Viêm phế quản (0,52%), Nôn mửa (0,43%), ho (0,39%), Nhiễm virus (0,31%) Viêm tai giữa (0,30%).\nTrong những thử nghiệm so sánh, tỷ lệ đau, đỏ và sưng tại chỗ sau khi tiêm Priorix được báo cáo ở mức thấp hơn đáng kể về mặt thống kê khi so với vacxin so sánh. Tỷ lệ những phản ứng ngoại ý khác liệt kê ở trên là tương đương đối với cả hai nhóm vacxin.\n','Priorix được chỉ định để gây miễn dịch chủ động chống sởi, quai bị và rubella.\n','Chống chỉ định dùng Priorix cho những người có tiền sử quá mẫn toàn thân với neomycin hoặc với bất kỳ thành phần nào của vaccine. Không chống chỉ định khi có tiền sử viêm da tiếp xúc với neomycin. Với những người bị dị ứng với trứng gà. Không nên dùng Priorix cho những người suy giảm đáp ứng miễn dịch, bao gồm những bệnh nhân suy giảm miễn dịch tiên phát hoặc thứ phát. Tuy nhiên, có thể dùng vaccine kết hợp sởi, quai bị và rubella cho những người nhiễm HIV không triệu chứng mà không gây những ảnh hưởng bất lợi đến tình trạng bệnh của họ và có thể cân nhắc sử dụng cho những người nhiễm HIV có triệu chứng. Priorix chống chỉ định dùng cho phụ nữ mang thai. Hơn nữa nên tránh có thai trong 3 tháng sau khi tiêm vaccine.\n','Liều lượng:\nLiều đề nghị là một liều đơn 0,5 ml vacxin hoàn nguyên. Vì phác đồ tiêm chủng thay đổi tùy theo từng nước, phác đồ sử dụng ở mỗi nước phải phù hợp với khuyến cáo quốc gia của nước đó.\nCách dùng:\nPriorix được dùng để tiêm dưới da. Priorix cũng có thể được tiêm bắp. Theo thực hành lâm sàng tốt, vacxin được tiêm dưới da ở những bệnh nhân mắc chứng giảm tiểu cầu hoặc bị rối loạn chảy máu.\n','friorix_ufgne.jpg'),(48,'Rotarix','Nha san xuat A',200,4,'Cho 1 liều vaccine 1 ml sau khi hoàn nguyên:\nRotavirus chủng RIX4414 của người, sống giảm độc lực: không ít hơn 106.0 CCID5 Tá dược: Sucrose, Dextran,Sorbitol, các acid amino và Dubelcco\'s Modified Eagle Medium (DMEM). Dung môi: Calcium carbonate, Xanthan, nước pha tiêm thêm vào vừa đủ.\n','Rotarix được chỉ định để phòng ngừa viêm dạ dày - ruột do Rotavirus tuýp huyết thanh G1 và không phải G1 gây nên (như G2,G3, G4, G9).\n','Không dùng Rotarix cho trẻ đã biết quá mẫn với vaccine Rotarix sau khi uống liều đầu tiên hoặc với bất kỳ thành phần nào của vaccine. Không được dùng Rotarix cho những bệnh nhân có dị tật bẩm sinh đường tiêu hóa dễ dẫn đến lồng ruột (như túi thừa Meckel\'s).\n','Liều lượng:\nPhác đồ phòng ngừa gồm 2 liều. Nên dùng liều đầu tiên từ 6 tuần tuổi. Khoảng cách giữa mỗi liều ít nhất là 4 tuần. Nên hoàn thành việc uống phòng trong vòng 24 tuần tuổi. Trong các thử nghiệm lâm sàng,hiện tượng nhổ hoặc trớ khi uống vaccine hiếm gặp, trong trường hợp này không cần uống liều thay thế. Tuy nhiên, nếu trẻ nhổ hoặc trớ ra phần lớn lượng vaccine đã uống vào thì nên uống ngay liều vaccine thay thế. Cần phải nhấn mạnh rằng trẻ đi uống phòng ngừa liều đầu tiên bằng Rotarix thì uống liều thứ 2 cũng bằng Rotarix.\nCách dùng:\nRotarix chỉ dùng đường uống, không được tiêm Rotarix Không hạn chế thức ăn hoặc nước uống của trẻ, kể cả sữa mẹ trước hoặc sau khi uống vaccine.\n','rotarix_tvtsd.jpg'),(49,'Trimovax','Nha san xuat A',200,4,'Có thể có phản ứng nhẹ từ ngày thứ 5: sốt (có thể tránh bằng thuốc hạ nhiệt), triệu chứng mũi hay hô hấp ngắn hạn, ngứa khớp, đỏ. Rất ít khi bị sốt làm kinh. Rất hiếm khi thấy nổi hạch, hay viêm mang tai. Rất ít trường hợp ghi nhận bị bệnh thần kinh như viêm màng não hay viêm màng não thể não, điếc một bên. Viêm màng não xuất hiện trong vòng 30 ngày, không có di chứng, thỉnh thoảng có phát hiện virus bệnh quai bị trong dịch não tủy. Sự xuất hiện bệnh viêm màng não vô trùng rất hiếm gặp. Sự hồi phục thường hoàn toàn. Rất ít trường hợp bị viêm tinh hoàn.\n','Ngừa cùng một lúc 3 bệnh: Sởi, quai bị, rubella. Dành cho bé cả bé trai và bé gái từ 12 tháng tuổi. Đối với trẻ sống tập thể, có thể dùng từ 9 tháng tuổi.\n','Suy giảm miễn dịch bẩm sinh hay mắc phải (kể cả nhiễm HIV). Trường hợp đặc biệt trẻ con có mẹ HIV dương tính : kháng thể của người mẹ đi qua nhau thai, nên không thể chẩn đoán được đứa bé có bị nhiễm HIV hay không. Phải chờ xác định bằng phương pháp Western Blot đến khi nào có phản ứng âm tính mới có thể cho rằng đứa bé không bị nhiễm.\n                      + Nếu âm tính: Có thể chích ngừa theo lịch trình.\n                      + Nếu dương tính: Phải hỏi ý kiến của chuyên khoa nhi.\nDị ứng với protein của trứng. Mới tiêm ngừa immunoglobuline trong thời gian gần. Phụ nữ mang thai: Tuy nhiên, nếu đã chích ngừa trong thời gian có thai chưa biết trước, không có nghĩa là phải phá thai.\n','Tiêm 1 lần từ 12 tháng tuổi. Tuy nhiên đối với trẻ đã tiêm ngừa trước 12 tháng tuổi, nên tiêm lần thứ hai vào 6 tháng sau. Tiêm nhắc lại 1 lần lúc 4 - 12 tuổi.\n','trimovax_yapbl.jpg'),(50,'Tetavax','Nha san xuat A',200,4,'Có thể có những phản ứng nổi mẫn đỏ và/hoặc sưng ở chỗ tiêm.\n','Phòng ngừa bệnh uốn ván.\n','Các bệnh truyền nhiễm cấp tính. Các bệnh đang tiến triển (cấp tính hoặc kinh niên).\n','Tiêm dưới da hoặc tiêm bắp. Lắc trước khi sử dụng. Tiêm chủng đợt đầu: 2-3 lần tiêm, mỗi lần cách nhau ít nhất một tháng và không quá 6 tháng, theo những qui định hiện hành. Tiêm nhắc lại: tiêm nhắc lại 1 năm sau lần tiêm cuối cùng của đợt tiêm đầu tiên. Sau đó mỗi 10 năm tiêm lại 1 lần. Nếu dùng vaccine dạng ống tiêm, phải hủy ống tiêm sau khi dùng. Trường hợp chủng ngừa đại trà có thể bơm vaccine bằng ống bơm không có kim loại imojet.\n','tetavax_hafiw.jpg'),(51,'MMR (M-M-R II)','Nha san xuat A',200,4,'M-M-R II là chế phẩm vô khuẩn đông khô phối hợp của:\nAttenuvax (vắc-xin sống phòng vi-rút sởi), một dòng vi-rút sởi đã được giảm độc mạnh hơn từ chủng Edmonston đã giảm độc của Enders và để mọc trong môi trường nuôi cấy tế bào phôi thai gà. Mumpsvax(vắc-xin sống phòng vi-rút quai bị), chủng vi-rút quai bị Jeryl Lynn™ (mức độ B) cho mọc trong môi trường nuôi cấy tế bào phôi thai gà. Meruvax II (vắc-xin sống phòng vi-rút rubella), chủng vi-rút rubella sống đã giảm độc Wistar RA 27/3 cho mọc trong môi trường nuôi cấy tế bào lưỡng bội người (WI-38).\nMỗi liều vắc-xin chứa 14,5 mg sorbitol; natri phosphat; 1,9 mg sucrose; natrichloride; 14,5 mg gelatin thủy phân; 0,3mg albumin người; < 1ppm huyết thanh phôi thai bò, những chất đệm và tá dược khác và khoảng 25 microgam neomycin.\nSản phẩm không chứa chất bảo quản.\n','Tác dụng phụ khi dùng M-M-R II cũng là những gì đã được báo cáo khi dùng từng vắc-xin đơn giá hoặc đa giá.\nThường gặp:\nRát bỏng và/hoặc đau nhói tại nơi tiêm trong một thời gian ngắn.\nÍt gặp:\nToàn thân: sốt (từ 38,3°C [101°F] trở lên). Da: ban, thường là nhẹ, nhưng có thể lan tỏa. Nói chung, sốt, ban, hoặccả hai xảy ra giữa các ngày 5-12.\nHiếm gặp:\nToàn thân: Phản ứng nhẹ tại chỗ, như ban đỏ, chai hoặc căng cứng, đau họng, khó chịu, sởi không điển hình, ngất, dễ bị kích thích. Tiêu hóa: Viêm tuyến mang tai, buồn nôn, nôn, tiêu chảy. Máu/bạch huyết: Bệnh hạch bạch huyết từng vùng, giảm tiểu cầu, ban xuất huyết.\nQuá mẫn cảm:\nCác phản ứng dị ứng như mề đay và ban đỏ tại nơi tiêm, phản ứng phản vệ và dạng phản vệ, cũng như các hiện tượng có liên quan như phù mạch thần kinh (kể cả phù mặt và phù ngoại biên) và co thắt phế quản ,mề đay trên cả những người có hoặc không có tiền sử dị ứng. Cơ xương: Đau khớp và/hoặc viêm khớp (thường thoáng qua và hiếm khi mạn tính), đau cơ...\n','M-M-R II được dùng để tạo miễn dịch phòng cho cả sởi, quai bị và rubella ở trẻ từ 12 tháng tuổi trở lên.\n','Quá mẫn cảm với bất kỳ thành phần nào của vắc-xin, kể cả gelatin. Không tiêm chủng M-M-R II cho người mang thai, vì cho đến nay chưa biết rõ những tác động có thể gây ra cho sự phát triển của phôi thai. Phải tránh mang thai trong 3 tháng sau khi tiêm nếu tiêm chủng cho phụ nữ sau dậy thì. Phản ứng phản vệ hoặc dạng phản vệ với neomycin (mỗi liều vắc-xin sau khi hoàn nguyên có chứa khoảng 25 microgam neomycin). Mọi bệnh lý đường hô hấp có sốt hoặc bất kỳ tình trạng sốt nhiễm khuẩn đang tiến triển khác. Bệnh lao đang tiến triển mà chưa được điều trị. Người bệnh dùng thuốc ức chế miễn dịch. Chống chỉ định này không áp dụng cho những người bệnh dùng corticoid làm liệu pháp thay thế như trong bệnh Addison. Người có rối loạn về máu, bệnh bạch cầu, u hạch bạch huyết ở mọi thể, hoặc những khối u tân sinh ác tính khác có ảnh hưởng tới tuỷ xương hoặc tới hệ bạch huyết. Trạng thái suy giảm miễn dịch tiên phát hoặc mắc phải kể cả người bệnh suy giảm miễn dịch do bệnh AIDS hoặc các biểu hiện lâm sàng khác của nhiễm vi-rút gây suy giảm miễn dịch ở người; suy giảm miễn dịch tế bào và các trạng thái giảm gamma-globulin máu và tình trạng vô gamma-globulin máu. Đã có báo cáo bị bệnh sởi thể não (MIBE-Measles inclusion body encephalitis), viêm phổi và tử vong vì nhiễm khuẩn lan tỏa vi-rút vắc-xin sởi do sơ ý tiêm chủng vắc-xin có thành phần sởi cho người bị tổn thương nặng ở hệ miễn dịch. Người có tiền sử gia đình suy giảm miễn dịch bẩm sinh hoặc di truyền, cho đến khi chứng minh được họ đã có khả năng đáp ứng miễn dịch với vắc-xin.\n','mmr-ii_zicsu.jpg'),(52,'Gardasil','Nha san xuat A',200,4,'Mỗi liều 0,5 mL vắc-xin chứa:\n225 mcg nhôm (dưới dạng hydroxyphosphate sulfate nhôm vô định hình); 9,56 mg natrichloride; 0,78 mg L-histidine, 50 mg polysorbate 80; 35 mcg natri borate và nước để tiêm. Sản phẩm này không chứa chất bảo quản hay kháng sinh.\n','Trong 5 thử nghiệm lâm sàng (4 thử nghiệm có đối chứng với giả dược), các đối tượng dùng GARDASIL hoặc giả dược vào ngàybắt đầu thử nghiệm và sau đó là khoảng 2 và 6 tháng tiếp theo. GARDASIL chothấy có các biểu hiện tính an toàn thuận lợi khi so sánh với giả dược (có hoặc không chứa nhôm). Một số ít người (0,2%) đã phải ngừng thuốc do tác dụng có hại. Trong mọi thử nghiệm lâm sàng (trừ 1 thử nghiệm), tính an toàn được đánh giá qua phiếu báo cáo tiêm chủng để đánh giá trong vòng 14 ngày sau mỗi lần tiêm GARDASIL hoặc giả dược. Có 6160 người (5088 phụ nữ 9-26 tuổi và 1072 nam 9-16 tuổi lúc bắt đầu tham gia thử nghiệm) dùng GARDASIL và 4064 người dùng giả dược được theo dõi và sử dụng phiếu báo cáo tiêm chủng.\nNhững tác dụng có hại liên quan tới vắc-xin sau đây gặp ở những người dùng GARDASIL với tần số ít nhất là 1,0% và cũng có tần số cao hơn so với khi quan sát nhóm giả dược.\nRất hay gặp (≥1/10); Hay gặp (≥1/100,<1/10); Ít gặp (≥1/1000, <1/100); Hiếm gặp (≥1/10000, <1/1000); Rấthiếm (<1/10000).\nRối loạn chung và phản ứng tại chỗ tiêm: Rất hay gặp: sốt\nNhững phản ứng sau đây tại chỗ tiêm ở nhóm dùng GARDASIL có tần số cao hơn so với ở nhóm dùng nước muối sinh lý làm giả dược: Rất hay gặp: ban đỏ, đau, sưng. Hay gặp: xuất huyết và ngứa.\nNhững phản ứng sau đây tại chỗ tiêm là rất hay gặp và có tần số cao hơn ở nhóm dùng GARDASIL so với ở nhóm dùng giả dượccó chứa nhôm: ban đỏ, đau, sưng.\nPhần lớn các phản ứng tại nơi tiêm là ở mức độ nhẹ tới trung bình.\nNgoài ra, rất hiếm gặp phản ứng có hại nghiêm trọng là co thắt phế quản.\nTính an toàn của GARDASIL khi dùng cùng với vắc-xin viêm gan B (tái tổ hợp) đã được đánh giá qua một nghiên cứu có đối chứng giả dược. Tần số các phản ứng có hại quan sát được khi dùng chung như vậy cũng tương đương với tần số của GARDASIL khi dùng riêng rẽ.\n','GARDASIL là vắc-xin dùng phòng ngừa ung thư, tiền ung thư hoặc các tổn thương loạn sản, mụn cóc sinh dục và bị nhiễm gây nên bởi các týp vi rút Papilloma ở người (HPV) mục tiêu của vắc-xin này.\nGARDASIL được dùng để ngăn ngừa các bệnh gây nên bởi HPV týp 16 và 18 sau đây:\nUng thư cổ tử cung, âm hộ và âm đạo Ung thư biểu mô tuyến cổ tử cung tại chỗ(AIS) Tân sinh nội biểu mô cổ tử cung (CIN) độ 2và độ 3 Tân sinh nội biểu mô âm hộ (VIN) độ 2 và độ3 Tân sinh nội biểu mô âm đạo (VaIN) độ 2 vàđộ 3\nGARDASIL còn dùng ngăn ngừa các bệnh gây nên bởi HPV týp 6, 11, 16 và 18 sau đây:\nTân sinh nội biểu mô cổ tử cung (CIN) độ 1 Mụn cóc sinh dục (sùi mào gà condyloma) Tân sinh nội biểu mô âm hộ (VIN) độ 1 vàtân sinh nội biểu mô âm đạo (VaIN) độ 1 Nhiễm vi rút Papilloma ở người (HPV)\n','Quá mẫn cảm với hoạt chất và với mọi thành phần của vắc-xin. Không được sử dụng các liều GARDASIL tiếp theo nếu gặp các triệu chứng quá mẫn cảm sau khi tiêm bất kỳ mũi GARDASIL nào.\n','gardasil_iytjn.jpg'),(53,'Infanrix hexa','Nha san xuat A',200,4,'Hầu hết các tác dụng không mong muốn của Infanrix hexa là ở dạng nhẹ và sẽ hết trong vòng một vài ngày. Phản ứng phụ xảy ra nhiều nhất ở xung quanh chỗ tiêm và hay xảy ra khi tiêm mũi tăng cường.\nHãy thông báo cho bác sỹ nếu trẻ xảy ra những việc sau đây:\nvị trí tiêm bị sưng, đau, đỏ, bầm tím hoặc ngứa; sốt 38-39,5 độ C; khóc bất thường (hơn 1 giờ), nôn, tiêu chảy, chảy nước mũi hoặc chán ăn; buồn ngủ hoặc khó ngủ, căng thẳng, dễ bị kích thích; phát ban hoặc xuất hiện các đốm tím hoặc nâu đỏ dưới da.\nHãy thông báo NGAY cho bác sỹ nếu trẻ xảy ra những việc sau đây:\nsốt cao hơn 39,5ºC; khóc kéo dài hơn 3 tiếng đồng hồ; có trạng thái vô thức, bất tỉnh; co giật.\nHãy đưa trẻ đến bệnh viện ngay lập tức nếu trẻ xảy ra những việc sau đây:\nsưng tay, chân, mặt, mắt, bên trong mũi, miệng hoặc cổ họng; thở hoặc nuốt khó khăn; có những phản ứng da nghiêm trọng như mề đay, ngứa (đặc biệt là ở bàn tay và bàn chân), đỏ nhiều nơi trên người (đặc biệt là xung quanh tai); có biểu hiện yếu bất thường.\n','Infanrix hexa được chỉ định cho tiêm chủng cơ bản và tiêm nhắc lại cho trẻ em phòng chống bệnh bạch hầu, ho gà, uốn ván, viêm gan B, bại liệt, và Haemophilus Influenzae type b.\n','Chống chỉ định đối với những trường hợp mẫn cảm với các hoạt chất hay bất cứ tá dược hoặc chất tồn dư nào trong thuốc. Quá mẫn sau mũi tiêm vaccine bạch hầu, uốnván, ho gà, viêm gan B, bại liệt hoặc Hib trước đó. Infanrix hexa chống chỉ định đối với những trẻ trong tiền sử đã có bệnh về não không rõ nguyên nhân trong vòng 7 ngày sau khi tiêm vaccine chứa thành phần ho gà.\n','Liều lượng:\nMột liều tiêm của INFANRIX hexa là 0,5 ml. INFANRIX hexa cần phải tiêm 2 liều hoặc 3 liều. Đối với trẻ thì thời gian tiêm là:\nTrong trường hợp tiêm 2 liều, liều thứ nhất vào 3 tháng tuổi, liều thứ 2 vào 5 tháng tuổi. Trong trường hợp tiêm 3 liều, liều thứ nhất vào 2 tháng tuổi, liều thứ 2 vào 4 tháng tuổi, liều thứ 3 vào 6 tháng tuổi (hoặc tháng 3, 4, 5).\nTiêm 2 liều giúp cơ thể sản sinh số lượng kháng thể bằng khoảng 99% so với tiêm 3 liều, có nghĩa là cho khả năng phòng bệnh gần như bằng nhau.\nKhoảng thời gian giữa 2 mũi tiêm phải ít nhất là 1 tháng (trong trường hợp bạn muốn tiêm thêm mũi tăng cường, thời gian giữa mũi tăng cường và mũi cuối phải ít nhất là 6 tháng).\nNếu bị lỡ lịch tiêm thì cần phải đưa trẻ đi tiêm mũi tiếp theo càng sớm càng tốt. Không được tiêm INFANRIX hexa cho trẻ sơ sinh.\nCách truyền: INFANRIX hexa được truyền bằng cách tiêm sâu vào bắp đùi cho trẻ dưới 12 tháng tuổi hoặc bắp cánh tay (cơ delta) của trẻ trên 12 tháng tuổi và người lớn. INFANRIX hexa không bao giờ được phép tiêm vào ven hoặc trong da.\n','infanrix-hexa_buiei.jpg'),(54,'EPAXAL','Nha san xuat A',200,4,'Phản ứng phụ nếu có thường nhẹ và trong thời gian ngắn (2-3 ngày), bao gồm:\nPhản ứng tại chỗ tiêm: đau, sưng, đỏ, nổi mẫn. Đường tiêu hóa: tiêu chảy, buồn nôn, biếng ăn, hiếm khi nôn. Các rối loạn nói chung như khó chịu, hiếm khi có sốt. Thần kinh: nhức đầu, chóng mặt.\n','Tạo miễn dịch chủ động phòng bệnh viêm gan siêu vi A cho người lớn và trẻ em trên 1 tuổi, đặc biệt cho người bị phơi nhiễm cao, bao gồm:\nNhững người đang sống trong vùng nguy cơ thấp hoặc vừa, nhưng: sắp đi du lịch vào vùng có dịch; đi khai hoang; Có công việc liên quan đến quân đội; thường xuyên tiếp xúc với người nhiễm vi-rút viêm gan A hoặc bệnh nhân viêm gan A: nhân viên y tế, nhân viên làm việc trong phòng khám, bệnh viện; Là thành viên gia đình tiếp xúc bệnh nhân viêm gan siêu vi A; thường xuyên thay đổi bạn tình; suy giảm miễn dịch, nghiện; Làm công tác xã hội, làm việc trong trại tị nạn; Nhân viên chế biến và phân phối thực phẩm; nhân viên làm việc dưới mặt đất, công nhân cầu cống. Người sống trong vùng có nguy cơ mắc bệnh viêm gan siêu vi A cao.\n','Quá mẫn với bất kỳ thành phần nào của vắc-xin.\n','Tạo miễn dịch cơ bản: tiêm liều đơn 0.5ml vắc-xin vào cơ delta (tiêm bắp). Vắc-xin có tác dụng sau khi tiêm 14 ngày.\nTạo miễn dịch chủ động và thụ động đồng thời: trong trường hợp cần được bảo vệ ngay lập tức, có thể dùng đồng thời EPAXAL® và globulin miễn dịch viêm gan A nhưng phải khác chỗ tiêm. Cách chủng ngừa này sẽ tạo miễn dịch thụ động ngay lập tức kết hợp với miễn dịch chủ động.\nLiều tăng cường: tác dụng bảo vệ của vắc-xin ít nhất 1 năm, do vậy, nếu có chỉ định tiêm liều tăng cường thì phải chờ hơn 1 năm sau khi tiêm liều đầu. Liều tăng cường làm tăng nồng độ kháng thể rất cao, có thể bảo vệ cơ thể được khoảng 20 năm.\nHướng dẫn sử dụng:\nLắc nhẹ bơm tiêm trước khi dùng. Ấn xoay nhanh kim tiêm trên ống tiêm.\n','epaxal_dyxei.jpg'),(55,'Havax','Nha san xuat A',200,4,'Sưng và ban đỏ tại chỗ giống như tiêm bất kỳ loại vắcxin có chất hấp thụ nào khác. Những phản ứng này thường là nhẹ và sẽ hết trong vòng 2 ngày sau khi tiêm.\n','Havax được sử dụng cho những người có nguy cơ phơi nhiễm với virút viêm gan A:\nNhững người chưa tiêm vắcxin Viêm gan A và có dự định đi du lịch đến những vùng dịch (những vùng thường có virút viêm gan A). Các đối tượng nghề nghiệp có phơi nhiễm: hộ lý, y tá, cán bộ viên chức làm công tác chăm sóc phục vụ trẻ tàn tật, nhân viên xử lý nước, nước thải và thực phẩm công nghiệp. Những người đặc biệt có nguy cơ lây nhiễm (bệnh nhân ưa chảy máu, truyền dịch nhiều lần, tiêm tĩnh mạch, đồng tính).\nHavax không bảo vệ chống lại được các bệnh gan do các tác nhân gây bệnh và các virút viêm gan khác gây ra.\n','Không tiêm vắcxin này cho các đối tượng đang bị mắc các bệnh về gan.\nChú ý:\nHavax có thể tiêm cùng với các loại vắcxin khác (uốn ván, bạch hầu, bại liệt, BCG) mà không làm ảnh hưởng đến đáp ứng miễn dịch của các loại vắcxin này.\n','Liều lượng:\nTrẻ em (2 – 17 tuổi) 0.5 ml Người lớn (trên 18 tuổi) 1.0 ml\nĐường tiêm:\nKhông được tiêm vào đường tĩnh mạch hoặc trong da, Havax phải được tiêm bắp để có được đáp ứng miễn dịch cao nhất. Ở người lớn thì tiêm vắcxin vào vùng cơ Delta song ở trẻ em nên tiêm vào vùng đùi ngoài thì tốt hơn vì cơ Delta còn nhỏ. Ngoại lệ có thể tiêm vắcxin vào vùng dưới da cho những bệnh nhân ưa chảy máu. Lắc kỹ lọ vắcxin trước khi tiêm.\n','havax_miisl.jpg'),(56,'Hiberix','Nha san xuat A',200,4,'Trong các thử nghiệm lâm sàng có kiểm soát, các dấu hiệu và triệu chứng đã được chủ động theo dõi và ghi nhận vào phiếu theo dõi hàng ngày sau khi tiêm vaccin.\nTrong các triệu chứng tại chỗ, triệu chứng thường gặp nhất được ghi nhận trong 48 giờ đầu là hồng ban nhẹ tại chỗ tiêm, hồng ban này sẽ tự mất hẳn. Các triệu chứng tại chỗ khác được ghi nhận gồm có sưng và đau nhẹ nơi tiêm.\nCác triệu chứng toàn thân được ghi nhận trong 48 giờ đầu sau khi tiêm, thường nhẹ và tự hết, gồm có sốt, ăn kém ngon, bồn chồn, nôn mửa, tiêu chảy và khóc bất thường. Cũng như các vaccin ngừa Haemophilus influenzae týp b, các triệu chứng toàn thân này đều giống như các triệu chứng xảy ra khi dùng cùng lúc với các vaccin khác.\nCác phản ứng dị ứng hiếm gặp, bao gồm cả sốc phản vệ, cũng đã được ghi nhận.\n','Hiberix được chỉ định cho mọi trẻ em từ 6 tuần tuổi trở lên để tạo miễn dịch chủ động đối với bệnh do Hib gây ra. Hiberix không tạo sự bảo vệ chống lại bệnh do các týp Haemophilus influenzae khác gây nên, cũng như không chống lại được bệnh viêmmàng não gây bởi các vi khuẩn khác.\n','Không được dùng Hiberix cho các đối tượng được biết là quá mẫn cảm với một trong các thành phần của vaccin, hoặc các đối tượng trước đây có dấu hiệu quá mẫn cảm khi tiêm vaccin Hib.\nNhư các vaccin khác, phải hoãn tiêm Hiberix cho đối tượng đang bị bệnh sốt cao cấp tính. Tuy nhiên, nhiễm trùng nhẹ không phải là chống chỉ định tiêm vaccin.\n','Lịch chủng ngừa:\nLịch chủng ngừa cơ bản gồm 3 liều tiêm trong 6 tháng đầu đời và có thể bắt đầu từ 6 tuần tuổi. Để bảo đảm hiệu quả bảo vệ lâu dài, một liều tiêm nhắc lại được đề nghị vào năm 2 tuổi. Trẻ từ 6 đến 12 tháng tuổi chưa được chủng ngừa nên tiêm 2 liều cách nhau một tháng, sau đó tiêm nhắc lại vào năm 2 tuổi. Trẻ từ 1 đến 5 tuổi chưa được chủng ngừa nên tiêm 1 liều.\nVì phác đồ chủng ngừa thay đổi theo từng nước, lịch chủng ngừa của mỗi nước có thể được sử dụng sao cho phù hợp với những khuyến cáo quốc gia khác nhau.\nCách dùng:\nVaccin đã hoàn nguyên được chỉ định để tiêm bắp. Tuy nhiên, theo thực hành lâm sàng tốt, nên tiêm vaccin này dưới da ở bệnh nhân giảm tiểu cầu hoặc có rối loạn chảy máu. Không được tiêm Hiberix qua đường tĩnh mạch trong bất cứ hoàn cảnh nào.\n','hiberix_dssmn.jpg'),(57,'Avaxim 80U','Nha san xuat A',200,4,'Các phản ứng thường gặp nhất là:\n- Các phản ứng tại chỗ tiêm như đau, đỏ, sưng hoặc nốt cứng.\n- Các phản ứng toàn thân như nhức đầu, rối loạn tiêu hóa(đau bụng, tiêu chảy, buồn nôn, ói mửa), đau cơ hay đau khớp, rối loạn hành vi thoáng qua (chán ăn, mất ngủ, dễ kích động), sốt, suy nhược.\nCác triệu chứng ngoài da (phát ban, mề đay) hiếm được báo cáo hơn.\nTất cả các tác dụng không mong muốn đều ở mức vừa phải và hạn chế trong những ngày đầu sau khi tiêm vaccine, rồi tự khỏi.\n','Phòng nhiễm virus viêm gan A ở trẻ từ 12 tháng đến 15 tuổi.\n','Trẻ bị dị ứng với hoạt chất, với bất cứ thành phần tá dược nào, với neomycin, với polysorbat hoặc nếu trước đây đã từng bị mẫn cảm sau khi tiêm vaccine này. Trẻ đang mắc một bệnh gây sốt, bệnh cấp tính, bệnh mạn tính trong giai đoạn tiến triển (tốt nhất nên hoãn tiêm vaccine).\n','Liều lượng: 0,5 ml mỗi lần tiêm.\nLịch tiêm chủng gồm 1 liều tiêm chủng cơ bản. 6-18 tháng sau nên tiêm một liều nhắc lại.\nCách tiêm: Tiêm bắp vào cơ ở phía trên cánh tay\n','avaxim-80u_ywjls.jpg'),(58,'Avaxim 160U','Nha san xuat A',200,4,'Cho 1 bơm tiêm chứa sẵn 0,5 ml   Virus viêm gan A bị bất hoạt hóa bằng formaldehyde* 160 đơn vị kháng nguyên** Hydroxide nhôm (số lượng tính theo nhôm) 0,3 mg 2-phenoxyethanol 2,5 mcg Formaldehyde 12,5 mcg Môi trường Hanks 199*** đến 0,5 ml Chlorhydric acid hay sodium hydroxide để điều chỉnh pH  \n* Chủng GMP cấy trên tế bào lưỡng bội người MRC5. ** Vì không có tài liệu về tiêu chuẩn quốc tế để tham khảo,hàm lượng kháng nguyên được tính theo tham số nội bộ. *** Môi trường Hanks 199 là một hỗn hợp phức tạp gồm axit amin, muối khoáng, vitamin, và các chất khác, pha loãng trong nước để tiêm và với pH được điều chỉnh bằng chlorhydric acid hay sodium hydroxide.\n','Cũng giống như các hoạt chất khác, vaccine này, có thể gây một số ảnh hưởng gây ít nhiều khó chịu ở một số bệnh nhân:\nĐau tại nơi tiêm, thỉnh thoảng kèm với quầng đỏ. Hiếm gặp nốt cứng tại nơi tiêm. Sốt vừa, mệt mỏi, đau đầu, đau cơ hay đau khớp, và rối loạn dạ dày - ruột là các phản ứng không mong đợi thường ghi nhận được.\n','Avaxim 160U được khuyến cáo nên dùng để phòng ngừa các trường hợp nhiễm virus viêm gan A ở người từ 16 tuổi trở lên và người lớn.\n- Tiêm ngừa viêm gan siêu vi A được khuyến cáo ở các đối tượng có nguy cơ nhiễm virus viêm gan A như:\nNhững người chưa tiêm ngừa đi du lịch ở vùng dịch tễ (vùng có nhiều virus viêm gan A). Những người làm các công việc có nguy cơ lây nhiễm cao: nhân viên nhà trẻ, người làm trong các cơ sở hay nhà nuôi trẻ khuyết tật, người xử lý nước thải, người làm công việc cung cấp thức ăn. Người có nguy cơ đặc biệt: bệnh ưa chảy máu, truyền máu nhiều lần, người nghiện tiêm chích đường tĩnh mạch, người có quan hệ tình dục đồng giới.\n- Vaccine này không bảo vệ phòng ngừa nhiễm các týp virus viêm gan khác hay các tác nhân gây bệnh gan đã được biết khác.\n','Đang sốt, bệnh cấp tính, bệnh mạn tính tiến triển (nênhoãn việc tiêm ngừa lại). Nhạy cảm với một trong các thành phần của vaccine hay sau lần tiêm trước đây.\n','avaxim-160u_twwzn.jpg'),(59,'Act - hib','Nha san xuat A',200,4,'Dự phòng cho trẻ từ 2 tháng tuổi trở lên chống lại các nhiễm trùng xâm lấn do Haemophilus influenzae type b (viêm màng não, nhiễm trùng huyết, viêm mô tế bào, viêm khớp, viêm nắp thanh quản...).\n','Mẫn cảm với một trong các thành phần của thuốc.\n','Đường tiêm bắp hoặc tiêm dưới da sâu.\nTrẻ em < 2 tuổi, tiêm ở vùng đùi phía trước bên ngoài. Trẻ em > 2 tuổi, tiêm vùng cơ delta. Trẻ < 6 tháng tuổi: 3 mũi tiêm cách nhau 1 hoặc 2 tháng. Tiêm nhắc lại 1 mũi 12 tháng sau mũi thứ 3. Trẻ từ 6 đến 12 tháng: 2 mũi tiêm cách nhau 1 hoặc 2 tháng. Tiêm nhắc lại 1 mũi 12 tháng sau mũi thứ 2. Trẻ em từ 1 đến 5 tuổi: 1 mũi tiêm duy nhất.\n','Bảo quản từ 2-8°C (trong tủ lạnh). Không để đông băng.\n','act-hib_mgquz.jpg'),(60,'Gene-HBVax','Nha san xuat A',200,4,'Vắc xin Viên gan B không gây ra những phản ứng phụ đáng kể song cũng có thể gây đau nhẹ tại chỗ tiêm nhưng sẽ hết vài ngày sau khi tiêm.\n','phòng bệnh viêm gan B cho tất cả các đối tượng có nguy cơ bị nhiễm, cụ thể:\n• Nhóm người khỏe mạnh có nguy cơ cao.\n- Nhân viên y tế (bác sỹ, nha sỹ, phẫu thuật, y tá, hộ lý...)\n- Nhân viên bệnh viện thường xuyên phải tiếp xúc với máu.\n- Nhân viên phòng thí nghiệm.\n- Gia đình tiếp xúc với người mang virút viêm gan B, đặc biệt là những cháu bé sinh ra từ những người mẹ mang HBsAg và HBeAg.\n• Nhóm bệnh nhân:\n- Bệnh nhân thường xuyên phải truyền máu có thể bị nhiễm virút viêm gan B.\n- Bệnh nhân suy giảm miễn dịch.\n- Bệnh nhân viêm thận mãn tính hoặc phải điều trị ở các đơn vị thấm tích máu.\n• Các nhóm khác:\n- Nhân viên hành chính, bộ đội, tù nhân, giúp việc trong các gia đình...\n- Những người đồng tính luyến ái hoặc tiêm chích ma túy.\n- Dân cư và những người du lịch vào những vùng có tỷ lệ mắc cao như Địa Trung Hải, Trung Âu, Nam Mỹ, châu Phi và các nước châu Á.\n','Không có chống chỉ định, vắc xin có thể tiêm phòng cho tất cả các đối tượng mà không gây hại gì, bao gồm các phụ nữ có thai (khuyến cáo không nên tiêm trong 3 tháng đầu), trẻ sơ sinh, bệnh nhân nhiễm virút viêm gan B hoặc người mang HBsAg, những người có anti–HBc dương tính hoặc anti – HBs dương tính và những người bị suy giảm miễn dịch. Nên hoãn tiêm khi trẻ đang mắc các căn bệnh nhiễm trùng cấp tính hoặc bệnh đang tiến triển.\n','1 ml - 20 µg cho người lớn 0,5 ml - 10 µg cho trẻ em (< 10 tuổi)\n','rhbvax_kjrgi.jpg'),(61,'Twinrix','Nha san xuat A',200,4,'Twinrix là vaccine kết hợp được tạo thành từ bán thành phẩm của virus viêm gan A (HA) bất hoạt, tinh khiết và kháng nguyên bề mặt viêm ganB (HBsAg) tinh khiết, được hấp thụ riêng biệt lên hydroxide nhôm và phosphatenhôm. Virus HA được nhân lên trong các tế bào lưỡng bội MRC5 của người. HBsAg được điều chế bằng nuôi cấy trên trung gian chọn lọc của các tế bào nấm men biến đổi gen.\nLiều 1,0ml Twinrix chứa không dưới 720 đơn vị ELISA của virus HA bất hoạt và 20 mcg protein HBsAg tái tổ hợp.\n','Twinrix được chỉ định sử dụng cho người lớn chưa có miễn dịch và trẻ em từ 1 tuổi trở lên, những người có nguy cơ nhiễm cả viêm gan A và viêm gan B.\n','Không nên sử dụng Twinrix cho những người đã biết quá mẫn cảm với bất kỳ thành phần nào của vaccine hoặc những người có biểu hiện quá mẫn cảm sau mũi tiêm Twinrix trước đó hoặc với vaccine viêm gan A và viêm gan B riêng biệt.\n','Liều lượng:\nMột liều Twinrix 1,0ml được đề nghị dùng cho người lớn và trẻ em từ 1 tuổi trở lên.\nCách tiêm:\nTwinrix nên được tiêm bắp vào vùng cơ phía trên cánh tay ở người lớn và trẻ lớn. Có thể tiêm vào mặt trước-bên đùi ở trẻ nhỏ. Nên tránh tiêm trong da hoặc tiêm vào cơ mông do có thể gây đáp ứng không hoàn toàn. Ngoài ra, có thể tiêm Twinrix dưới da cho những người thiếu tiểu cầu hoặc rối loạn máu chảy do có thể xuất hiện chảy máu sau khi tiêm bắp. Tuy nhiên, có thể đáp ứng miễn dịch không hoàn toàn khi tiêm theo đường này.\n','twinrix_vzfmv.jpg'),(62,'Engerix-B','Nha san xuat A',200,4,'Engerix-B nói chung được dung nạp tốt.\nCác tác dụng không mong muốn dưới đây, thường nhẹ và thoáng qua, đã được báo cáo sau khi thực hiện việc chủng ngừa vaccin rộng rãi. Cũng như các vaccine viêm gan B khác, trong nhiều trường hợp, mối liên hệ giữa việc tiêm vaccin với các tác dụng ngoại ý không được thiết lập.\nThường gặp:\n- Tại nơi tiêm: đau thoáng qua, hồng ban, chai cứng da.\nHiếm gặp:\n- Toàn thân: mệt mỏi, sốt, khó chịu, triệu chứng như cảm cúm.\n- Hệ thần kinh trung ương và ngoại biên: chóng mặt, nhức đầu, dị cảm.\n- Hệ tiêu hóa: buồn nôn, nôn, tiêu chảy, đau bụng.\n- Hệ gan mật: kết quả các thử nghiệm chức năng gan thay đổi.\n- Hệ cơ xương: đau khớp, đau cơ.\n- Da và các phần phụ của da: phát ban, ngứa, mề đay.\nRất hiếm gặp:\n- Toàn thân: phản ứng phản vệ, bệnh huyết thanh.\n- Tim mạch: ngất, hạ huyết áp.\n- Hệ thần kinh trung ương và ngoại biên: liệt, bệnh thần kinh, viêm thần kinh (bao gồm hội chứng Guillain-Barré, viêm thần kinh nhãn cầu và xơ hóa đa dây thần kinh), viêm não, bệnh não, viêm màng não.\n- Hệ cơ xương: viêm khớp.\n- Hệ hô hấp: các triệu chứng kiểu co thắt phế quản.\n- Da và các phần phụ của da: phù mạch, hồng ban đa dạng.\n- Hệ mạch ngoài tim: viêm mạch.\n- Hệ bạch cầu và lưới nội mô: bệnh hạch bạch huyết.\n','Engerix – B được chỉ định để tạo miễn dịch chủ động chống lây nhiễm các phân tuýp đã được biết đến của HBV ở các đối tượng được xem là có nguy cơ cao tiếp xúc với HBV ở mọi lứa tuổi. Viêm gan D cũng có thể được ngăn ngừa qua việc tiêm chủng với Engerix – B vì viêm gan D (gây ra bởi tác nhân delta) không xảy ra nếu không nhiễm viêm gan B.\nVề lâu dài, việc tiêm chủng viêm gan B không những làm giảm tỷ lệ mắc bệnh mà còn làm giảm các biến chứng mãn tính như viêm gan B mãn tính thể hoạt động và viêm gan B đi kèm xơ gan.\nỞ những vùng có tỷ lệ mắc viêm gan B thấp, việc tiêm chủng được đề nghị đặc biệt cho những đối tượng thuộc nhóm có nguy cơ lây nhiễm cao, tuy nhiên việc tiêm chủng cho tất cả trẻ em và thanh niên sẽ góp phần kiểm soát bệnh viêm gan B trong cộng đồng.\nỞ những vùng có tỷ lệ mắc viêm gan B trung bình và cao , với phần đông dân số có nguy cơ nhiễm HBV, chiến lược tốt nhất, nên tiêm chủng rộng rãi cho tất cả các trẻ em, thanh thiếu niên cũng như người lớn thuộc nhóm nguy cơ lây nhiễm cao.\nTổ chức Y tế Thế giới, Hội đồng Tư vấn Thực hành Tiêm chủng Hoa kỳ khuyến cáo việc tiêm chủng rộng rãi sẽ giúp các quốc gia kiểm soát được bệnh viêm gan B.\n','Không nên dùng Engerix đối với các đối tượng quá mẫn với bất kỳ thành phần nào của vaccin hoặc những đối tượng có biểu hiện quá mẫn với Engerix ở những lần tiêm trước.\nChỉ sử dụng Engerix – B trong thai kỳ khi thật sự cần thiết và lợi ích thu được vượt trội hơn nguy cơ có thể xảy ra cho thai nhi.\nSố liệu về việc sử dụng vaccin trên người trong thời kỳ mang thai và khả năng sinh sản ở động vật là chưa đầy đủ tuy nhiên như tất cả các vaccin chứa virut bất hoạt khác, không thấy tác hại trên thai nhi.\nKhông chống chỉ định cho phụ nữ cho con bú và bênh nhân HIV\n','Vaccin liều 20mcg (trong 1,0ml huyền dich) được dùng cho đối tượng từ 20 tuổi trở lên. Vaccin liều 10mcg (trong 0,5ml huyền dịch) được dùng cho sơ sinh, nhũ nhi và trẻ em đến 19 tuổi. Tuy nhiên cũng có thể sử dụng vaccin 20mcg cho trẻ từ 11 tuổi đến 15 tuổi (bao gồm cả tuổi 15) với lịch tiêm chủng là 2 mũi nếu trẻ ở vùng nguy cơ lây nhiễm viên gan B cao và có thể tuân thủ đầy đủ lịch tiêm chủng.\n','engerix-b_rottm.jpg'),(63,'Tetraxim','Nha san xuat A',200,4,'Như tất cả các dược phẩm khác, Tetraxim có một số tác dụng ngoại ý:\nCác phản ứng tại chỗ như đau, quầng đỏ, nốt cứng có thể gặp ở chỗ tiêm trong vòng 48 giờ sau khi tiêm. Các phản ứng toàn thân: sốt đôi khi trên 40°C, dễ kích động, buồn ngủ, rối loạn giấc ngủ và ăn uống, tiêu chảy, ói mửa, khóc nhè khó dỗ và kéo dài. Hiếm hơn, có thể thấy nổi mề đay, phát ban ngoài da, co giật kèm sốt hoặc không kèm sốt trong vòng 48 giờ sau khi tiêm. Tình trạng giảm trương lực cơ hoặc các đợt giảm trương lực cơ-giảm phản ứng đã được báo cáo. Sau khi tiêm Tetraxim với vắc-xin chứa thành phần Haemophilus influenzae týp b, phản ứng sưng phù chi dưới cũng đã được báo cáo. Những phản ứng này đôi khi đi kèm với sốt, đau và quấy khóc.\n','Tetraxim được chỉ định để giúp bảo vệ trẻ em phòng bệnh bạch hầu, uốn ván, ho gà và bại liệt ở trẻ em từ 2 tháng tuổi trở lên khi tiêm chủng cơ bản hay khi tiêm liều nhắc lại trong năm tuổi thứ hai và ở trẻ từ 5 đến 11 tuổi hay 11 đến 13 tuổi tùy theo khuyến cáo chính thức của quốc gia.\n','Không được dùng Tetraxim:\nNếu trẻ có bệnh não tiến triển kèm co giật hoặc không co giật (bệnh thần kinh), Nếu trước đây trẻ đã có phản ứng mạnh trong vòng 48 giờ sau khi tiêm vắc-xin: sốt cao từ 40°C trở lên, hội chứng khóc nhè dai dẳng, co giật khi sốt hoặc không kèm sốt; hội chứng giảm trương lực cơ - giảm phản ứng, Nếu trước đây trẻ có phản ứng dị ứng xảy ra sau khi sử dụng vắc-xin phòng bệnh bạch hầu, uốn ván, ho gà và bại liệt, Nếu trẻ dị ứng với các hoạt chất, bất cứ thành phần tá dược nào của vắc-xin, neomycin, streptomycin và polymixin B.\n','Lịch tiêm chủng thường được khuyến nghị bao gồm tiêm chủng cơ bản với 3 mũi tiêm, cách nhau từ một đến hai tháng, kể từ khi trẻ được hai tháng tuổi, sau đó tiêm nhắc lại một mũi trong năm thứ hai, và tiêm nhắc muộn lúc 5 - 11 tuổi hay 11 - 13 tuổi tùy theo khuyến cáo chính thức của quốc gia.\nCách dùng:\nLắc trước khi tiêm, cho đến khi đạt được một hỗn dịch màu trắng đục, đồng nhất. Đối với trình bày dạng lọ đa liều: rút ra 0,5ml vắc-xin bằng một bơm tiêm 1ml hay 0,5ml. Mỗi khi rút một liều mới, dùng một bơm kim tiêm vô trùng để rút 0,5ml vắc-xin. Dùng đường tiêm bắp Tốt nhất, nên tiêm vắc-xin ở mặt trước đùi (ở một phần ba giữa) ở trẻ nhỏ và vùng cơ Delta ở trẻ lớn từ 5 - 11 tuổi hay 11 - 13 tuổi.\nNếu bỏ sót một liều Tetraxim: Bác sĩ sẽ quyết định khi nào tiêm liều bị sót này.\n','tetraxim_kexwo.jpg'),(64,'Okavax','Nha san xuat A',200,4,'Cho 1 liều:\n  Thành phần Hàm lượng Virus Thủy đậu Varicella Zoster sống giảm độc lực (chủng Oka) Tối thiểu 1 000 PFU Chất pha loãng:   NaCl 1.14 mg KCl 0.03 mg KH2PO4 0.29 mg NaH2PO4.12H2O 3.14 mg Chất ổn định:   Sucrose tinh khiết 25.0 mg L-Glutamate Natri 0.36 mg Kháng sinh:   Kanamicin sulfate 7 mcg (hiệu lực) hoặc ít hơn Erythromycin lactobionate 2 mcg (hiệu lực) hoặc ít hơn\n','Phản ứng tại chỗ:\nCác phản ứng tại nơi tiêm như quầng đỏ, sưng, và nốt cứng hiếm khi gặp.\nPhản ứng toàn thân:\n1-3 tuần sau khi tiêm vaccine, sốt và phát ban đôi khi xuấthiện ở trẻ em và người lớn khỏe mạnh. Các triệu chứng này thoáng qua và thường biến mất sau vài ngày. Hiếm gặp, sốc phản vệ (ví dụ như nổi mề đay, khó thở, phù môi hay phù thanh quản). Các phản ứng quá mẫn có thể gặp, nhưng hiếm, xuất hiện tức thì hay một ngày sau khi tiêm vaccine, với các biểu hiện như phát ban, ngứa, và sốt. Xuất huyết do giảm tiểu cầu vô căn hiếm gặp (1/106). Ban xuất huyết, chảy máu cam, chảy máu niêm mạc miệng thường xuất hiện trong thời gian 3 tuần sau khi tiêm vaccine. Những người thuộc nhóm nguy cơ cao khi tiêm vaccine có thể bị phát ban dạng nổi sần và/hoặc bóng nước kèm theo sốt khoảng 14-30 ngày sau khi tiêm chủng. Phản ứng lâm sàng này thường chỉ xuất hiện trong khoảng 20% bệnh nhân bị bệnh bạch cầu dòng lympho cấp tính. Tiêm chủng cho những bệnh nhân có nguy cao, sau khi tiêm họ có thể bệnh Herpes Zoster, nhưng tỷ lệ bệnh thì bằng hoặc thấp hơn tỷ lệ bệnh của những người không tiêm chủng bị nhiễm bệnh thủy đậu tự nhiên.\n','Không được tiêm chủng cho những bệnh nhân sau đây:\nNhững người đang sốt. Những người đang bệnh cấp tính. Những người từng bị phản ứng quá mẫn gây ra bởi các thành phần của vaccine Thủy đậu. Những người đang mang thai. Những người không nên tiêm vaccine bởi các lý do khác ngoài các lý do nêu trên.\n','Vaccine thủy đậu được hòa tan với 0,7ml dung môi kèm theo (nước cất pha tiêm), và thông thường một liều (0,5ml) được tiêm dưới da.\n','okavax_ihleu.jpg'),(65,'Verorab','Nha san xuat A',200,4,NULL,NULL,NULL,NULL,NULL),(66,'BCG','Nha san xuat A',200,4,'Vắc xin BCG (BCG: Bacillus Calmette - Guerin) là chế phẩm dạng đông khô của chủng Calmette - Guerin giảm hoạt lực, có nguồn gốc từ vi khuẩn Mycobacterium bovis. Hiện có nhiều loại vắc xin BCG lưu hành trên thế giới; vắc xin BCG được điều chế bằng phương pháp đông khô hỗn dịch vi khuẩn nuôi cấy trong môi trường có chứa dextran, glucose và Triton WR 1339 hoặc có chứa glycerin, asparagin, acid citric, kali phosphat, magnesi sulphat và sắt ammoni citrat. Sau khi pha để tiêm chủng qua da theo như chỉ dẫn, vắc xin BCG chứa 100 - 800 triệu đơn vị tạo khuẩn lạc bacillus BCG trong 1ml; dịch thuốc tiêm không được có các loại vi khuẩn khác. Vắc xin BCG do Việt Nam sản xuất chứa 1 mg BCG trong 1 ống; dung dịch để pha tiêm là dung dịch natri clorid 0,9%, mỗi ống chứa 2 ml.\n','Thường gặp:\nLoét nặng hoặc kéo dài ở vùng tiêm, apxe da ở vùng tiêm. Viêm hạch bạch huyết, nổi hạch tại chỗ.\nHiếm gặp:\nLỗ rò, sốc phản vệ. Rất hiếm gặp Viêm cốt tủy xương, nhiễm BCG lan tỏa.\n','Vắc xin BCG được khuyên dùng cho các nhóm người chưa được tiêm phòng (bằng chứng là chưa có một vết sẹo đặc trưng của vắc xin BCG) hoặc những người có phản ứng tuberculin âm tính.\nỞ những nước đang phát triển, nơi mà bệnh lao thành dịch và việc phòng ngắn ngày bằng các thuốc trị lao (như isoniazid) hoặc việc làm phản ứng tuberculin trên da để sàng lọc không thực hiện được, thì vắc xin BCG được dùng một cách thường xuyên với mục đích kiểm soát bệnh lao. Do đó, có chỉ định dùng vắc xin BCG như một chiến lược thường quy để kiểm soát bệnh lao ở các nước đó. Tổ chức y tế thế giới hiện nay khuyến cáo tiêm chủng BCG cho tất cả các trẻ sơ sinh ở các nước đang phát triển, bao gồm cả các trẻ em mắc HIV chưa có triệu chứng là những cháu có nhiều nguy cơ mắc lao.\nVắc xin BCG được tiêm ngay khi sinh ra hoặc bất cứ thời gian nào sau đó, nhưng 3 tháng tuổi là tuổi tiêm phòng tốt nhất (đối với trẻ đẻ thiếu tháng, hoặc nhẹ cân) (theo lịch tiêm phòng của Việt Nam).\n','Không được dùng vắc xin BCG cho người quá mẫn với vắc xin. Chống chỉ định dùng vắc xin BCG cho người có phản ứng tuberculin trên da dương tính cao, người vừa mới chủng vắc xin đậu mùa, người bị bỏng.\nKhông được dùng vắc xin BCG cho những người bị giảm gammaglobulin trong máu, suy giảm miễn dịch bẩm sinh, bệnh sarcoid, bệnh bạch cầu, u limpho, bệnh ác tính lan tỏa, nhiễm HIV hoặc bất cứ bệnh nào mà đáp ứng miễn dịch tự nhiên bị tổn thương. Cũng chống chỉ định dùng vắc xin BCG đối với những người có đáp ứng miễn dịch bị ức chế do điều trị kéo dài bằng liệu pháp ức chế miễn dịch (corticosteroid, một vài thuốc chống ung thư, tia xạ).\n','bcg_ktfcp.jpg'),(67,'VAXIGRIP','Nha san xuat A',200,4,'Virus cúm được cấy trên trứng, tách ra bằng octoxynol-9, bất hoạt hóa bằng formaldehyde, tinh chế. Mỗi 0,5 ml chứa 15 mcg kháng nguyên haemagglutinin của 3 chủng virus được khuyến cáo. Mỗi 0,25 ml chứa 7,5 mcg kháng nguyên haemagglutinin của 3 chủng virus được khuyến cáo.\nThành phần khác: thiomersal, dung dịch đệm chứa NaCl, disodium hydrogen phosphate dihydrate, potassium dihydrogen phosphate, KCl và nước để tiêm.\n','Cũng giống như các dược phẩm khác,Vaxigrip có thể gây những phản ứng phụ :\nPhản ứng tại chỗ : ban đỏ (quầng đỏ), sưng, đau, bầm máu,nốt cứng. Phản ứng toàn thân : sốt, khó chịu, run rẩy, mệt mỏi, đau đầu, đổ mồ hôi, đau khớp và đau cơ.\nCác phản ứng này thường tự khỏi sau 1-2 ngày, không cần điều trị.\nHiếm gặp: đau dây thần kinh (đau khu trú dọc theo đường đi của dây thần kinh), rối loạn cảm giác (rối loạn về sự cảm nhận đối với cảm giác sờ, đau, nhiệt, chuyển động), co giật hay giảm tiểu cầu thoáng qua (giảm số lượng tiểu cầu, tế bào giữ vai trò quan trọng trong việc đông máu). Phản ứng dị ứng, hiếm khi gặp, dẫn đến sốc. Viêm mạch máu, kèm theo ảnh hưởng đến thận, trong rất hiếm trường hợp. Hiếm gặp, rối loạn thần kinh.\nVaccine có chứa chất bảo quản là thiomersal, chất này có thể gây phản ứng dị ứng.\n','Dự phòng bệnh cúm, đặc biệt là ở những người có nguy cơ bị các biến chứng kèm theo cao.\n','Dị ứng với trứng, protein của gà hay với một trong các thành phần của vaccine. Sốt hay bệnh cấp tính (trong trường hợp này tốt nhất nên hoãn việc tiêm chủng).\n','vaxigrip_sjplm.jpg'),(68,'Pneumo 23','Nha san xuat A',200,4,'Giống như các sản phẩm khác, ở một số người khi dùng vaccine này có thể gặp ít nhiều khó chịu:\nPhản ứng tại nơi tiêm: đau, quầng đỏ, nốt cứng hay sưng nề; các phản ứng này nhẹ hay thoáng qua. Hiếm gặp phản ứng kiểu Arthus (phản ứng tại chỗ nặng), một phản ứng có thể hồi phục không để lại di chứng; thường gặp ở những người có nồng độ kháng thể kháng Phế cầu khuẩn trước khi tiêm cao. Sốt nhẹ và thoáng qua, đôi khi trên 39°C. Sốt thường xuất hiện sớm ngay sau khi tiêm vaccine và biến mất trong vòng 24 giờ. Các phản ứng toàn thân khác như bệnh lý hạch bạch huyết (viêm các tuyến), phát ban, đau khớp, và các phản ứng dị ứng ngoại lệ khác như mề đay, phù Quincke (một dạng mề đay kèm với sưng vùng mặt và cổ đột ngột), sốc phản vệ được ghi nhận.\n','Vaccine Pneumo 23 được sử dụng để phòng ngừa các nhiễm trùng do Phế cầu khuẩn gây nên, đặc biệt là viêm phổi, từ 2 tuổi trở lên ở các đối tượng sau:\nNhững người trên 65 tuổi, đặc biệt là người cao tuổi sống trong các cơ sở từ thiện; Những người bị giảm khả năng đáp ứng miễn dịch; Những người thường xuyên phải nhập viện (tiểu đường, viêm phế quản mạn, thiểu năng hô hấp, suy tim, nghiện rượu, nghiện thuốc lá...); Những người suy giảm miễn dịch (người cắt lách, bệnh hồng cầu hình liềm, hội chứng thận hư biến); Những người bị rò dịch não tủy.\n','Trường hợp đang sốt, bệnh cấp tính, hay đợt tái phát của bệnh mạn tính, tốt nhất nên hoãn việc tiêm vaccine. Thật sự dị ứng với một trong những thành phần của vaccine. Trong 3 tháng đầu của thai kỳ, trừ khi có ý kiến ngược lạicủa bác sĩ. Một đợt nhiễm phế cầu khuẩn, dù còn nghi ngờ hoặc đã được khẳng định không phải là một chống chỉ định & nên xem xét chủng ngừa tùy theo tình trạng nguy cơ tiềm tàng.\n','Liều dùng:\nTiêm ngừa cơ bản: một liều 0,5 ml. Tiêm nhắc lại: một liều 0,5 ml, 3-5 năm sau liều tiêm thứ nhất.\nCách tiêm:\nTốt nhất nên tiêm bắp hay tiêm dưới da. Trong mọi trường hợp, phải tuân theo đơn thuốc của bác sĩ một cách nghiêm nhặt.\n','pneumo-23_glfou.jpg'),(69,'Quinvaxem','Nha san xuat A',200,4,'Vắc xin Quinvaxem còn gọi là vắc xin “5 trong 1” là vắc xin phối hợp gồm giải độc tố vi khuẩn bạch hầu, uốn ván, vi khuẩn ho gà bất hoạt, kháng nguyên vi rút viêm gan B và kháng nguyên vi khuẩn Haemophilus influenzae type b (Hib).\n','Hiệu quả phòng bệnh của vắc xin Quinvaxem cũng như tính an toàn của vắc xin đã được Tổ chức Y tế thế giới xác nhận. Tuy nhiên, cũng như các thuốc hay loại vắc xin khác khi tiêm đều có thể xảy ra các phản ứng. Theo khuyên cáo của Tổ chức Y tế thế giới, các phản ứng nặng thường rất hiếm gặp.\nSau tiêm chủng trẻ có thể có một số các phản ứng thông thường như sốt nhẹ (< 38,5°C), đau hoặc sưng tấy nhẹ tại chỗ tiêm, quấy khóc… Tuy nhiên các phản ứng này sẽ tự khỏi trong vòng 1 ngày.\nMột số phản ứng có thể gặp khi sử dụng vắc xin Quinvaxem cũng giống như sử dụng vắc xin DPT có thành phần ho gà toàn tế bào như:\nKhóc thét dai dẳng trên 3 giờ trong vòng 48 giờ sau tiêm vắc xin với tỷ lệ là <1/100 liều sử dụng. Co giật có kèm theo sốt hoặc không sốt trong vòng 3 ngày sau tiêm vắc xin với tỷ lệ là <1/100 liều sử dụng. Giảm trương lực cơ, giảm đáp ứng xảy ra trong vòng 48 giờ với tỷ lệ là 1-2/1 triệu liều. Sốc phản vệ có thể xảy ra với tỷ lệ 20/1 triệu liều.\n','Không tiêm vắc xin Quinvaxem cho trẻ nếu tiền sử có phản ứng mạnh đối với liều tiêm trước hoặc có phản ứng mạnh đối với vắc xin bạch hầu, ho gà, uốn ván (DPT) hoặc vắc xin viêm gan B như:   - Sốt 40ºC trong vòng 48 giờ sau tiêm vắc xin.   - Sốc trong vòng 48 giờ sau tiêm vắc xin.   - Khóc dai dẳng trên 3 giờ trong vòng 48 giờ sau tiêm vắc xin.   - Co giật có kèm theo sốt hoặc không sốt trong vòng 3 ngày sau tiêm vắc xin. Không tiêm cho trẻ nhỏ dưới 6 tuần tuổi vì vắc xin có thể không hiệu quả do còn miễn dịch từ mẹ. Hoãn tiêm cho trẻ nếu trẻ đang ốm, sốt hoặc mắc các bệnh cấp tính.\n','Lịch tiêm chủng 3 mũi vắc xin Quinvaxem là 2, 3 và 4 tháng tuổi. Nếu liều vắc xin Quinvaxem nào bị bỏ lỡ hoặc tiêm muộn thì cần được tiêm sớm vào thời gian sau đó mà không cần phải tiêm lại từ mũi đầu. Chú ý khoảng cách giữa các mũi tiêm tối thiểu là 4 tuần (1 tháng).\n','quinvaxem_incfu.jpg'),(70,'Pentaxim','Nha san xuat A',200,4,'Bột pha tiêm: hộp 1 lọ bột vaccine Act-Hib đông khô + ống tiêm chứa vaccine DTaP-IPV 0,5 ml cho 1 liều tiêm chủng Giải độc tố bạch hầu ≥ 30 IU Giải độc tố uốn ván ≥ 40 IU Giải độc tố ho gà: 25 mcg Virus bại liệt týp 1 bất hoạt: 40 DU*a Virus bại liệt týp 2 bất hoạt: 8 DU*a Virus bại liệt týp 3 bất hoạt: 32 DU*a Polysaccharide của Haemophilus influenzae týp b liên hợp với protein uốn ván: 10 mcg Các thành phần khác: sucrose, trometamol, hydroxid nhôm, môi trường Hanks không có đỏ phenol, formaldehyde, phenoxyethanol và nước cất\n','Các phản ứng tại chỗ như: đau, quầng đỏ, nốt cứng có thể gặp ở chỗ tiêm trong vòng 48 giờ sau khi tiêm. Các phản ứng toàn thân: sốt, dễ kích động, buồn ngủ, rối loạn giấc ngủ và ăn uống, tiêu chảy, ói mửa, khóc nhè khó dỗ và kéo dài. Hiếm hơn, có thể thấy nổi mề đay, phát ban ngoài da, co giật kèm sốt hoặc không kèm sốt trong vòng 48 giờ sau khi tiêm. Tình trạng giảm trương lực cơ hoặc các đợt giảm trương lực cơ-giảm phản ứng đã được báo cáo. Sau khi tiêm các vaccine chứa thành phần Haemophilus influenzae týp b, phản ứng sưng phù chi dưới cũng đã được báo cáo. Những phản ứng này đôi khi đi kèm với sốt, đau và quấy khóc.\n','Trẻ có bệnh não tiến triển kèm co giật hoặc không co giật (bệnh thần kinh). Trước đây trẻ đã có phản ứng mạnh trong vòng 48 giờ sau khi tiêm vaccine: sốt cao từ 40°C trở lên, hội chứng khóc nhè dai dẳng, co giật khi sốt hoặc không kèm sốt; hội chứng giảm trương lực cơ – giảm phản ứng. Trước đây trẻ có phản ứng dị ứng xảy ra sau khi tiêm vaccine phòng bệnh bạch hầu, uốn ván, ho gà, bại liệt và nhiễm khuẩn Haemophilus influenzae týp B. Trẻ dị ứng với các hoạt chất, bất cứ thành phần tá dược nào, neomycin, streptomycin và polymixin B.\n','Liều lượng:\nLịch tiêm chủng thường được khuyến nghị bao gồm tiêm chủng cơ bản với 3 mũi tiêm, cách nhau từ một đến hai tháng, kể từ khi trẻ được hai tháng tuổi, sau đó tiêm nhắc lại một mũi trong năm thứ hai.\nCách dùng:\nHoàn nguyên vaccine bằng cách bơm hỗn dịch vaccine phối hợp bạch hầu, uốn ván, ho gà vô bào và bại liệt vào lọ bột vaccine liên hợp Haemophilus influenzae týp B. Lắc đều cho đến khi bột hòa tan hoàn toàn. Hỗn dịch sau khi hoàn nguyên màu trắng đục là bình thường. Vaccine phải được dùng ngay sau khi hoàn nguyên. Dùng đường tiêm bắp. Tốt nhất, nên tiêm vaccine ở mặt trước-bên đùi (ở một phần ba giữa).\n','pentaxim_ybfqn.jpg'),(71,'Meningo A+C','Nha san xuat A',200,4,'Cho 1 liều vắc xin:\n  Thành phần Hàm lượng Polysaccharide tinh khiết đông khô của vi khuẩn Neisseria meningitidis nhóm A 50 mcg Polysaccharide tinh khiết đông khô của vi khuẩn Neisseria meningitidis nhóm C 50 mcg (Lactose)   Ống dung môi: dung dịch đệm đẳng trương 0,5 ml\n','Trong vòng 24 giờ sau khi tiêm, có thể sốt nhẹ và hơi đỏ ở chỗ chích.\n','Phòng ngừa viêm màng não do Meningococcus nhóm A và C. Việc chủng ngừa còn được khuyến cáo ở vùng có nội dịch cao hoặc có dịch do Meningococcus nhóm A và C.\n','Vaccine này giúp cơ thể chống lại nguy cơ nhiễm Meningococcus A và C nhưng không có tác dụng đối với Meningococcus B (là tác nhân thường gây viêm màng não ở Pháp) cũng như đối với các vi khuẩn gây viêm màng não tụ mủ khác (Haemophilus influenzae, Streptococcus pneumoniae…).\n','meningo-ac_cabad.jpg'),(72,'Influvac','Nha san xuat A',200,4,'Influvac là vắc xin vi rút cúm bất hoạt đa giá dựa trên kháng nguyên bề mặt được phân lập từ các chủng A và B của Myxovirus Influenza. Thành phần của vắc xin cúm được điều chỉnh hàng năm dựa vào khuyến cáo của Tổ chức Y tế Thế giới (WHO).\n','Các phản ứng bất lợi thường mất đi trong vòng 1-2 ngày mà không cần điều trị: đau đầu; đổ mồ hôi; đau cơ, đau khớp; sốt, khó chịu, run rẩy, mệt mỏi; đỏ, sưng tấy, đau, cứng bầm máu.\n','Tiêm chủng được khuyến cáo đặc biệt cho tất cả những bệnh nhân là những người có nguy cơ tăng lên nếu họ mắc bệnh cúm.\nNhững bệnh nhân có rối loạn và suy yếu chức năng của phổi và đường hô hấp. Bệnh nhân có sự rối loạn về tim với bất kỳ lý do nào. Bệnh nhân suy thận mãn. Bệnh nhân bị tiểu đường. Bệnh nhân có nhiễm khuẩn tụ cầu cấp. Bệnh nhân có thiếu hụt miễn dịch như nhiễm HIV, một trong số các điều kiện của bệnh máu ác tính và các bệnh nhân điều trị bằng các thuốc miễn dịch ngăn chặn, các thuốc làm không thay đổi tế bào, liệu pháp sóng vô tuyếnhoặc sử dụng corticosteroid liều cao. Trẻ em và thanh thiếu niên (6 tháng đến 18 tuổi) sử dụng những sản phẩm có chứa axit acetylsalisylic trong giai đoạn trước đó bởi làm tăng nguy cơ của triệu chứng Reye\'s do tiếp xúc tiếp sau nhiễm cúm.\nViệc tiêm chủng cũng phải được cân nhắc cho những người trên 65 tuổi mà không thuộc trong các nhóm nguy cơ trên.\n','Quá mẫn cảm với các hoạt chất, với bất kỳ tá dược nào, trứng gà, protein gà, formaldehyde, cetyltrimethylammonium bromide, polysorbate 80 hoặc gentamicin. Hoãn việc tiêm chủng với những bệnh nhân ốm nặng hoặc nhiễm trùng cấp tính.\n','influvac_dtfsm.jpg'),(73,'Fluarix','Nha san xuat A',200,4,'Fluarix là một vaccine cúm bất hoạt (phân tách từ virus), chứa các kháng nguyên (được nhân giống trong trứng đã có phôi) của 2 chủng siêu vi cúm A (H1N1, H3N2) và 1 chủng siêu vi cúm B.\nMỗi liều vaccine 0,5ml (Fluarix) chứa 15 mcg haemagglutinin của mỗi chủng được WHO khuyến cáo hàng năm.\nTá dược: natri chloride, disodium phosphatedodecahydrate, kali dihydrogen phosphate, kali chloride, magnesium chloridehexahydrate, a-tocopheryl hydrogen succinate, polysorbate 80, octoxinol 10 và nước pha tiêm.\n','Trong những nghiên cứu có kiểm chứng trên lâm sàng, người ta theo dõi và ghi nhận các dấu hiệu và triệu chứng xuất hiện trong vòng 30 ngày sau khi tiêm vaccine.\nCác dấu hiệu tại chỗ (đau, đỏ, sưng) và các biểu hiện toàn thân như sốt nhẹ, mệt mỏi đã được báo cáo ở một số ít bệnh nhân. Các dấu hiệu này tự mất đi.\nHiếm thấy báo cáo về các dấu hiệu:\nChứng đau thần kinh, dị cảm, co giật, giảm tiểu cầu thoáng qua. Phản ứng dị ứng ở những người có tiền sử dị ứng với một thành phần của vaccine. Các phản ứng quá mẫn nặng (như sốc phản vệ) vô cùng hiếm. Rối loạn về hệ thần kinh như viêm não tủy, viêm thần kinh và hội chứng Guillain-Barré.\n','Fluarix được khuyến cáo để phòng ngừa cúm ở người lớn và trẻ trên 6 tháng tuổi, đặc biệt cho những đối tượng sau:\nTrên 60 tuổi; Mắc những bệnh thuộc hệ tim mạch, bệnh chuyển hóa (tiểu đường), xơ nang, bệnh mạn tính đường hô hấp và suy thận mạn; Suy giảm miễn dịch bẩm sinh hoặc mắc phải.\n','Không nên tiêm Fluarix cho những người đã biết quá mẫn với hoạt chất, với bất kỳ tá dược nào, với trứng, với thịt gà, formaldehyde, gentamicin sulphate hoặc sodium deoxycholate.\n','fluarix_xovol.jpg'),(74,'Typhim Vi','Nha san xuat A',200,4,'Mỗi liều gồm hộp 1 bơm tiêm 0,5 ml vaccine: Polyoside capsulaire Vi tinh khiết chiết từ Salmonella typhi 0,025 mg.\nCác thành phần khác: Phenol và dung dịch đệm chứa sodium chloride, disodium phosphate dihydrate, sodium dihydrogen phosphate dihydrate, và nước pha tiêm.\n','Đau tại chỗ, đỏ, hóa cứng, sốt.\n','Dự phòng sốt thương hàn ở người lớn và trẻ em trên 2 tuổi.\n','Mẫn cảm với một trong các thành phần của thuốc. Trẻ em dưới 2 tuổi: Sự đáp ứng miễn dịch của trẻ em dưới 2 tuổi đối với vaccine polyoside thường rất yếu, sau đó tăng dần. Vì thế không nên tiêm cho trẻ em dưới 2 tuổi.\n','typhim-vi_rzywc.jpg');
/*!40000 ALTER TABLE `vaccine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vaccine_disease`
--

DROP TABLE IF EXISTS `vaccine_disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vaccine_disease` (
  `vaccine_id` int(11) NOT NULL,
  `disease_id` int(11) NOT NULL,
  `note` text,
  PRIMARY KEY (`vaccine_id`,`disease_id`),
  KEY `fk_vaccine_disease_disease_idx` (`disease_id`),
  CONSTRAINT `fk_vaccine_disease_disease` FOREIGN KEY (`disease_id`) REFERENCES `disease` (`disease_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_vaccine_disease_vaccine` FOREIGN KEY (`vaccine_id`) REFERENCES `vaccine` (`vaccine_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vaccine_disease`
--

LOCK TABLES `vaccine_disease` WRITE;
/*!40000 ALTER TABLE `vaccine_disease` DISABLE KEYS */;
/*!40000 ALTER TABLE `vaccine_disease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'vmv2db'
--

--
-- Dumping routines for database 'vmv2db'
--
/*!50003 DROP PROCEDURE IF EXISTS `p_countNews` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_countNews`()
BEGIN
	SELECT count(*) FROM news WHERE `end_date` > NOW();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_countVaccines` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_countVaccines`()
BEGIN
	SELECT count(*) FROM vaccine;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_deleteDisease` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_deleteDisease`(IN `p_disease_id` INT(11))
BEGIN
	DELETE FROM `disease` WHERE `disease_id`=p_disease_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_deleteNews` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_deleteNews`(IN `p_news_id` INT(11))
BEGIN
	DELETE FROM `news` WHERE `news_id`=p_news_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_deleteUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_deleteUser`(IN `p_user_id` INT(11))
BEGIN
	DELETE FROM `user` WHERE `user_id`=p_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_deleteVaccinationRecord` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_deleteVaccinationRecord`(IN `p_user_id` INT(11), IN `p_vaccine_id` INT(11), IN `p_dose` INT(11))
BEGIN
	DELETE FROM `vaccination_record` WHERE `user_id`=p_user_id and`vaccine_id`=p_vaccine_id and `dose`=p_dose;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_deleteVaccine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_deleteVaccine`(IN `p_vaccine_id` INT(11))
BEGIN
	DELETE FROM `vaccine` WHERE `vaccine_id`=p_vaccine_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_deleteVaccineDisease` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_deleteVaccineDisease`(IN `p_vaccine_id` INT(11), IN `p_disease_id` INT(11))
BEGIN
	DELETE FROM `vaccine_disease` WHERE `vaccine_id`=p_vaccine_id and `disease_id`=p_disease_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_deleteVaccineDiseaseByVaccineId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_deleteVaccineDiseaseByVaccineId`(IN `p_vaccine_id` INT(11))
BEGIN
	DELETE FROM `vaccine_disease` WHERE `vaccine_id`=p_vaccine_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_getAllDiseases` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getAllDiseases`()
BEGIN
SELECT `disease_id`, `disease_name`, `description` FROM disease;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_getAllNews` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getAllNews`()
BEGIN
	SELECT `news_id`, `title`, `content`, `image`, `created_date`, `end_date` FROM news order by `created_date` desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_getAllUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getAllUsers`()
BEGIN
SELECT `user_id`, `full_name`, `gender`, `birthday`, `phone_number`, `address`, `username`, `password`, `role`, `avatar` FROM user;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_getAllVaccinationRecordHolder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getAllVaccinationRecordHolder`()
BEGIN
	SELECT vaccine.vaccine_id,user.user_id,vaccination_record.dose,vaccination_record.injection_date,vaccination_record.next_dose_date,user.full_name,vaccine.vaccine_name FROM vaccination_record INNER JOIN user ON vaccination_record.user_id = user.user_id INNER JOIN vaccine ON vaccination_record.vaccine_id = vaccine.vaccine_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_getAllVaccinationRecords` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getAllVaccinationRecords`()
BEGIN
SELECT `user_id`, `vaccine_id`, `dose`, `injection_date`, `next_dose_date` FROM vaccination_record;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_getAllVaccineDiseases` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getAllVaccineDiseases`()
BEGIN
SELECT `vaccine_id`, `disease_id`, `note` FROM vaccine_disease;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_getAllVaccines` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getAllVaccines`()
BEGIN
	SELECT `vaccine_id`, `vaccine_name`, `manufacturer`, `price`, `number_of_doses`, `side_effects`, `indication`, `contraindication`, `dosage_and_usage`, `image` FROM vaccine;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_getCurrentDose` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getCurrentDose`(IN `p_user_id` INT, IN `p_vaccine_id` INT)
BEGIN
SELECT `dose` FROM vaccination_record WHERE `user_id`=p_user_id and `vaccine_id`=p_vaccine_id order by `dose` desc limit 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_getDiseaseById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getDiseaseById`(IN `p_disease_id` INT)
BEGIN
SELECT `disease_id`, `disease_name`, `description` FROM disease WHERE `disease_id`=p_disease_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_getDiseaseByVaccineId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getDiseaseByVaccineId`(IN `p_vaccine_id` INT)
BEGIN
SELECT disease.`disease_id`, `disease_name`, `description` FROM `disease` INNER JOIN `vaccine_disease` ON disease.`disease_id` = vaccine_disease.`disease_id` WHERE vaccine_disease.`vaccine_id` = p_vaccine_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_getNewsById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getNewsById`(IN `p_new_id` INT(11))
BEGIN
SELECT `news_id`, `title`, `content`, `image`, `created_date`, `end_date` FROM news WHERE `news_id`=p_new_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_getNewsLimit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getNewsLimit`(IN `p_start` INT(11), IN `p_limit` INT(11))
BEGIN
	SELECT `news_id`, `title`, `content`, `image`, `created_date`, `end_date` FROM news WHERE `end_date` > NOW() order by `created_date` desc limit p_start, p_limit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_getUserById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getUserById`(IN `p_user_id` INT)
BEGIN
SELECT `user_id`, `full_name`, `gender`, `birthday`, `phone_number`, `address`, `username`, `password`, `role`, `avatar` FROM user WHERE `user_id`=p_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_getUserByUsername` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getUserByUsername`(IN `p_username` VARCHAR(255))
BEGIN
SELECT `user_id`, `full_name`, `gender`, `birthday`, `phone_number`, `address`, `username`, `password`, `role`, `avatar` FROM user WHERE `username`=p_username COLLATE utf8_unicode_ci;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_getUserByUsernamePassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getUserByUsernamePassword`(IN `p_username` VARCHAR(255), IN `p_password` VARCHAR(255))
BEGIN
SELECT `user_id`, `full_name`, `gender`, `birthday`, `phone_number`, `address`, `username`, `password`, `role`, `avatar` FROM user WHERE `username`=p_username COLLATE utf8_unicode_ci and `password`=p_password COLLATE utf8_unicode_ci;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_getVaccinationRecord` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getVaccinationRecord`(IN `p_user_id` INT, IN `p_vaccine_id` INT, IN `p_dose` INT)
BEGIN
SELECT `user_id`, `vaccine_id`, `dose`, `injection_date`, `next_dose_date` FROM vaccination_record WHERE `user_id`=p_user_id and `vaccine_id`=p_vaccine_id and `dose`=p_dose;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_getVaccinationRecordHoldersByUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getVaccinationRecordHoldersByUser`(IN `p_user_id` INT)
BEGIN
SELECT vaccine.vaccine_name, dose, injection_date, next_dose_date FROM vaccination_record INNER JOIN vaccine ON vaccination_record.vaccine_id = vaccine.vaccine_id WHERE vaccination_record.user_id = p_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_getVaccinationRecordsByUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getVaccinationRecordsByUser`(IN `p_user_id` INT)
BEGIN
SELECT `user_id`, `vaccine_id`, `dose`, `injection_date`, `next_dose_date` FROM vaccination_record WHERE `user_id`=p_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_getVaccinationRecordsByVaccine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getVaccinationRecordsByVaccine`(IN `p_vaccine_id` INT)
BEGIN
SELECT `user_id`, `vaccine_id`, `dose`, `injection_date`, `next_dose_date` FROM vaccination_record WHERE `vaccine_id`=p_vaccine_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_getVaccineById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getVaccineById`(IN `p_vaccine_id` INT(11))
BEGIN
SELECT `vaccine_id`, `vaccine_name`, `manufacturer`, `price`, `number_of_doses`, `side_effects`, `indication`, `contraindication`, `dosage_and_usage`, `image` FROM vaccine WHERE `vaccine_id`=p_vaccine_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_getVaccineDiseaseById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getVaccineDiseaseById`(IN `p_vaccine_id` INT, IN `p_disease_id` INT)
BEGIN
SELECT `vaccine_id`, `disease_id`, `note` FROM vaccine_disease WHERE `vaccine_id`=p_vaccine_id and `disease_id`=p_disease_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_getVaccineDiseaseByVaccineId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getVaccineDiseaseByVaccineId`(IN `p_vaccine_id` INT)
BEGIN
SELECT `vaccine_id`, `disease_id`, `note` FROM vaccine_disease WHERE `vaccine_id`=p_vaccine_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_getVaccineRecordHolderById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getVaccineRecordHolderById`(IN `p_idUser` INT, IN `p_idVaccine` INT, IN `p_dose` INT)
BEGIN
SELECT vaccination_record.user_id,vaccination_record.vaccine_id,dose,injection_date,next_dose_date,vaccine.vaccine_name,user.full_name FROM vaccination_record INNER JOIN user ON vaccination_record.user_id = user.user_id INNER JOIN vaccine ON vaccination_record.vaccine_id = vaccine.vaccine_id WHERE vaccination_record.user_id = p_idUser AND vaccination_record.vaccine_id = p_idVaccine AND vaccination_record.dose = p_dose;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_getVaccinesLimit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getVaccinesLimit`(IN `p_start` INT(11), IN `p_limit` INT(11))
BEGIN
	SELECT `vaccine_id`, `vaccine_name`, `manufacturer`, `price`, `number_of_doses`, `side_effects`, `indication`, `contraindication`, `dosage_and_usage`, `image` FROM vaccine limit p_start, p_limit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_insertDisease` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_insertDisease`(IN `disease_name` VARCHAR(255), IN `description` TEXT)
BEGIN
INSERT INTO disease(`disease_name`, `description`) values (disease_name, description);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_insertNews` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_insertNews`(IN `title` TEXT, IN `content` TEXT, IN `image` TEXT, IN `created_date` DATETIME, IN `end_date` DATETIME)
BEGIN
INSERT INTO news(`title`, `content`, `image`, `created_date`, `end_date`) values (title, content, image, created_date, end_date);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_insertUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_insertUser`(IN `full_name` VARCHAR(255), IN `gender` INT(11), IN `birthday` DATE, IN `phone_number` VARCHAR(20), IN `address` VARCHAR(255), IN `username` VARCHAR(255), IN `p_password` VARCHAR(255), IN `role` INT, IN `avatar` TEXT)
BEGIN
INSERT INTO user(`full_name`, `gender`, `birthday`, `phone_number`, `address`, `username`, `password`, `role`, `avatar`) VALUES(full_name, gender, birthday, phone_number, address, username, p_password, role, avatar);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_insertVaccinationRecord` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_insertVaccinationRecord`(IN `user_id` INT(11), IN `vaccine_id` INT(11), IN `dose` INT(11), IN `injection_date` DATE, IN `next_dose_date` DATE)
BEGIN
INSERT INTO vaccination_record(`user_id`, `vaccine_id`, `dose`, `injection_date`, `next_dose_date`) VALUES(user_id, vaccine_id, dose, injection_date, next_dose_date);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_insertVaccine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_insertVaccine`(IN `vaccine_name` VARCHAR(255), IN `manufacturer` VARCHAR(255), IN `price` DOUBLE, IN `number_of_doses` INT(11), IN `side_effects` TEXT, IN `indication` TEXT, IN `contraindication` TEXT, IN `dosage_and_usage` TEXT, IN `image` TEXT)
BEGIN
INSERT INTO vaccine(`vaccine_name`, `manufacturer`, `price`, `number_of_doses`, `side_effects`, `indication`, `contraindication`, `dosage_and_usage`, `image`) VALUES(vaccine_name, manufacturer, price, number_of_doses, side_effects, indication, contraindication, dosage_and_usage, image);
SELECT LAST_INSERT_ID() as VACCINE_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_insertVaccineDisease` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_insertVaccineDisease`(IN `vaccine_id` INT(11), IN `disease_id` INT(11), IN `note` TEXT)
BEGIN
INSERT INTO vaccine_disease(`vaccine_id`, `disease_id`, `note`) VALUES(vaccine_id, disease_id, note);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_searchUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_searchUser`(IN `keyword` VARCHAR(255))
BEGIN
SELECT `user_id`, `full_name`, `gender`, `birthday`, `phone_number`, `address`, `username`, `password`, `role`, `avatar` FROM user Where `full_name` LIKE CONCAT('%', keyword COLLATE utf8_unicode_ci, '%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_searchVaccine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_searchVaccine`(IN `keyword` VARCHAR(255))
BEGIN
SELECT `vaccine_id`, `vaccine_name`, `manufacturer`, `price`, `number_of_doses`, `side_effects`, `indication`, `contraindication`, `dosage_and_usage`, `image` FROM vaccine Where `vaccine_name` LIKE CONCAT('%', keyword COLLATE utf8_unicode_ci, '%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_updateDisease` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_updateDisease`(IN `disease_name` VARCHAR(255), IN `description` TEXT, IN `p_disease_id` INT(11))
BEGIN
UPDATE `disease` SET `disease_name`=disease_name,`description`=description WHERE `disease_id`=p_disease_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_updateNews` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_updateNews`(IN `title` TEXT, IN `content` TEXT, IN `image` TEXT, IN `created_date` DATETIME, IN `end_date` DATETIME, IN `p_news_id` INT(11))
BEGIN
UPDATE `news` SET `title`=title,`content`=content,`image`=image,`created_date`=created_date, `end_date`=end_date WHERE `news_id`=p_news_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_updateUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_updateUser`(IN `p_user_id` INT(11), IN `full_name` VARCHAR(255), IN `gender` INT(11), IN `birthday` DATE, IN `phone_number` VARCHAR(20), IN `address` VARCHAR(255), IN `username` VARCHAR(255), IN `p_password` VARCHAR(255), IN `role` INT, IN `avatar` TEXT)
BEGIN
UPDATE `user` SET `full_name`=full_name,`gender`=gender,`birthday`=birthday,`phone_number`=phone_number,`address`=address,`username`=username,`password`=p_password,`role`=role,`avatar`=avatar WHERE `user_id`=p_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_updateVaccinationRecord` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_updateVaccinationRecord`(IN `injection_date` DATE, IN `next_dose_date` DATE, IN `p_user_id` INT(11), IN `p_vaccine_id` INT(11), IN `p_dose` INT(11))
BEGIN
UPDATE `vaccination_record` SET `injection_date`=injection_date,`next_dose_date`=next_dose_date where `user_id`=p_user_id and`vaccine_id`=p_vaccine_id and `dose`=p_dose;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_updateVaccine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_updateVaccine`(IN `vaccine_name` VARCHAR(255), IN `manufacturer` VARCHAR(255), IN `price` DOUBLE, IN `number_of_doses` INT(11), IN `side_effects` TEXT, IN `indication` TEXT, IN `contraindication` TEXT, IN `dosage_and_usage` TEXT, IN `image` TEXT, IN `p_vaccine_id` INT(11))
BEGIN
UPDATE `vaccine` SET `vaccine_name`=vaccine_name,`manufacturer`=manufacturer,`price`=price,`number_of_doses`=number_of_doses,`side_effects`=side_effects,`indication`=indication,`contraindication`=contraindication,`dosage_and_usage`=dosage_and_usage,`image`=image where `vaccine_id`=p_vaccine_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_updateVaccineDisease` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_updateVaccineDisease`(IN `note` TEXT, IN `p_vaccine_id` INT(11), IN `p_disease_id` INT(11))
BEGIN
UPDATE `vaccine_disease` SET `note`=note where `vaccine_id`=p_vaccine_id and `disease_id` = p_disease_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-26  9:09:49
