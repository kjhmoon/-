-- 데이터베이스 생성
DROP DATABASE IF EXISTS univDB ;
CREATE DATABASE IF NOT EXISTS univDB ;
USE univDB;
SET SQL_SAFE_UPDATES = 0;

-- 테이블 생성
CREATE TABLE Books (
  book_id INT AUTO_INCREMENT PRIMARY KEY,        -- 각 책의 고유 ID (자동 증가, 기본 키)
  title VARCHAR(255) NOT NULL,                   -- 책 제목 (NULL 값을 허용하지 않음)
  author VARCHAR(255) NOT NULL,                  -- 책의 저자 (NULL 값을 허용하지 않음)
  publisher VARCHAR(255),                                     -- 책의 출판사 (NULL 값을 허용)
  publication_year YEAR,                                         -- 책의 출판 연도 (YYYY 형식)
  category VARCHAR(100),                                      -- 책의 카테고리 (예: 소설, 역사 등)
  isbn VARCHAR(20) UNIQUE,                                 -- 책의 국제 표준 도서 번호 (중복 불가, 유니크 제약)
  quantity INT DEFAULT 0                                       -- 현재 보유 중인 책의 수량 (기본값: 0)
);


CREATE TABLE Members (
member_id INT AUTO_INCREMENT PRIMARY KEY,       -- 각 회원의 고유 ID (자동 증가, 기본 키)
  name VARCHAR(255) NOT NULL,                   -- 회원 이름
  address VARCHAR(255),                         -- 회원 주소
  phone VARCHAR(30) UNIQUE,                     -- 회원 전화번호
  email VARCHAR(255),                           -- 회원 이메일 (중복 불가)
  join_date DATE,                               -- 회원 가입일
  overdue_days INT DEFAULT 0,                   -- 연체일 (기본값: 0)
  last_return_date DATE,                        -- 마지막 반납 날짜
  status ENUM('정상', '대출 중', '연체중') DEFAULT '정상' -- 회원 상태 (기본값: 정상)
);

CREATE TABLE Loan_Return (
  loan_id INT AUTO_INCREMENT PRIMARY KEY,       -- 대출/반납 기록의 고유 ID (자동 증가, 기본 키)
  book_id INT,                           			       -- 대출된 책의 ID (Books 테이블의 book_id 참조)
  member_id INT,                       		               -- 대출한 회원의 ID (Members 테이블의 member_id 참조)
  loan_date DATE, 			                       -- 대출 날짜 (기본값: 현재 날짜)
  due_date DATE,                                                -- 반납 예정일
  return_date DATE,                                              -- 실제 반납 날짜
  status ENUM('대출 중', '반납됨') DEFAULT '대출 중', -- 대출 상태 (기본값: 대출 중)
  FOREIGN KEY (book_id) REFERENCES Books(book_id), -- Books 테이블과 연결된 외래 키
  FOREIGN KEY (member_id) REFERENCES Members(member_id) -- Members 테이블과 연결된 외래 키
);

