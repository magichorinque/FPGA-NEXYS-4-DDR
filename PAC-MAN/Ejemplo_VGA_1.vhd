library IEEE;
use IEEE.std_logic_1164.all;

entity Bandera is
   port(
      RST : in  std_logic;                    -- Reset maestro
      CLK : in  std_logic;                    -- Reloj maestro
      VS  : out std_logic;                    -- Sincronia vertical
      HS  : out std_logic;                    -- Sincronia horizontal
      R   : out std_logic_vector(3 downto 0);                    -- Red
      G   : out std_logic_vector(3 downto 0);                    -- Green
      B   : out std_logic_vector(3 downto 0)                     -- Blue
      );
   end Bandera; 

architecture Prueba of Bandera is

-- Sincronizador VGA
component Sincronizador_VGA 
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
			  EDS : in  STD_LOGIC;
			  R,G,B : out  STD_LOGIC_VECTOR(3 downto 0)
			 );
	end component;

-- Habilitacion de pixel
signal EDS: std_logic;
-- Direccion de pixel
signal VAD: std_logic_vector(8 downto 0);
signal HAD: std_logic_vector(9 downto 0);

begin
   -- Sincronizador VGA
   DUT_01: Sincronizador_VGA port map(RST,CLK,VS,HS,VAD,HAD,EDS);
	-- Dibujo de cuadro
	comp: cuadro port map(VAD,HAD,EDS,R,G,B);
   

end Prueba;
