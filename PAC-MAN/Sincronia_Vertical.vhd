library IEEE;
use IEEE.std_logic_1164.all;

entity Sincronia_Vertical is
   port(
      RST : in  std_logic;                    -- Reset maestro
      CLK : in  std_logic;                    -- Reloj maestro
      EHS : out std_logic;                    -- Habilitacion horizontal
      VAD : out std_logic_vector(8 downto 0); -- Direccion vertical
      VS  : out std_logic                     -- Sincronia vertical
      );
   end Sincronia_Vertical;

architecture Control of Sincronia_Vertical is

-- Contador de pulso vertical
component Pulso_V
   port(
      RST : in  std_logic; -- Reset maestro
      CLK : in  std_logic; -- Reloj maestro
      ST  : in  std_logic; -- Habilitacion de entrada
      EC  : out std_logic  -- Fin de cuenta
      );
   end component;

-- Contador de guarda trasera
component Trasero_V
   port(
      RST : in  std_logic; -- Reset maestro
      CLK : in  std_logic; -- Reloj maestro
      ST  : in  std_logic; -- Habilitacion de entrada
      EC  : out std_logic  -- Fin de cuenta
      );
   end component;

-- Contador de desplegado
component Desplegado_V
   port(
      RST : in  std_logic; -- Reset maestro
      CLK : in  std_logic; -- Reloj maestro
      ST  : in  std_logic; -- Habilitacion de entrada
      VIC : out std_logic  -- Habilitacion de linea
      );
   end component;

-- Contador de linea
component Contador_V
   port(
      RST : in  std_logic;                    -- Reset maestro
      CLK : in  std_logic;                    -- Reloj maestro
      VIC : in  std_logic;                    -- Habilitacion de entrada
      VAD : out std_logic_vector(8 downto 0); -- Direccion vertical
      EC  : out std_logic                     -- Fin de cuenta
      );
   end component;

-- Contador de guarda frontal
component Frontal_V
   port(
      RST : in  std_logic; -- Reset maestro
      CLK : in  std_logic; -- Reloj maestro
      ST  : in  std_logic; -- Habilitacion de entrada
      EC  : out std_logic  -- Fin de cuenta
      );
   end component;

-- Maquina de estados de control
component FSM_Vertical
   port(
      RST : in  std_logic;                -- Reset maestro
      CLK : in  std_logic;                -- Reloj maestro
      EC  : in  std_logic_vector(1 to 4); -- Fin de cuenta
      ST  : out std_logic_vector(1 to 4); -- Inicio de cuenta
      EHS : out std_logic;                -- Habilitacion horizontal
      VS  : out std_logic                 -- Sincronia vertical
      );
   end component;

-- Habilitaciones internas
signal ST, EC : std_logic_vector(1 to 4);
signal VIC    : std_logic;

begin

   -- Contador de pulso vertical
   Bloque_01: Pulso_V      port map(RST,CLK,ST(1),EC(1));

   -- Contador de guarda trasera
   Bloque_02: Trasero_V    port map(RST,CLK,ST(2),EC(2));

   -- Contador de desplegado
   Bloque_03: Desplegado_V port map(RST,CLK,ST(3),VIC);

   -- Contador de linea
   Bloque_04: Contador_V   port map(RST,CLK,VIC,VAD,EC(3));

   -- Contador de guarda frontal
   Bloque_05: Frontal_V    port map(RST,CLK,ST(4),EC(4));

   -- Maquina de estados de control
   Bloque_06: FSM_Vertical port map(RST,CLK,EC,ST,EHS,VS);

end Control;