INSERT INTO Books (book_id, title, author, publisher, publication_year, category, isbn, quantity) VALUES
(1, 'Store although than', 'Heather Gentry', 'Houston-Delgado', 1984, 'Fiction', '978-0-10-647300-7', 10),
(2, 'Community fight experience', 'Krystal Crawford', 'Choi, Salas and Smith', 2017, 'Romance', '978-1-4672-8163-8', 3),
(3, 'Goal goal change', 'Daniel Grant', 'Taylor, Spears and Fry', 1906, 'Fiction', '978-0-488-65857-3', 6),
(4, 'Reason mention', 'Mary Thomas MD', 'Sanders-Santiago', 1987, 'Dystopian', '978-1-72588-283-6', 1),
(5, 'Trouble race near', 'Isaac Nguyen', 'Edwards, Barber and Holder', 1939, 'Non-fiction', '978-0-10-244413-1', 5),
(6, 'Six voice', 'Sarah Garcia', 'Gonzalez Group', 1944, 'Mystery', '978-0-580-36155-5', 4),
(7, 'Get', 'Stephen Wright', 'Hansen-Carrillo', 1981, 'Biography', '978-0-366-15023-6', 10),
(8, 'Individual often customer', 'Emily Gutierrez', 'Young-Jones', 2006, 'Non-fiction', '978-0-04-911233-9', 2),
(9, 'Protect church give', 'Linda Ray', 'Guzman Group', 1984, 'Historical', '978-0-281-84664-1', 3),
(10, 'Property sign', 'Erin Lee', 'Johnson and Sons', 1983, 'Romance', '978-1-57911-953-9', 4),
(11, 'Who provide', 'Kimberly Taylor', 'Cox Ltd', 1953, 'Fiction', '978-1-01-694558-5', 5),
(12, 'Third product something', 'Joseph Mckinney', 'Colon PLC', 1977, 'Historical', '978-0-02-949355-7', 5),
(13, 'Mind great wait', 'Tyler Arellano', 'Lucas, Smith and Williams', 1941, 'Thriller', '978-0-364-66124-6', 2),
(14, 'Home past', 'Sharon Gonzalez', 'Sawyer-Massey', 1904, 'Fiction', '978-1-4263-5853-1', 6),
(15, 'Wear receive find play', 'Lawrence Sanford', 'Brewer LLC', 2003, 'Romance', '978-1-253-60655-3', 9),
(16, 'Hear care', 'Timothy Luna', 'Turner, Willis and Lucas', 1992, 'Biography', '978-0-397-09283-3', 4),
(17, 'Thousand necessary', 'Darlene Anthony', 'Martinez, Johnson and Mills', 1940, 'Non-fiction', '978-1-294-44288-2', 9),
(18, 'Picture authority ever', 'Karen Liu', 'Griffin PLC', 1905, 'Historical', '978-0-11-251687-3', 3),
(19, 'Understand somebody', 'Juan White', 'Hernandez, White and Smith', 1955, 'Non-fiction', '978-0-05-419873-1', 9),
(20, 'Today keep', 'David Lane', 'Hammond-Ayers', 1972, 'Mystery', '978-0-337-55893-1', 5),
(21, 'Pressure', 'Madison Green', 'Bell, Palmer and Nguyen', 1928, 'Fiction', '978-1-193-37879-4', 5),
(22, 'Compare peace', 'David Wood', 'Collins-Washington', 2009, 'Non-fiction', '978-1-00-521791-4', 9),
(23, 'Want face our amount', 'Melinda Guerra', 'Diaz-Perry', 1961, 'Mystery', '978-0-87380-838-5', 8),
(24, 'Although four own', 'Elizabeth Douglas', 'Johnson-Perry', 1922, 'Historical', '978-0-8120-6398-1', 7),
(25, 'Fill music', 'Michael Kim', 'Hood-Cline', 1971, 'Romance', '978-1-69902-981-7', 6),
(26, 'Thought hour read', 'Paul Porter', 'Bryant, Gonzalez and Davidson', 1946, 'Biography', '978-1-02-064560-0', 2),
(27, 'Role him executive', 'Michael Fisher', 'Douglas-Petty', 1958, 'Thriller', '978-1-60962-457-6', 7),
(28, 'Official develop first', 'Kim Flores', 'Black-Durham', 1955, 'Thriller', '978-1-276-24450-3', 5),
(29, 'Simply time', 'Kimberly Stewart', 'Alexander-Hoffman', 1911, 'Romance', '978-0-696-96469-5', 2),
(30, 'Contain', 'Jessica Woods', 'Boyd-Sanchez', 1956, 'Fiction', '978-0-321-82307-6', 7),
(31, 'Across able', 'Laura Hensley', 'Allen, Cantu and Long', 2015, 'Fiction', '978-1-9797-6056-0', 5),
(32, 'Bank woman', 'Rebecca Mathews', 'Mills-Jones', 1903, 'Romance', '978-0-06-249492-4', 4),
(33, 'If poor', 'Kaitlin Stewart MD', 'Barnes, Lewis and Boyd', 1978, 'Science Fiction', '978-1-61532-032-5', 8),
(34, 'Economic start', 'Lisa Gray', 'Summers Ltd', 2005, 'Historical', '978-0-10-161960-8', 2),
(35, 'Of buy culture', 'Sandra Grimes', 'Matthews Group', 2017, 'Fantasy', '978-0-263-72973-3', 1),
(36, 'Over focus', 'David Nielsen', 'Simpson Ltd', 1937, 'Fiction', '978-1-5112-0399-9', 1),
(37, 'Seek enjoy', 'Erin Harris', 'Jones, Thornton and Thomas', 2002, 'Fiction', '978-1-928009-38-2', 6),
(38, 'Serve hope', 'Donald Stephens', 'Lewis Inc', 1978, 'Fiction', '978-1-4160-8923-0', 7),
(39, 'Another land', 'John Phillips', 'Vasquez Group', 1961, 'Science Fiction', '978-1-232-67514-3', 3),
(40, 'Social direction', 'William Wheeler', 'Ballard LLC', 1970, 'Mystery', '978-1-187-84547-9', 6),
(41, 'Head he', 'Crystal Parker', 'Perez-Newman', 1920, 'Thriller', '978-0-546-98825-3', 1),
(42, 'Black open fact', 'Gary Dawson', 'Beck, Allen and Rodriguez', 1989, 'Fantasy', '978-1-06-185397-2', 5),
(43, 'Citizen ago by', 'Lisa Martin', 'Wallace, Smith and Salinas', 1905, 'Biography', '978-1-75785-879-3', 10),
(44, 'Agency ago city', 'Anthony Richmond', 'Burns, Fleming and Rasmussen', 1995, 'Fantasy', '978-0-05-466263-8', 8),
(45, 'Our sort ahead', 'Colin Smith', 'Terry, Patterson and Kline', 2008, 'Dystopian', '978-0-371-20728-4', 5),
(46, 'Network', 'Omar Harrison', 'Simpson Group', 1913, 'Dystopian', '978-0-323-30837-3', 1),
(47, 'As certainly', 'Bobby Smith', 'Jones Group', 1917, 'Dystopian', '978-1-265-93104-9', 5),
(48, 'Record gas', 'Caitlin Ochoa', 'Johnson LLC', 1949, 'Mystery', '978-0-9913503-0-8', 3),
(49, 'Safe say', 'Adam Wilkins', 'King and Sons', 1907, 'Dystopian', '978-1-84314-552-3', 3),
(50, 'Care discover add', 'Judy Ford', 'Strong, Vargas and Hughes', 1936, 'Science Fiction', '978-0-634-97347-5', 7),
(51, 'Include kitchen test', 'Sierra Crawford', 'Wright-Ramos', 1932, 'Thriller', '978-1-63994-005-9', 2),
(52, 'Church theory likely', 'Maria Dixon', 'Lopez-Villanueva', 2000, 'Non-fiction', '978-0-311-76910-0', 7),
(53, 'Drive professor', 'Dennis Morales', 'Harris-Campbell', 1920, 'Mystery', '978-1-272-64733-9', 4),
(54, 'Page cultural I', 'Jennifer Thomas', 'Jones-Stewart', 1961, 'Mystery', '978-1-275-15636-4', 5),
(55, 'Join executive', 'Daniel Smith', 'Johnson, Rose and Walker', 1918, 'Romance', '978-1-70052-256-6', 10),
(56, 'Somebody while', 'Angela Stewart', 'Hamilton, Moyer and Dougherty', 1909, 'Thriller', '978-0-7332-9411-2', 3),
(57, 'Condition financial', 'Robert Jordan', 'Barnett Inc', 1961, 'Romance', '978-0-503-13031-2', 6),
(58, 'Pm leave someone', 'Donald Duke', 'Patterson Ltd', 1974, 'Fiction', '978-0-584-66140-8', 8),
(59, 'Give choice', 'Benjamin Walsh', 'Glover and Sons', 1921, 'Fiction', '978-0-87105-095-3', 6),
(60, 'International according', 'Mr. Lawrence Allen', 'Munoz-Ferguson', 2023, 'Fiction', '978-1-937394-16-5', 5),
(61, 'Family the toward available', 'Samuel Cox', 'Trujillo LLC', 1997, 'Fiction', '978-1-9859-8436-3', 1),
(62, 'Edge', 'Darren Meyer', 'Davis-Garcia', 1919, 'Fantasy', '978-1-905220-91-5', 3),
(63, 'Evidence no', 'Laura Bailey', 'Turner-Cordova', 1988, 'Science Fiction', '978-0-07-444803-8', 5),
(64, 'Rise spend compare', 'Victoria Cooley', 'Nguyen and Sons', 1983, 'Romance', '978-0-86509-290-7', 10),
(65, 'Skill media culture', 'Rodney Smith', 'Williams-Velez', 1960, 'Dystopian', '978-1-7359477-1-6', 3),
(66, 'Ten college career', 'Marcus Berry', 'Garrett-Moore', 1955, 'Thriller', '978-0-368-83305-2', 1),
(67, 'Population', 'Heidi Mcconnell', 'Smith-Werner', 2008, 'Dystopian', '978-0-255-88778-6', 8),
(68, 'Decade issue', 'Anthony Chambers', 'Sellers, Hall and Young', 1966, 'Fantasy', '978-0-286-52183-3', 10),
(69, 'Personal policy', 'Deborah Rodriguez', 'Roberts Group', 1938, 'Science Fiction', '978-0-473-58722-2', 2),
(70, 'Dream threat', 'Ashley Lee', 'Webb-Green', 1993, 'Non-fiction', '978-0-86395-074-2', 10),
(71, 'Not', 'Miranda Bell', 'Grant, Rasmussen and Howard', 1924, 'Biography', '978-1-65130-360-3', 3),
(72, 'Look professional magazine', 'Kylie Williams PhD', 'Cisneros Ltd', 1969, 'Non-fiction', '978-0-283-40520-4', 3),
(73, 'Risk couple', 'Sarah Smith', 'Johnson LLC', 1934, 'Biography', '978-1-78970-233-0', 9),
(74, 'Home his American project', 'Samantha Smith', 'Wheeler Group', 1925, 'Biography', '978-0-485-60363-7', 3),
(75, 'Free color Democrat', 'Joseph Jacobs', 'May-Smith', 1914, 'Mystery', '978-1-09-262829-7', 8),
(76, 'Can radio', 'Ms. Jennifer Rogers', 'Stokes-Alvarez', 1988, 'Historical', '978-0-08-213494-7', 2),
(77, 'Create', 'Michael Koch', 'Phillips-Brown', 1935, 'Biography', '978-0-05-810744-9', 9),
(78, 'Drug investment opportunity', 'Julie Lee', 'Harvey PLC', 1962, 'Science Fiction', '978-0-10-300511-9', 6),
(79, 'Soldier a speak expect', 'Justin Baker', 'Huber, Hester and Sharp', 1972, 'Fantasy', '978-0-332-45193-0', 7),
(80, 'Line generation city', 'Maria Williams', 'Stephens PLC', 2004, 'Thriller', '978-0-8202-4711-3', 6),
(81, 'Drop group open', 'Angela Hoffman', 'Mendez, Moore and Mercado', 1923, 'Historical', '978-1-55437-603-2', 5),
(82, 'She TV oil figure', 'Andrew Lyons', 'Smith, Barrett and Garza', 1919, 'Thriller', '978-1-60632-940-5', 4),
(83, 'Their current', 'Samantha Banks', 'Murphy-Hernandez', 1962, 'Fiction', '978-0-9557437-1-9', 8),
(84, 'Laugh design', 'Jeremy Watson', 'Walker-Arroyo', 2009, 'Historical', '978-1-275-81288-8', 7),
(85, 'National building dark', 'Jeff Baldwin', 'Brooks, Romero and Buck', 1947, 'Dystopian', '978-0-7988-8888-2', 6),
(86, 'World skill', 'Donald White', 'Lamb, James and Edwards', 1964, 'Historical', '978-0-332-21551-8', 4),
(87, 'Time low speak', 'David Nguyen', 'Smith-Mckee', 1982, 'Fantasy', '978-0-16-412490-3', 5),
(88, 'Me then', 'Brandon Carlson', 'Ryan-Barnes', 1902, 'Dystopian', '978-1-63612-153-6', 9),
(89, 'Sense born', 'Christopher Shelton', 'Phillips, Paul and Garcia', 1983, 'Non-fiction', '978-0-283-80105-1', 7),
(90, 'Yourself daughter speak', 'Justin Spencer', 'Miller PLC', 1959, 'Historical', '978-0-9852282-8-6', 4),
(91, 'Race employee real', 'John Rivera', 'Baker-Tran', 1958, 'Historical', '978-0-657-44452-5', 4),
(92, 'Avoid leave together', 'Crystal Jones', 'Fuller, Gomez and Delgado', 1998, 'Fantasy', '978-0-358-67077-3', 4),
(93, 'Would Mrs', 'Vicki Peterson', 'Singh-Peterson', 2022, 'Fiction', '978-1-60509-328-4', 2),
(94, 'Her subject', 'Kathy Peterson', 'Wilson-Adams', 1967, 'Fiction', '978-0-7070-0848-6', 7),
(95, 'Wait office', 'Patricia Poole', 'Harrison LLC', 1982, 'Fantasy', '978-0-89768-684-6', 7),
(96, 'Ten production in', 'Justin Williams DDS', 'Anderson-Estes', 1939, 'Science Fiction', '978-1-57186-942-5', 5),
(97, 'Kitchen security', 'William Elliott', 'Nelson, Garza and Reilly', 1952, 'Biography', '978-0-86879-722-9', 10),
(98, 'Race', 'Christy Small', 'Gray-Stewart', 1967, 'Mystery', '978-1-872442-70-9', 7),
(99, 'Example', 'Dennis Livingston', 'Johnson and Sons', 1936, 'Fiction', '978-0-7905-8410-2', 7),
(100, 'Region manage dark', 'Madeline Hartman', 'Perry, Michael and Callahan', 1952, 'Non-fiction', '978-0-319-12886-2', 5);

