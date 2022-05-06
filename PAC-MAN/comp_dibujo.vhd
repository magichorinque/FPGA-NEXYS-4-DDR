library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comp_dibujo is
    Port ( vaad : in  STD_LOGIC_VECTOR (8 downto 0);
           haad : in  STD_LOGIC_VECTOR (9 downto 0);
           Q : out  STD_LOGIC);
end comp_dibujo;

architecture Behavioral of comp_dibujo is

component Sincronizador_VGA is
   port(
      RST : in  std_logic;                    -- Reset maestro
      CLK : in  std_logic;                    -- Reloj maestro
      VS  : out std_logic;                    -- Sincronia vertical
      HS  : out std_logic;                    -- Sincronia horizontal
      VAD : out std_logic_vector(8 downto 0); -- Direccion vertical
      HAD : out std_logic_vector(9 downto 0); -- Direccion horizontal
      EDS : out std_logic                     -- Habilitacion pixel
      ); 
end component;
component Cuadro is
    Port ( VAD : in  STD_LOGIC_VECTOR(8 downto 0);
           HAD : in  STD_LOGIC_VECTOR(9 downto 0);
           S : out  STD_LOGIC
			 );
end component;

begin
 


end Behavioral;

