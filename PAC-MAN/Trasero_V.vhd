library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Trasero_V is
   port(
      RST : in  std_logic; -- Reset maestro
      CLK : in  std_logic; -- Reloj maestro
      ST  : in  std_logic; -- Habilitacion de entrada
      EC  : out std_logic  -- Fin de cuenta
      );
   end Trasero_V;

architecture Cascada of Trasero_V is

-- Estados internos
signal Qp, Qn : std_logic_vector(16 downto 0);

-- Detector de 46,399
signal Z      : std_logic;

-- Incrementador
signal I      : std_logic_vector(16 downto 0);

begin

   Detector: process(Qp)
   begin
      if (Qp="10110101001111111") then
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
      for j in 0 to 16 loop
         Qn(j) <= ST AND Z AND I(j);
      end loop;
      EC <= NOT(Z);
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