-- 기본 회원정보 삽입
INSERT INTO Members (member_id, name, address, phone, email, join_date) VALUES
(1, 'Cindy Burnett DVM', '520 Jose Light, South Jessica, HI 33436', '001-116-361-4937x8907', 'mercedes81@gmail.com', '2020-05-29'),
(2, 'Joseph Taylor', 'PSC 0466, Box 6041, APO AE 35545', '001-572-562-7964', 'rittermiguel@stein.com', '2023-04-03'),
(3, 'Lauren Chang', '131 Cheryl Ville Apt. 034, West Joanne, CT 49506', '(897)263-4874', 'jmoody@yahoo.com', '2023-05-23'),
(4, 'John Bishop', '670 Kim Junctions, Crystalside, AK 69590', '(982)558-4593x7725', 'donnakim@gmail.com', '2022-07-20'),
(5, 'David Schwartz', '066 Kevin Squares, West Matthewborough, MO 88509', '(914)751-3904x2329', 'mitchell24@yahoo.com', '2021-05-13'),
(6, 'Dr. Sean Rocha', '414 Fitzpatrick Locks Apt. 191, East Kelliside, VT 09897', '001-554-942-2462', 'gregoryjohns@stafford-murphy.biz', '2021-01-18'),
(7, 'Grant Best', '5668 Christine Ridge, Gregorychester, DE 38710', '642-288-2660x6255', 'debrafernandez@yahoo.com', '2020-05-17'),
(8, 'Deborah Hayes', '0086 Taylor Mission, New Cindyport, AR 91727', '652-097-6775', 'ojones@wolf.biz', '2019-12-03'),
(9, 'Shannon Walter', '089 Brewer Squares Suite 697, Port Scottshire, NE 18071', '+1-585-244-0185x8337', 'carrolljonathan@hotmail.com', '2020-12-29'),
(10, 'Lisa Smith', '736 Rivera Parkway, Anthonyport, OK 53601', '2426620853', 'acostajessica@lee.com', '2024-06-05');


