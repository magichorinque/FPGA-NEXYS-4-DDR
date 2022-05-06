library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Displays is
    Port ( C1 : in  STD_LOGIC_VECTOR (4 downto 0);
           C2 : in  STD_LOGIC_VECTOR (4 downto 0);
           C3 : in  STD_LOGIC_VECTOR (4 downto 0);
           C4 : in  STD_LOGIC_VECTOR (4 downto 0);
           C5 : in  STD_LOGIC_VECTOR (4 downto 0);
           C6 : in  STD_LOGIC_VECTOR (4 downto 0);
           C7 : in  STD_LOGIC_VECTOR (4 downto 0);
           C8 : in  STD_LOGIC_VECTOR (4 downto 0);
           rst  : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           disp : out  STD_LOGIC_VECTOR (6 downto 0);
           edisp : out  STD_LOGIC_VECTOR (7 downto 0));
end Displays;

architecture Behavioral of Displays is

component Mux5_4_1 is
   port(
      I0,I1,I2,I3,I4,I5,I6,I7 : in  std_logic_vector(4 downto 0); -- Entradas
      S :           in  std_logic_vector(2 downto 0); -- Seleccion
      Y :           out std_logic_vector(4 downto 0)  -- Salidas
      );
end component;

component Modulo_20khz is
   port(
      RST : in  std_logic; -- Reset maestro
      CLK : in  std_logic; -- Reloj maestro
      Q   : out std_logic  -- Cero
      );
end component;

component Demux_1_8 is
   port(
      X : in  std_logic;                    -- Entrada
      S : in  std_logic_vector(2 downto 0); -- Seleccion
      Y : out std_logic_vector(7 downto 0)  -- Salidas
      );
   end component;
	
component BCD_7_segmentos is
   port(
	      B : in  std_logic_vector(4 downto 0); -- Entrada BCD
	      S : out std_logic_vector(7 downto 1)  -- Salida 7 segmentos
     );
end component;

component contador_3bits is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           e : in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (2 downto 0));
end component;

signal sdiv1 : std_logic;
signal  scont3b : STD_LOGIC_VECTOR (2 downto 0);
signal  smux : STD_LOGIC_VECTOR (4 downto 0);

begin

div1: Modulo_20khz port map (rst,clk,sdiv1);

cont3b: contador_3bits port map (clk,rst,sdiv1,scont3b);

mux4a1: Mux5_4_1 port map (C1,C2,C3,C4,C5,C6,C7,C8,scont3b,smux);
demux1a8: Demux_1_8 port map ('0', scont3b,edisp);

bcd7seg: BCD_7_segmentos port map (smux,disp);

end Behavioral;

