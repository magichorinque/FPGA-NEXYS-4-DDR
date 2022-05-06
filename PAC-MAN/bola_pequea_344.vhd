library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bola_pequea_344 is
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
end bola_pequea_344;

architecture Behavioral of bola_pequea_344 is
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
signal s296 :STD_LOGIC_VECTOR(6 downto 0);

signal	SFFP1,	SFFP2,	SFFP3,	SFFP4,	SFFP5,	SFFP6,	SFFP7	:	std_logic; 
									
signal	R1,	R2,	R3,	R4,	R5,	R6,	R7	:	STD_LOGIC_VECTOR(3 downto 0);
signal	G1,	G2,	G3,	G4,	G5,	G6,	G7	:	STD_LOGIC_VECTOR(3 downto 0);
signal	B1,	B2,	B3,	B4,	B5,	B6,	B7	:	STD_LOGIC_VECTOR(3 downto 0);


begin
process(SCV,SCH)
begin
if 	(SCH	=	 "0101011000"	and 	SCV	=	 "0000110000"	) 	then 	s296	(	0	)	<= 	'1'	;	else	s296	(	0	)	<=	'0'		;	end if;
if 	(SCH	=	 "0101011000"	and 	SCV	=	 "0001000000"	) 	then 	s296	(	1	)	<= 	'1'	;	else	s296	(	1	)	<=	'0'		;	end if;
if 	(SCH	=	 "0101011000"	and 	SCV	=	 "0001010000"	) 	then 	s296	(	2	)	<= 	'1'	;	else	s296	(	2	)	<=	'0'		;	end if;
if 	(SCH	=	 "0101011000"	and 	SCV	=	 "0101000000"	) 	then 	s296	(	3	)	<= 	'1'	;	else	s296	(	3	)	<=	'0'		;	end if;
if 	(SCH	=	 "0101011000"	and 	SCV	=	 "0101010000"	) 	then 	s296	(	4	)	<= 	'1'	;	else	s296	(	4	)	<=	'0'		;	end if;
if 	(SCH	=	 "0101011000"	and 	SCV	=	 "0110100000"	) 	then 	s296	(	5	)	<= 	'1'	;	else	s296	(	5	)	<=	'0'		;	end if;
if 	(SCH	=	 "0101011000"	and 	SCV	=	 "0110110000"	) 	then 	s296	(	6	)	<= 	'1'	;	else	s296	(	6	)	<=	'0'		;	end if;

end process;

FFBP1	:	FFD_1b	port map	('0',clk,rst,	s296(0)	,	SFFP1	);
FFBP2	:	FFD_1b	port map	('0',clk,rst,	s296(1)	,	SFFP2	);
FFBP3	:	FFD_1b	port map	('0',clk,rst,	s296(2)	,	SFFP3	);
FFBP4	:	FFD_1b	port map	('0',clk,rst,	s296(3)	,	SFFP4	);
FFBP5	:	FFD_1b	port map	('0',clk,rst,	s296(4)	,	SFFP5	);
FFBP6	:	FFD_1b	port map	('0',clk,rst,	s296(5)	,	SFFP6	);
FFBP7	:	FFD_1b	port map	('0',clk,rst,	s296(6)	,	SFFP7	);

BolaP1	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP1,	 "0000110000",	 "0101011000",	R1,G1,B1	);
BolaP2	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP2,	 "0001000000",	 "0101011000",	R2,G2,B2	);
BolaP3	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP3,	 "0001010000",	 "0101011000",	R3,G3,B3	);
BolaP4	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP4,	 "0101000000",	 "0101011000",	R4,G4,B4	);
BolaP5	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP5,	 "0101010000",	 "0101011000",	R5,G5,B5	);
BolaP6	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP6,	 "0110100000",	 "0101011000",	R6,G6,B6	);
BolaP7	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP7,	 "0110110000",	 "0101011000",	R7,G7,B7	);

R <= 	R1 or	R2 or	R3 or	R4 or	R5 or	R6 or	R7	;
G <=	G1 or	G2 or	G3 or	G4 or	G5 or	G6 or	G7	;
B <=	B1 or	B2 or	B3 or	B4 or	B5 or	B6 or	B7	;

end Behavioral;