-- 새로운 책을 삽입하는 쿼리
-- 새 책인 경우 INSERT, 기존 책인 경우 수량(quantity)을 증가시킴
INSERT INTO Books (title, author, publisher, publication_year, category, isbn, quantity)
VALUES ('Mystery of the Lost City', 'Jane Doe', 'Explorer Publishing', 2022, 'Adventure', '978-1-9999-1111-1', 3)
ON DUPLICATE KEY UPDATE
quantity = quantity + VALUES(quantity); -- 중복된 키(isbn)가 존재할 경우, 기존 책 수량을 증가

-- 기존 책 삽입 시 새로 추가하지 않고 수량만 증가
-- 동일한 ISBN이 존재하면 수량(quantity)을 증가시킴
INSERT INTO Books (title, author, publisher, publication_year, category, isbn, quantity)
VALUES ('Region manage dark', 'Madeline Hartman', 'Perry, Michael and Callahan', 1952, 'Non-fiction', '978-0-319-12886-2', 1)
ON DUPLICATE KEY UPDATE
quantity = quantity + VALUES(quantity); -- 중복된 ISBN의 경우 수량 증가

-- 기존 책 정보 수정 쿼리
-- book_id가 62인 책의 정보를 수정
-- 수정은 해당 책이 대출 중이 아닐 경우에만 실행
UPDATE Books
SET title = 'New Title',                     -- 수정할 새로운 제목
    author = 'New Author',               -- 수정할 새로운 글쓴이
    publisher = 'New Publisher',        -- 수정할 새로운 출판사
    publication_year = 2023,             -- 수정할 새로운 출판 연도
    category = 'New Category',         -- 수정할 새로운 카테고리
    quantity = 5                             -- 수정할 새로운 수량
