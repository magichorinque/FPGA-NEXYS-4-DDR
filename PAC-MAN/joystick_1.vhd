library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity joystick_1 is
    Port ( axysX : in  STD_LOGIC_VECTOR (7 downto 0);
           ejeY : in  STD_LOGIC_VECTOR (7 downto 0);
           upX : out  STD_LOGIC;
           downX : out  STD_LOGIC;
           rightY : out  STD_LOGIC;
           leftY : out  STD_LOGIC;
           sfsm : out  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC);
end joystick_1;

architecture Behavioral of joystick_1 is

component frecuencia_20Khz is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           q : out  STD_LOGIC);
end component;

component ciclo_50 is
    Port ( clk,rst : in  STD_LOGIC;
				sin : in  STD_LOGIC;
           sal : out  STD_LOGIC
			  );
end component;

component movimiento is
    Port ( axys : in  STD_LOGIC_VECTOR (7 downto 0);
           up : out  STD_LOGIC;
           down : out  STD_LOGIC);
end component;

signal sfr : STD_LOGIC;

begin

ejex: movimiento port map (axysX,upX,downX);
axysy: movimiento port map (ejey,rightY,leftY);

fr : frecuencia_20Khz port map (clk,rst,sfr);
duty50: ciclo_50 port map (clk,rst,sfr,sfsm);

end Behavioral;

