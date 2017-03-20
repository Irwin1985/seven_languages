
valid([]).
valid([Head|Tail]) :-
	fd_all_different(Head),
	valid(Tail)
.

sudoku(Puzzle, Solution) :-
	Solution = Puzzle
	,Puzzle = [	S11, S12, S13, S14, S15, S16, S17, S18, S19,
			S21, S22, S23, S24, S25, S26, S27, S28, S29,
			S31, S32, S33, S34, S35, S36, S37, S38, S39,
			S41, S42, S43, S44, S45, S46, S47, S48, S49,
			S51, S52, S53, S54, S55, S56, S57, S58, S59,
			S61, S62, S63, S64, S65, S66, S67, S68, S69,
			S71, S72, S73, S74, S75, S76, S77, S78, S79,
			S81, S82, S83, S84, S85, S86, S87, S88, S89,
			S91, S92, S93, S94, S95, S96, S97, S98, S99
		]
	,fd_domain(Puzzle, 1, 9)
	,ROW1 = [S11,S12,S13,S14,S15,S16,S17,S18,S19]
	,ROW2 = [S21,S22,S23,S24,S25,S26,S27,S28,S29]
	,ROW3 = [S31,S32,S33,S34,S35,S36,S37,S38,S39]
	,ROW4 = [S41,S42,S43,S44,S45,S46,S47,S48,S49]
	,ROW5 = [S51,S52,S53,S54,S55,S56,S57,S58,S59]
	,ROW6 = [S61,S62,S63,S64,S65,S66,S67,S68,S69]
	,ROW7 = [S71,S72,S73,S74,S75,S76,S77,S78,S79]
	,ROW8 = [S81,S82,S83,S84,S85,S86,S87,S88,S89]
	,ROW9 = [S91,S92,S93,S94,S95,S96,S97,S98,S99]
	,COL1 = [S11,S21,S31,S41,S51,S61,S71,S81,S91]
	,COL2 = [S12,S22,S32,S42,S52,S62,S72,S82,S92]
	,COL3 = [S13,S23,S33,S43,S53,S63,S73,S83,S93]
	,COL4 = [S14,S24,S34,S44,S54,S64,S74,S84,S94]
	,COL5 = [S15,S25,S35,S45,S55,S65,S75,S85,S95]
	,COL6 = [S16,S26,S36,S46,S56,S66,S76,S86,S96]
	,COL7 = [S17,S27,S37,S47,S57,S67,S77,S87,S97]
	,COL8 = [S18,S28,S38,S48,S58,S68,S78,S88,S98]
	,COL9 = [S19,S29,S39,S49,S59,S69,S79,S89,S99]
%
	,SQU1 = [	S11,S12,S13,
 			S21,S22,S23,
			S31,S32,S33
		]
	,SQU2 = [	S14,S15,S16,
			S24,S25,S26,
			S34,S35,S36
		]
	,SQU3 = [	S17,S18,S19,
			S27,S28,S29,
			S37,S38,S39
		]
%
	,SQU4 = [	S41,S42,S43,
 			S51,S52,S53,
			S61,S62,S63
		]
	,SQU5 = [	S44,S45,S46,
			S54,S55,S56,
			S64,S65,S66
		]
	,SQU6 = [	S47,S48,S49,
			S57,S58,S59,
			S67,S68,S69
		]
%
	,SQU7 = [	S71,S72,S73,
 			S81,S82,S83,
			S91,S92,S93
		]
	,SQU8 = [	S74,S75,S76,
			S84,S85,S86,
			S94,S95,S96
		]
	,SQU9 = [	S77,S78,S79,
			S87,S88,S89,
			S97,S98,S99
		]
%
	,valid([
		ROW1,ROW2,ROW3,ROW4,ROW5,ROW6,ROW7,ROW8,ROW9,
		COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9,
		SQU1,SQU2,SQU3,SQU4,SQU5,SQU6,SQU7,SQU8,SQU9
	])
.

start :-
	write('Solving sudoku')
	,nl
	,Puzzle = [	S11, S12, S13, S14, S15, S16, S17, S18, S19,
			S21, S22, S23, S24, S25, S26, S27, S28, S29,
			S31, S32, S33, S34, S35, S36, S37, S38, S39,
			S41, S42, S43, S44, S45, S46, S47, S48, S49,
			S51, S52, S53, S54, S55, S56, S57, S58, S59,
			S61, S62, S63, S64, S65, S66, S67, S68, S69,
			S71, S72, S73, S74, S75, S76, S77, S78, S79,
			S81, S82, S83, S84, S85, S86, S87, S88, S89,
			S91, S92, S93, S94, S95, S96, S97, S98, S99
		]
	,fd_domain(Puzzle, 1, 9)
	,sudoku(Puzzle, Solution)
	,print(S11),print(',')
	,print(S12),print(',')
	,print(S13),print(',')
	,print(S14),print(',')
	,print(S15),print(',')
	,print(S16),print(',')
	,print(S17),print(',')
	,print(S18),print(',')
	,print(S19),nl
	,print(S21),print(',')
	,print(S22),print(',')
	,print(S23),print(',')
	,print(S24),print(',')
	,print(S25),print(',')
	,print(S26),print(',')
	,print(S27),print(',')
	,print(S28),print(',')
	,print(S29),nl
	,print(S31),print(',')
	,print(S32),print(',')
	,print(S33),print(',')
	,print(S34),print(',')
	,print(S35),print(',')
	,print(S36),print(',')
	,print(S37),print(',')
	,print(S38),print(',')
	,print(S39),nl
	,print(S41),print(',')
	,print(S42),print(',')
	,print(S43),print(',')
	,print(S44),print(',')
	,print(S45),print(',')
	,print(S46),print(',')
	,print(S47),print(',')
	,print(S48),print(',')
	,print(S49),nl
	,print(S51),print(',')
	,print(S52),print(',')
	,print(S53),print(',')
	,print(S54),print(',')
	,print(S55),print(',')
	,print(S56),print(',')
	,print(S57),print(',')
	,print(S58),print(',')
	,print(S59),nl
	,print(S61),print(',')
	,print(S62),print(',')
	,print(S63),print(',')
	,print(S64),print(',')
	,print(S65),print(',')
	,print(S66),print(',')
	,print(S67),print(',')
	,print(S68),print(',')
	,print(S69),nl
	,print(S71),print(',')
	,print(S72),print(',')
	,print(S73),print(',')
	,print(S74),print(',')
	,print(S75),print(',')
	,print(S76),print(',')
	,print(S77),print(',')
	,print(S78),print(',')
	,print(S79),nl
	,print(S81),print(',')
	,print(S82),print(',')
	,print(S83),print(',')
	,print(S84),print(',')
	,print(S85),print(',')
	,print(S86),print(',')
	,print(S87),print(',')
	,print(S88),print(',')
	,print(S89),nl
	,print(S91),print(',')
	,print(S92),print(',')
	,print(S93),print(',')
	,print(S94),print(',')
	,print(S95),print(',')
	,print(S96),print(',')
	,print(S97),print(',')
	,print(S98),print(',')
	,print(S99),nl
.