WHERE book_id = 62                     -- 수정할 책의 ID
  AND NOT EXISTS (
      SELECT 1
      FROM Loan_Return
      WHERE Loan_Return.book_id = Books.book_id -- 대출 상태를 확인
        AND status = '대출 중'                               -- 대출 중일 경우 수정 차단
  );

-- 기존 책 삭제 쿼리
-- book_id가 90인 책을 삭제
-- 대출 중인 책은 삭제되지 않도록 설정
DELETE FROM Books
WHERE book_id = 90
  AND NOT EXISTS (
      SELECT 1
      FROM Loan_Return
      WHERE Loan_Return.book_id = Books.book_id -- 대출 상태 확인
        AND status = '대출 중'                               -- 대출 중일 경우 삭제 차단
  );

-- 새로운 회원 추가 쿼리
-- 새 회원 추가 시 동일한 전화번호가 있는지 확인
-- 동일한 전화번호가 없을 경우에만 회원 정보를 추가
INSERT INTO Members (name, address, phone, email, join_date)
SELECT 'jal_kkong', 'Korea', '010-3906-3857', 'kjhmoon@naver.com', '2024-11-15'
WHERE NOT EXISTS (
    SELECT 1 FROM Members WHERE phone = '010-3906-3857' -- 중복된 전화번호 확인
);

