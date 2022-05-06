library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bola_pequea_152 is
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
end bola_pequea_152;

architecture Behavioral of bola_pequea_152 is
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

signal s152 :STD_LOGIC_VECTOR(1 downto 0);
signal	SFFP1,	SFFP2	:	std_logic; 		
						
signal	R1,	R2	:	STD_LOGIC_VECTOR(3 downto 0);		
signal	G1,	G2	:	STD_LOGIC_VECTOR(3 downto 0);		
signal	B1,	B2	:	STD_LOGIC_VECTOR(3 downto 0);		

begin
process(SCV,SCH)
begin
if 	(SCH	=	 "0010011000"	and 	SCV	=	 "0101110000"	) 	then 	s152	(	0	)	<= 	'1'	;	else	s152	(	0	)	<=	'0'		;	end if;
if 	(SCH	=	 "0010011000"	and 	SCV	=	 "0110000000"	) 	then 	s152	(	1	)	<= 	'1'	;	else	s152	(	1	)	<=	'0'		;	end if;
end process;

FFBP1	:	FFD_1b	port map	('0',clk,rst,	s152(0)	,	SFFP1	);
FFBP2	:	FFD_1b	port map	('0',clk,rst,	s152(1)	,	SFFP2	);

BolaP1	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP1,	 "0101110000",	 "0010011000",	R1,G1,B1	);
BolaP2	:	bola_pequena	port map	(HAD,VAD,EDS,	SFFP2,	 "0110000000",	 "0010011000",	R2,G2,B2	);

R <= 	R1 or	R2	;
G <=	G1 or	G2	;
B <=	B1 or	B2	;

end Behavioral;

