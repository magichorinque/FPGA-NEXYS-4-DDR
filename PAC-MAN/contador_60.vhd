library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity contador_60hz is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           e : in  STD_LOGIC;
           tc : out  STD_LOGIC;
           u : out  STD_LOGIC_VECTOR (3 downto 0);
           d : out  STD_LOGIC_VECTOR (3 downto 0));
end contador_60hz;

architecture Behavioral of contador_60hz is

component Contador_10 is
   port(
      Clk : in  std_logic;                    -- Reloj
      Rst,e : in  std_logic;                    -- Reset	  
	   tc : out  std_logic;
      Y   : out std_logic_vector(3 downto 0)  -- Salidas
      );
end component;

signal tc1,e1,tc2 : std_logic; 

begin

unidades: Contador_10 port map (clk,rst,e,tc1,u);
e1 <= tc1 and e;
decenas: Contador_10 port map (clk,rst,e1,tc2,d);
tc <= tc2 and e1;

end Behavioral;