-- 회원 정보를 업데이트하는 쿼리
-- 'Cindy Burnett DVM'이라는 이름의 회원 정보를 수정하며,
-- 1. 전화번호가 다른 회원과 중복되지 않아야 함
-- 2. 회원이 대출 중이 아니어야 함

UPDATE Members AS M
-- Members 테이블을 M이라는 별칭으로 업데이트

JOIN (
    SELECT member_id 
    FROM Members
    WHERE phone = '001-116-361-4937x8907'
    -- '001-116-361-4937x8907'이라는 전화번호를 가진 회원의 ID를 조회
) AS TargetMember 
ON M.member_id = TargetMember.member_id
-- 조회된 TargetMember와 Members 테이블을 회원 ID를 기준으로 연결

LEFT JOIN Members AS OtherMembers
ON OtherMembers.phone = '010-3906-3857' 
-- 새로 설정하려는 전화번호 '010-3906-3857'가 다른 회원과 중복되는지 확인
AND OtherMembers.member_id != TargetMember.member_id
-- 중복 확인 시 동일한 회원 ID는 제외

LEFT JOIN Loan_Return AS LR
ON LR.member_id = TargetMember.member_id 
-- Loan_Return 테이블에서 해당 회원의 대출 기록을 확인
AND LR.status = '대출 중'
-- 해당 회원이 '대출 중' 상태인지 확인

SET 
  M.name = 'jal_kkong',        -- 회원 이름을 'jal_kkong'으로 수정
  M.address = 'korea',        -- 회원 주소를 'korea'로 수정
  M.phone = '010-3906-3857',  -- 회원 전화번호를 '010-3906-3857'로 수정
  M.email = 'kjhmoon06@gmail.com', -- 회원 이메일을 'kjhmoon06@gmail.com'으로 수정
  M.join_date = '2020-05-29'  -- 회원 가입일을 '2020-05-29'로 수정

WHERE OtherMembers.phone IS NULL 
-- 다른 회원과 전화번호가 중복되지 않는 경우에만 실행
AND LR.status IS NULL;
-- 회원이 '대출 중' 상태가 아닌 경우에만 실행

-- 대출(Joseph Taylor가 Example 책을 1권 빌리는 예시)
-- 트랜잭션 시작
START TRANSACTION;

