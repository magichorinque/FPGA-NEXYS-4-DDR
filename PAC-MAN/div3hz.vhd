library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity div3hz is
 port(
      RST : in  std_logic; -- Reset maestro
      CLK : in  std_logic; -- Reloj maestro
      Q   : out std_logic  -- Cero
      );
end div3hz;

architecture Behavioral of div3hz is

signal Qp, Qn : std_logic_vector(21 downto 0);
signal Z      : std_logic;
signal I      : std_logic_vector(21 downto 0);

begin

Detector: process(Qp)
   begin   
	  if qp="1001100010010110100000" then
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
      for j in 0 to 21 loop
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

end Behavioral;

