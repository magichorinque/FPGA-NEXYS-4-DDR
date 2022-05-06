library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bola_pequea_392 is
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
end bola_pequea_392;

architecture Behavioral of bola_pequea_392 is
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
signal s240 :STD_LOGIC_VECTOR(3 downto 0);

signal	SFFP1,	SFFP2,	SFFP3,	SFFP4	:	std_logic; 		
								
signal	R1,	R2,	R3,	R4	:	STD_LOGIC_VECTOR(3 downto 0);		
signal	G1,	G2,	G3,	G4	:	STD_LOGIC_VECTOR(3 downto 0);		
signal	B1,	B2,	B3,	B4	:	STD_LOGIC_VECTOR(3 downto 0);		
begin
process(SCV,SCH)
begin
if 	(SCH	=	 "0110001000"	and 	SCV	=	 "0001110000"	) 	then 	s240	(	0	)	<= 	'1'	;	else	s240	(	0	)	<=	'0'		;	end if;
if 	(SCH	=	 "0110001000"	and 	SCV	=	 "0010000000"	) 	then 	s240	(	1	)	<= 	'1'	;	else	s240	(	1	)	<=	'0'		;	end if;
if 	(SCH	=	 "0110001000"	and 	SCV	=	 "0101110000"	) 	then 	s240	(	2	)	<= 	'1'	;	else	s240	(	2	)	<=	'0'		;	end if;
if 	(SCH	=	 "0110001000"	and 	SCV	=	 "0110000000"	) 	then 	s240	(	3	)	<= 	'1'	;	else	s240	(	3	)	<=	'0'		;	end if;

end process;

FFBP1	:	FFD_1b	port map	('0',clk,rst,	s240(0)	,	SFFP1	);
FFBP2	:	FFD_1b	port map	('0',clk,rst,	s240(1)	,	SFFP2	);
FFBP3	:	FFD_1b	port map	('0',clk,rst,	s240(2)	,	SFFP3	);
FFBP4	:	FFD_1b	port map	('0',clk,rst,	s240(3)	,	SFFP4	);

BolaP1	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP1,	"0001110000","0110001000",	R1,G1,B1	);
BolaP2	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP2,	"0010000000","0110001000",	R2,G2,B2	);
BolaP3	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP3,	"0101110000","0110001000",	R3,G3,B3	);
BolaP4	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP4,	"0110000000","0110001000",	R4,G4,B4	);
			
R <= 	R1 or	R2 or	R3 or	R4	;
G <=	G1 or	G2 or	G3 or	G4	;
B <=	B1 or	B2 or	B3 or	B4	;

end Behavioral;

