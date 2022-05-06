library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Bolas_grandes is
    Port ( SCH : in  STD_LOGIC_VECTOR (9 downto 0);
           SCV : in  STD_LOGIC_VECTOR (9 downto 0); 
			  VAD : in  STD_LOGIC_VECTOR (8 downto 0);
           HAD : in  STD_LOGIC_VECTOR (9 downto 0);
			  EDS : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           R : out  STD_LOGIC_VECTOR (3 downto 0);
           G : out  STD_LOGIC_VECTOR (3 downto 0);
           B : out  STD_LOGIC_VECTOR (3 downto 0));
end Bolas_grandes;

architecture Behavioral of Bolas_grandes is

COMPONENT bola_grande is
    Port (  VAD : in  STD_LOGIC_VECTOR(8 downto 0);
           HAD : in  STD_LOGIC_VECTOR(9 downto 0);
			  EDS,E : in  STD_LOGIC;
			  y,x : in  STD_LOGIC_VECTOR(9 downto 0);
			  R,G,B : out  STD_LOGIC_VECTOR(3 downto 0)
			  );
end component;

component FFD_1b is
    Port ( A : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
			  e : in  STD_LOGIC;
           SA : out  STD_LOGIC);
end component;

signal BR1,BG1,BB1,Br2,bG2,bB2,Br3,bG3,bB3,Br4,bG4,bB4 : std_logic_vector(3 downto 0);
signal s: std_logic_vector(3 downto 0);
signal sffg1,sffg2,sffg3,sffg4: std_logic;

begin

process(sch,scv)
	begin
	if (SCV = "0001000000" and SCH = "0001111000") then 
		s(0) <= '1';
	else 
		s(0) <= '0';
	end if;

	if (SCV = "0101100000" and SCH = "0001111000") then 
		s(1) <= '1';
	else 
		s(1) <= '0';
	end if;
	
	if (SCV = "0001000000" and SCH = "1000001000") then 
		s(2) <= '1';
	else 
		s(2) <= '0';
	end if;

	if (SCV = "0101100000" and SCH = "1000001000") then 
		s(3) <= '1';
	else 
		s(3) <= '0';
	end if;
	end process;
	
	FFBG1: FFD_1b port map ('0',clk,rst,s(0),sffg1);
	FFBG2: FFD_1b port map ('0',clk,rst,s(1),sffg2);
	FFBG3: FFD_1b port map ('0',clk,rst,s(2),sffg3);
	FFBG4: FFD_1b port map ('0',clk,rst,s(3),sffg4);
	
	bolaG1: bola_grande port map (VAD,HAD,EDS,sffg1,"0001000000","0001111000",Br1,bG1,bB1);
	bolaG2: bola_grande port map (VAD,HAD,EDS,sffg2,"0101100000","0001111000",Br2,bG2,bB2);
	bolaG3: bola_grande port map (VAD,HAD,EDS,sffg3,"0001000000","1000001000",Br3,bG3,bB3);
	bolaG4: bola_grande port map (VAD,HAD,EDS,sffg4,"0101100000","1000001000",Br4,bG4,bB4);
	
	R <=	Br1 or Br2 or Br3 or Br4;
	G <=	bG1 or bG2 or bG3 or bG4;
	B <= 	bB1 or bB2 or bB3 or bB4;

end Behavioral;

