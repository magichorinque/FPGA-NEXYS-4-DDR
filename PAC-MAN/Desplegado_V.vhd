library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Desplegado_V is
   port(
      RST : in  std_logic; -- Reset maestro
      CLK : in  std_logic; -- Reloj maestro
      ST  : in  std_logic; -- Habilitacion de entrada
      VIC : out std_logic  -- Habilitacion de linea
      );
   end Desplegado_V;

architecture Cascada of Desplegado_V is

-- Estados internos
signal Qp, Qn : std_logic_vector(11 downto 0);

-- Detector de 1,599
signal Z      : std_logic;

-- Incrementador
signal I      : std_logic_vector(11 downto 0);

begin

   Detector: process(Qp)
   begin
      if (Qp="110001111111") then
         Z <= '0';
      else
         Z <= '1';
      end if;
   end process Detector;

   Incrementador: process(Qp)
   begin
      I <= Qp + 1;
   end process Incrementador;

   Anulador: process(Z,I,ST)
   begin
      for j in 0 to 11 loop
         Qn(j) <= ST AND Z AND I(j);
      end loop;
      VIC <= NOT(Z) AND ST;
   end process Anulador;
	
	

   Secuencial: process(RST,CLK)
   begin
      if (RST='0') then
         Qp <= (others => '0');
      elsif (CLK'event and CLK='1') then 
         Qp <= Qn;
      end if;
   end process Secuencial;

end Cascada;
