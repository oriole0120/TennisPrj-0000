SELECT * FROM FREEBOARDS;

INSERT INTO FREEBOARDS 
	VALUES('1', 'admin', GETDATE(), 'ù�Խñ�', '������ ����������', 0, 0, 'A');
	
INSERT INTO PHOTOBOARDS 
	VALUES('2', 'deian', GETDATE(), '���õ�����', '������ ����������', 0, 0, 'B');
	
INSERT INTO PHOTOBOARDS 
	VALUES('3', 'deian', GETDATE(), '���õ�����2', '�������ɿø�?!', 5, 1, 'B');	

INSERT INTO PHOTOBOARDS 
	VALUES('4', 'deian', GETDATE(), '���õ�����3', '������ �ȵǴµ� ���� ��į?', 12, 5, 'B');	
	
INSERT INTO PHOTOBOARDS 
	VALUES('5', 'deian', GETDATE(), '���õ�����4', '���ѰǁJ������', 2, 3, 'B');		
	
SELECT N.* FROM (
	SELECT ( ROW_NUMBER() OVER (ORDER BY REGDATE DESC) ) NUM, PHOTOBOARDS.*
	FROM PHOTOBOARDS
	 ) N
WHERE N.NUM BETWEEN 1 AND 20;	

SELECT COUNT(*) CNT FROM PhotoBoards;	
	
SELECT ISNULL(MAX(CAST(CODE AS INT)), 0)+1 CODE FROM PHOTOBOARDS;	
	
INSERT INTO PHOTOBOARDS(CODE, WRITER, REGDATE, TITLE, CONTENTS, HIT, THUMB, AUTHORITY) VALUES(?, ?, Getdate(), ?, ?, 0, 0, 'B');	
	
SELECT * FROM PHOTOBOARDS WHERE CODE = '1';	

<<<<<<< HEAD
SELECT * FROM LINKCOURTS;

INSERT INTO LINKCOURTS VALUES ('1', '�Ѽ����״Ͻ���', '���ϱ� �Ｑ�� �Ѽ��� �״Ͻ���', '765-5528', 'www.hansung.ac.kr');
=======
SELECT N.* FROM (SELECT ( ROW_NUMBER() OVER (ORDER BY REGDATE DESC) ) NUM, FREEBOARDS.*FROM FREEBOARDS WHERE 'title' LIKE '' ) N WHERE N.NUM BETWEEN 1 AND 10;

>>>>>>> refs/remotes/origin/master

SELECT * FROM FREEBOARDS WHERE CODE = '11';
	
