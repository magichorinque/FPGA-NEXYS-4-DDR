library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Modulo_20khz is
   port(
      RST : in  std_logic; -- Reset maestro
      CLK : in  std_logic; -- Reloj maestro
      Q   : out std_logic  -- Cero
      );
   end Modulo_20khz;

architecture Cascada of Modulo_20khz is

-- Estados internos
signal Qp, Qn : std_logic_vector(12 downto 0);

-- Detector de 9999
signal Z      : std_logic;

-- Incrementador
signal I      : std_logic_vector(12 downto 0);

begin

   Detector: process(Qp)
   begin   
	  if qp="1001110001000" then
		  z<='0';
	  else
		  z<='1';   
	  end if;
	  
   end process Detector;

   Incrementador: process(Qp)
   begin
      I <= Qp + 1;
   end process Incrementador;

   Anulador: process(Z,I)
   begin
      for j in 0 to 12 loop
         Qn(j) <= Z AND I(j);
      end loop;
      Q <=NOT(Z);
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
