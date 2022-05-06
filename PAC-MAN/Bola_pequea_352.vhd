library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Bola_pequea_352 is
    Port ( SCH : in  STD_LOGIC_VECTOR (9 downto 0);
           SCV : in  STD_LOGIC_VECTOR (9 downto 0); 
			  VAD : in  STD_LOGIC_VECTOR (8 downto 0);
           HAD : in  STD_LOGIC_VECTOR (9 downto 0);
			  EDS : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           R : out  STD_LOGIC_VECTOR (3 downto 0);
           G : out  STD_LOGIC_VECTOR (3 downto 0);
           B : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
end Bola_pequea_352;

architecture Behavioral of Bola_pequea_352 is
component FFD_1b is
    Port ( A : in  STD_LOGIC;
           clk : in  STD_LOGIC; 
           clr : in  STD_LOGIC;
			  e : in  STD_LOGIC;
           SA : out  STD_LOGIC);
end component;

component bola_pequena is
    Port ( HAD : in  STD_LOGIC_VECTOR(9 downto 0);
           VAD : in  STD_LOGIC_VECTOR(8 downto 0);
			  EDS,E : in  STD_LOGIC;
			  y,x : in  STD_LOGIC_VECTOR(9 downto 0);
			  R,G,B : out  STD_LOGIC_VECTOR(3 downto 0)
			  );
end component;
signal s352 :STD_LOGIC_VECTOR(20 downto 0);

signal	SFFP1,	SFFP2,	SFFP3,	SFFP4,	SFFP5,	SFFP6,	SFFP7,	SFFP8,	SFFP9,	SFFP10,	SFFP11,	SFFP12,	SFFP13,	SFFP14,	SFFP15,	SFFP16,		SFFP17,	SFFP18,	SFFP19,	SFFP20,	SFFP21	:	std_logic; 
																								
signal	R1,	R2,	R3,	R4,	R5,	R6,	R7,	R8,	R9,	R10,	R11,	R12,	R13,	R14,	R15,	R16,		R17,	R18,	R19,	R20,	R21	:	STD_LOGIC_VECTOR(3 downto 0);
signal	G1,	G2,	G3,	G4,	G5,	G6,	G7,	G8,	G9,	G10,	G11,	G12,	G13,	G14,	G15,	G16,		G17,	G18,	G19,	G20,	G21	:	STD_LOGIC_VECTOR(3 downto 0);
signal	B1,	B2,	B3,	B4,	B5,	B6,	B7,	B8,	B9,	B10,	B11,	B12,	B13,	B14,	B15,	B16,		B17,	B18,	B19,	B20,	B21	:	STD_LOGIC_VECTOR(3 downto 0);

begin
process(SCV,SCH)
begin
if 	(SCV	=	 "0101100000"	and 	SCH	=	 "0010001000"	) 	then 	s352	(	0	)	<= 	'1'	;	else	s352	(	0	)	<=		'0'		;	end if;
if 	(SCV	=	 "0101100000"	and 	SCH	=	 "0010011000"	) 	then 	s352	(	1	)	<= 	'1'	;	else	s352	(	1	)	<=		'0'		;	end if;
if 	(SCV	=	 "0101100000"	and 	SCH	=	 "0011001000"	) 	then 	s352	(	2	)	<= 	'1'	;	else	s352	(	2	)	<=		'0'		;	end if;
if 	(SCV	=	 "0101100000"	and 	SCH	=	 "0011011000"	) 	then 	s352	(	3	)	<= 	'1'	;	else	s352	(	3	)	<=		'0'		;	end if;
if 	(SCV	=	 "0101100000"	and 	SCH	=	 "0011101000"	) 	then 	s352	(	4	)	<= 	'1'	;	else	s352	(	4	)	<=		'0'		;	end if;
if 	(SCV	=	 "0101100000"	and 	SCH	=	 "0011111000"	) 	then 	s352	(	5	)	<= 	'1'	;	else	s352	(	5	)	<=		'0'		;	end if;
if 	(SCV	=	 "0101100000"	and 	SCH	=	 "0100001000"	) 	then 	s352	(	6	)	<= 	'1'	;	else	s352	(	6	)	<=		'0'		;	end if;
if 	(SCV	=	 "0101100000"	and 	SCH	=	 "0100011000"	) 	then 	s352	(	7	)	<= 	'1'	;	else	s352	(	7	)	<=		'0'		;	end if;
if 	(SCV	=	 "0101100000"	and 	SCH	=	 "0100101000"	) 	then 	s352	(	8	)	<= 	'1'	;	else	s352	(	8	)	<=		'0'		;	end if;
if 	(SCV	=	 "0101100000"	and 	SCH	=	 "0100111000"	) 	then 	s352	(	9	)	<= 	'1'	;	else	s352	(	9	)	<=		'0'		;	end if;
if 	(SCV	=	 "0101100000"	and 	SCH	=	 "0101001000"	) 	then 	s352	(	10	)	<= 	'1'	;	else	s352	(	10	)	<=		'0'		;	end if;
if 	(SCV	=	 "0101100000"	and 	SCH	=	 "0101011000"	) 	then 	s352	(	11	)	<= 	'1'	;	else	s352	(	11	)	<=		'0'		;	end if;
if 	(SCV	=	 "0101100000"	and 	SCH	=	 "0101101000"	) 	then 	s352	(	12	)	<= 	'1'	;	else	s352	(	12	)	<=		'0'		;	end if;
if 	(SCV	=	 "0101100000"	and 	SCH	=	 "0101111000"	) 	then 	s352	(	13	)	<= 	'1'	;	else	s352	(	13	)	<=		'0'		;	end if;
if 	(SCV	=	 "0101100000"	and 	SCH	=	 "0110001000"	) 	then 	s352	(	14	)	<= 	'1'	;	else	s352	(	14	)	<=		'0'		;	end if;
if 	(SCV	=	 "0101100000"	and 	SCH	=	 "0110011000"	) 	then 	s352	(	15	)	<= 	'1'	;	else	s352	(	15	)	<=		'0'		;	end if;
if 	(SCV	=	 "0101100000"	and 	SCH	=	 "0110101000"	) 	then 	s352	(	16	)	<= 	'1'	;	else	s352	(	16	)	<=		'0'		;	end if;
if 	(SCV	=	 "0101100000"	and 	SCH	=	 "0110111000"	) 	then 	s352	(	17	)	<= 	'1'	;	else	s352	(	17	)	<=		'0'		;	end if;
if 	(SCV	=	 "0101100000"	and 	SCH	=	 "0111101000"	) 	then 	s352	(	18	)	<= 	'1'	;	else	s352	(	18	)	<=		'0'		;	end if;
if 	(SCV	=	 "0101100000"	and 	SCH	=	 "0111111000"	) 	then 	s352	(	19	)	<= 	'1'	;	else	s352	(	19	)	<=		'0'		;	end if;
if 	(SCV	=	 "0101100000"	and 	SCH	=	 "1000001000"	) 	then 	s352	(	20	)	<= 	'1'	;	else	s352	(	20	)	<=		'0'		;	end if;
end process;

FFBP1	:	FFD_1b	port map	('0',clk,rst,	s352(0)	,	SFFP1	);	
FFBP2	:	FFD_1b	port map	('0',clk,rst,	s352(1)	,	SFFP2	);	
FFBP3	:	FFD_1b	port map	('0',clk,rst,	s352(2)	,	SFFP3	);	
FFBP4	:	FFD_1b	port map	('0',clk,rst,	s352(3)	,	SFFP4	);	
FFBP5	:	FFD_1b	port map	('0',clk,rst,	s352(4)	,	SFFP5	);	
FFBP6	:	FFD_1b	port map	('0',clk,rst,	s352(5)	,	SFFP6	);	
FFBP7	:	FFD_1b	port map	('0',clk,rst,	s352(6)	,	SFFP7	);	
FFBP8	:	FFD_1b	port map	('0',clk,rst,	s352(7)	,	SFFP8	);	
FFBP9	:	FFD_1b	port map	('0',clk,rst,	s352(8)	,	SFFP9	);	
FFBP10	:	FFD_1b	port map	('0',clk,rst,	s352(9)	,	SFFP10	);	
FFBP11	:	FFD_1b	port map	('0',clk,rst,	s352(10)	,	SFFP11	);	
FFBP12	:	FFD_1b	port map	('0',clk,rst,	s352(11)	,	SFFP12	);	
FFBP13	:	FFD_1b	port map	('0',clk,rst,	s352(12)	,	SFFP13	);	
FFBP14	:	FFD_1b	port map	('0',clk,rst,	s352(13)	,	SFFP14	);	
FFBP15	:	FFD_1b	port map	('0',clk,rst,	s352(14)	,	SFFP15	);	
FFBP16	:	FFD_1b	port map	('0',clk,rst,	s352(15)	,	SFFP16	);	
FFBP17	:	FFD_1b	port map	('0',clk,rst,	s352(16)	,	SFFP17	);	
FFBP18	:	FFD_1b	port map	('0',clk,rst,	s352(17)	,	SFFP18	);	
FFBP19	:	FFD_1b	port map	('0',clk,rst,	s352(18)	,	SFFP19	);	
FFBP20	:	FFD_1b	port map	('0',clk,rst,	s352(19)	,	SFFP20	);	
FFBP21	:	FFD_1b	port map	('0',clk,rst,	s352(20)	,	SFFP21	);	

BolaP1	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP1,	 "0101100000",	 "0010001000",	R1,G1,B1	);
BolaP2	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP2,	 "0101100000",	 "0010011000",	R2,G2,B2	);
BolaP3	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP3,	 "0101100000",	 "0011001000",	R3,G3,B3	);
BolaP4	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP4,	 "0101100000",	 "0011011000",	R4,G4,B4	);
BolaP5	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP5,	 "0101100000",	 "0011101000",	R5,G5,B5	);
BolaP6	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP6,	 "0101100000",	 "0011111000",	R6,G6,B6	);
BolaP7	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP7,	 "0101100000",	 "0100001000",	R7,G7,B7	);
BolaP8	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP8,	 "0101100000",	 "0100011000",	R8,G8,B8	);
BolaP9	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP9,	 "0101100000",	 "0100101000",	R9,G9,B9	);
BolaP10	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP10,	 "0101100000",	 "0100111000",	R10,G10,B10	);
BolaP11	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP11,	 "0101100000",	 "0101001000",	R11,G11,B11	);
BolaP12	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP12,	 "0101100000",	 "0101011000",	R12,G12,B12	);
BolaP13	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP13,	 "0101100000",	 "0101101000",	R13,G13,B13	);
BolaP14	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP14,	 "0101100000",	 "0101111000",	R14,G14,B14	);
BolaP15	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP15,	 "0101100000",	 "0110001000",	R15,G15,B15	);
BolaP16	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP16,	 "0101100000",	 "0110011000",	R16,G16,B16	);
BolaP17	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP17,	 "0101100000",	 "0110101000",	R17,G17,B17	);
BolaP18	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP18,	 "0101100000",	 "0110111000",	R18,G18,B18	);
BolaP19	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP19,	 "0101100000",	 "0111101000",	R19,G19,B19	);
BolaP20	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP20,	 "0101100000",	 "0111111000",	R20,G20,B20	);
BolaP21	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP21,	 "0101100000",	 "1000001000",	R21,G21,B21	);


R <= 	R1 or	R2 or	R3 or	R4 or	R5 or	R6 or	R7 or	R8 or	R9 or	R10 or	R11 or	R12 or	R13 or	R14 or	R15 or	R16 or		R17 or	R18 or	R19 or	R20 or	R21	;
G <=	G1 or	G2 or	G3 or	G4 or	G5 or	G6 or	G7 or	G8 or	G9 or	G10 or	G11 or	G12 or	G13 or	G14 or	G15 or	G16 or		G17 or	G18 or	G19 or	G20 or	G21	;
B <=	B1 or	B2 or	B3 or	B4 or	B5 or	B6 or	B7 or	B8 or	B9 or	B10 or	B11 or	B12 or	B13 or	B14 or	B15 or	B16 or		B17 or	B18 or	B19 or	B20 or	B21	;

end Behavioral;

