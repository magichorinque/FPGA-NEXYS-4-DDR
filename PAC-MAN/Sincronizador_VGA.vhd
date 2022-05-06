library IEEE;
use IEEE.std_logic_1164.all;

entity Sincronizador_VGA is
   port(
      RST : in  std_logic;                    -- Reset maestro
      CLK : in  std_logic;                    -- Reloj maestro
      VS  : out std_logic;                    -- Sincronia vertical
      HS  : out std_logic;                    -- Sincronia horizontal
      VAD : out std_logic_vector(8 downto 0); -- Direccion vertical
      HAD : out std_logic_vector(9 downto 0); -- Direccion horizontal
      EDS : out std_logic                     -- Habilitacion pixel
      );
   end Sincronizador_VGA;

architecture Control_Maestro of Sincronizador_VGA is

-- Sincronia vertical
component Sincronia_Vertical
   port(
      RST : in  std_logic;                    -- Reset maestro
      CLK : in  std_logic;                    -- Reloj maestro
      EHS : out std_logic;                    -- Habilitacion horizontal
      VAD : out std_logic_vector(8 downto 0); -- Direccion vertical
      VS  : out std_logic                     -- Sincronia vertical
      );
   end component;

-- Sincronia horizontal
component Sincronia_Horizontal
   port(
      RST : in  std_logic;                    -- Reset maestro
      CLK : in  std_logic;                    -- Reloj maestro
      EHS : in  std_logic;                    -- Habilitacion horizontal
      EDS : out std_logic;                    -- Habilitacion pixel
      HAD : out std_logic_vector(9 downto 0); -- Direccion horizontal
      HS  : out std_logic                     -- Sincronia horizontal
      );
   end component;

-- Habilitacion interna
signal EHS : std_logic;

begin

   -- Sincronia Vertical
   Control_01: Sincronia_Vertical   port map(RST,CLK,EHS,VAD,VS);

   -- Sincronia horizontal
   Control_02: Sincronia_horizontal port map(RST,CLK,EHS,EDS,HAD,HS);

end Control_Maestro;