-- 1. 연체 상태 초기화 (2024년 11월 16일 기준)
UPDATE Members
SET 
    overdue_days = CASE 
        WHEN overdue_days > 0 THEN GREATEST(overdue_days - DATEDIFF('2024-11-16', last_return_date), 0)
        ELSE 0
    END,
    status = CASE 
        WHEN overdue_days - DATEDIFF('2024-11-16', last_return_date) <= 0 THEN '정상'
        ELSE '연체중'
    END
WHERE name = 'Joseph Taylor'; -- 회원 이름을 기준으로 업데이트

-- 2. 대출 가능 여부 확인 (참고용)
SELECT 
    m.member_id, m.name, m.status, m.overdue_days, b.book_id, b.title, b.quantity
FROM 
    Members m
JOIN 
    Books b ON b.title = 'Example'
WHERE 
    m.name = 'Joseph Taylor'
    AND m.status = '정상'
    AND b.quantity > 0;

-- 3. 회원 상태를 대출 중으로 변경
UPDATE Members
SET status = '대출 중'
WHERE name = 'Joseph Taylor';

-- 4. 대출 데이터 삽입
INSERT INTO Loan_Return (book_id, member_id, loan_date, due_date, status)
SELECT 
    b.book_id, m.member_id, '2024-11-16', DATE_ADD('2024-11-16', INTERVAL 7 DAY), '대출 중'
FROM 
    Members m
JOIN 
    Books b ON b.title = 'Example'
WHERE 
    m.name = 'Joseph Taylor';

-- 5. 책 수량 감소
UPDATE Books
SET quantity = quantity - 1
WHERE title = 'Example' AND quantity > 0;

-- 6. 책 수량이 0이 되면 대출 불가능으로 표시
UPDATE Books
SET category = '대출 불가'
WHERE quantity = 0;

-- 트랜잭션 커밋
COMMIT;

-- 반납(Joseph Taylor가 Example 책을 1권을 2024 11 16에 빌리고 2024 11 26에 반납)
-- 트랜잭션 시작
START TRANSACTION;

-- 1. 반납된 책의 수량 증가
UPDATE Books
SET quantity = quantity + 1
WHERE title = 'Example';

-- 2. 반납 날짜와 상태 기록
UPDATE Loan_Return
SET 
    return_date = '2024-11-26', -- 반납 날짜를 2024년 11월 26일로 설정
    status = '반납됨' -- 상태를 반납됨으로 변경
WHERE 
    book_id = (SELECT book_id FROM Books WHERE title = 'Example') -- 반납한 책
    AND member_id = (SELECT member_id FROM Members WHERE name = 'Joseph Taylor'); -- 반납한 회원

-- 3. 연체일 계산 및 회원 상태 갱신
UPDATE Members
SET 
    overdue_days = GREATEST(DATEDIFF('2024-11-26', DATE_ADD('2024-11-16', INTERVAL 7 DAY)), 0), -- 연체일 계산
    last_return_date = '2024-11-26', -- 마지막 반납 날짜 갱신
    status = CASE 
        WHEN DATEDIFF('2024-11-26', DATE_ADD('2024-11-16', INTERVAL 7 DAY)) > 0 THEN '연체중' -- 연체된 경우
        ELSE '정상' -- 연체되지 않은 경우
    END
WHERE name = 'Joseph Taylor';

-- 트랜잭션 커밋
COMMIT;

-- 대출중인 상태 확인
SELECT 
    member_id, book_id, status
FROM 
    Loan_Return
WHERE 
    member_id = (SELECT member_id FROM Members WHERE name = 'Joseph Taylor')
    AND status = '대출 중';

-- 반납 상태 확인
SELECT 
    loan_id, book_id, member_id, loan_date, due_date, return_date, status
FROM 
    Loan_Return
WHERE 
    member_id = (SELECT member_id FROM Members WHERE name = 'Joseph Taylor');

-- 회원상태 확인
SELECT 
    name, status, overdue_days, last_return_date
FROM 
    Members
WHERE 
    name = 'Joseph Taylor';

-- Books 테이블의 모든 데이터 조회
SELECT * FROM Books;

-- Members 테이블의 모든 데이터 조회
SELECT * FROM Members;

    