SELECT * FROM PHOTOBOARDS;

INSERT INTO PHOTOBOARDS 
	VALUES('1', 'admin', GETDATE(), '첫게시글', '내용은 없짘ㅋㅋㅋ', 0, 0, 'A');
	
INSERT INTO PHOTOBOARDS 
	VALUES('2', 'deian', GETDATE(), '샘플데이터', '사진도 없닼ㅋㅋㅋ', 0, 0, 'B');
	
INSERT INTO PHOTOBOARDS 
	VALUES('3', 'deian', GETDATE(), '샘플데이터2', '사진어케올림?!', 5, 1, 'B');	

INSERT INTO PHOTOBOARDS 
	VALUES('4', 'deian', GETDATE(), '샘플데이터3', '사진도 안되는데 비디오 어캄?', 12, 5, 'B');	
	
INSERT INTO PHOTOBOARDS 
	VALUES('5', 'deian', GETDATE(), '샘플데이터4', '망한건갘ㅋㅋㅋ', 2, 3, 'B');		
	
SELECT N.* FROM (
	SELECT ( ROW_NUMBER() OVER (ORDER BY REGDATE DESC) ) NUM, PHOTOBOARDS.*
	FROM PHOTOBOARDS
	 ) N
WHERE N.NUM BETWEEN 1 AND 20;	

SELECT COUNT(*) CNT FROM PhotoBoards;	
	
SELECT ISNULL(MAX(CAST(CODE AS INT)), 0)+1 CODE FROM PHOTOBOARDS;	
	
INSERT INTO PHOTOBOARDS(CODE, WRITER, REGDATE, TITLE, CONTENTS, HIT, THUMB, AUTHORITY) VALUES(?, ?, Getdate(), ?, ?, 0, 0, 'B');	
	
SELECT * FROM PHOTOBOARDS WHERE CODE = '1';	

SELECT * FROM LINKCOURTS;

INSERT INTO LINKCOURTS VALUES ('1', '한성대테니스장', '성북구 삼선동 한성대 테니스장', '765-5528', 'www.hansung.ac.kr');
	