SELECT E.maker, E.pc, E.laptop, F.printer FROM
	(SELECT C.maker, C.pc, D.laptop FROM
		(SELECT A.maker, B.pc FROM
			(SELECT P1.maker FROM Product P1 GROUP BY P1.maker) A
		LEFT JOIN (SELECT P2.maker, COUNT(P2.maker) pc From Product P2 GROUP BY P2.maker, P2.type HAVING P2.type='PC') B ON A.maker=B.maker ) C
	LEFT JOIN (SELECT P3.maker, COUNT(P3.maker) laptop From Product P3 GROUP BY P3.maker, P3.type HAVING P3.type='Laptop') D ON C.maker=D.maker ) E
LEFT JOIN (SELECT P4.maker, COUNT(P4.maker) printer From Product P4 GROUP BY P4.maker, P4.type HAVING P4.type='Printer') F ON E.maker=F.maker

