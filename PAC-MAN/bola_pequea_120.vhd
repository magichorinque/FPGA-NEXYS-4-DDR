library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bola_pequea_120 is
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
end bola_pequea_120;

architecture Behavioral of bola_pequea_120 is
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
signal s120 :STD_LOGIC_VECTOR(7 downto 0);
signal	SFFP1,	SFFP2,	SFFP3,	SFFP4,	SFFP5,	SFFP6,	SFFP7,	SFFP8	:	std_logic; 
										
signal	R1,	R2,	R3,	R4,	R5,	R6,	R7,	R8	:	STD_LOGIC_VECTOR(3 downto 0);
signal	G1,	G2,	G3,	G4,	G5,	G6,	G7,	G8	:	STD_LOGIC_VECTOR(3 downto 0);
signal	B1,	B2,	B3,	B4,	B5,	B6,	B7,	B8	:	STD_LOGIC_VECTOR(3 downto 0);

begin

process(SCV,SCH)
begin

if 	(SCH	=	 "0001111000"	and 	SCV	=	 "0000110000"	) 	then 	s120	(	0	)	<= 	'1'	;	else	s120	(	0	)	<=		'0'		;	end if;
if 	(SCH	=	 "0001111000"	and 	SCV	=	 "0001010000"	) 	then 	s120	(	1	)	<= 	'1'	;	else	s120	(	1	)	<=		'0'		;	end if;
if 	(SCH	=	 "0001111000"	and 	SCV	=	 "0001110000"	) 	then 	s120	(	2	)	<= 	'1'	;	else	s120	(	2	)	<=		'0'		;	end if;
if 	(SCH	=	 "0001111000"	and 	SCV	=	 "0010000000"	) 	then 	s120	(	3	)	<= 	'1'	;	else	s120	(	3	)	<=		'0'		;	end if;
if 	(SCH	=	 "0001111000"	and 	SCV	=	 "0101000000"	) 	then 	s120	(	4	)	<= 	'1'	;	else	s120	(	4	)	<=		'0'		;	end if;
if 	(SCH	=	 "0001111000"	and 	SCV	=	 "0101010000"	) 	then 	s120	(	5	)	<= 	'1'	;	else	s120	(	5	)	<=		'0'		;	end if;
if 	(SCH	=	 "0001111000"	and 	SCV	=	 "0110100000"	) 	then 	s120	(	6	)	<= 	'1'	;	else	s120	(	6	)	<=		'0'		;	end if;
if 	(SCH	=	 "0001111000"	and 	SCV	=	 "0110110000"	) 	then 	s120	(	7	)	<= 	'1'	;	else	s120	(	7	)	<=		'0'		;	end if;

end process;
FFBP1	:	FFD_1b	port map	('0',clk,rst,	s120(0)	,	SFFP1	);
FFBP2	:	FFD_1b	port map	('0',clk,rst,	s120(1)	,	SFFP2	);
FFBP3	:	FFD_1b	port map	('0',clk,rst,	s120(2)	,	SFFP3	);
FFBP4	:	FFD_1b	port map	('0',clk,rst,	s120(3)	,	SFFP4	);
FFBP5	:	FFD_1b	port map	('0',clk,rst,	s120(4)	,	SFFP5	);
FFBP6	:	FFD_1b	port map	('0',clk,rst,	s120(5)	,	SFFP6	);
FFBP7	:	FFD_1b	port map	('0',clk,rst,	s120(6)	,	SFFP7	);
FFBP8	:	FFD_1b	port map	('0',clk,rst,	s120(7)	,	SFFP8	);

BolaP1	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP1,	 "0000110000",	 "0001111000",	R1,G1,B1	);
BolaP2	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP2,	 "0001010000",	 "0001111000",	R2,G2,B2	);
BolaP3	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP3,	 "0001110000",	 "0001111000",	R3,G3,B3	);
BolaP4	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP4,	 "0010000000",	 "0001111000",	R4,G4,B4	);
BolaP5	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP5,	 "0101000000",	 "0001111000",	R5,G5,B5	);
BolaP6	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP6,	 "0101010000",	 "0001111000",	R6,G6,B6	);
BolaP7	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP7,	 "0110100000",	 "0001111000",	R7,G7,B7	);
BolaP8	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP8,	 "0110110000",	 "0001111000",	R8,G8,B8	);


R <= 	R1 or	R2 or	R3 or	R4 or	R5 or	R6 or	R7 or	R8	;
G <=	G1 or	G2 or	G3 or	G4 or	G5 or	G6 or	G7 or	G8	;
B <=	B1 or	B2 or	B3 or	B4 or	B5 or	B6 or	B7 or	B8;


end Behavioral;

