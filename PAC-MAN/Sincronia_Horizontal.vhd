library IEEE;
use IEEE.std_logic_1164.all;

entity Sincronia_Horizontal is
   port(
      RST : in  std_logic;                    -- Reset maestro
      CLK : in  std_logic;                    -- Reloj maestro
      EHS : in  std_logic;                    -- Habilitacion horizontal
      EDS : out std_logic;                    -- Habilitacion pixel
      HAD : out std_logic_vector(9 downto 0); -- Direccion horizontal
      HS  : out std_logic                     -- Sincronia horizontal
      );
   end Sincronia_Horizontal;

architecture Control of Sincronia_Horizontal is

-- Contador de pulso horizontal
component Pulso_H
   port(
      RST : in  std_logic; -- Reset maestro
      CLK : in  std_logic; -- Reloj maestro
      ST  : in  std_logic; -- Habilitacion de entrada
      EC  : out std_logic  -- Fin de cuenta
      );
   end component;

-- Contador de guarda trasera
component Trasero_H
   port(
      RST : in  std_logic; -- Reset maestro
      CLK : in  std_logic; -- Reloj maestro
      ST  : in  std_logic; -- Habilitacion de entrada
      EC  : out std_logic  -- Fin de cuenta
      );
   end component;

-- Contador de desplegado
component Desplegado_H
   port(
      RST : in  std_logic; -- Reset maestro
      CLK : in  std_logic; -- Reloj maestro
      ST  : in  std_logic; -- Habilitacion de entrada
      HIC : out std_logic  -- Habilitacion de linea
      );
   end component;

-- Contador de linea
component Contador_H
   port(
      RST : in  std_logic;                    -- Reset maestro
      CLK : in  std_logic;                    -- Reloj maestro
      HIC : in  std_logic;                    -- Habilitacion de entrada
      HAD : out std_logic_vector(9 downto 0); -- Direccion horizontal
      EC  : out std_logic                     -- Fin de cuenta
      );
   end component;

-- Contador de guarda frontal
component Frontal_H
   port(
      RST : in  std_logic; -- Reset maestro
      CLK : in  std_logic; -- Reloj maestro
      ST  : in  std_logic; -- Habilitacion de entrada
      EC  : out std_logic  -- Fin de cuenta
      );
   end component;

-- Maquina de estados de control
component FSM_Horizontal
   port(
      RST : in  std_logic;                -- Reset maestro
      CLK : in  std_logic;                -- Reloj maestro
      EHS : in  std_logic;                -- Habilitacion horizontal
      EC  : in  std_logic_vector(1 to 4); -- Fin de cuenta
      ST  : out std_logic_vector(1 to 4); -- Inicio de cuenta
      EDS : out std_logic;                -- Habilitacion de pixel
      HS  : out std_logic                 -- Sincronia horizontal
      );
   end component;

-- Habilitaciones internas
signal ST, EC : std_logic_vector(1 to 4);
signal HIC    : std_logic;

begin

   -- Contador de pulso horizontal
   Bloque_01: Pulso_H        port map(RST,CLK,ST(1),EC(1));

   -- Contador de guarda trasera
   Bloque_02: Trasero_H      port map(RST,CLK,ST(2),EC(2));

   -- Contador de desplegado
   Bloque_03: Desplegado_H   port map(RST,CLK,ST(3),HIC);

   -- Contador de linea
   Bloque_04: Contador_H     port map(RST,CLK,HIC,HAD,EC(3));

   -- Contador de guarda frontal
   Bloque_05: Frontal_H      port map(RST,CLK,ST(4),EC(4));

   -- Maquina de estados de control
   Bloque_06: FSM_horizontal port map(RST,CLK,EHS,EC,ST,EDS,HS);

end Control;