library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity frecuencia_20Khz is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           q : out  STD_LOGIC);
end frecuencia_20Khz;

architecture Behavioral of frecuencia_20Khz is
signal Qp, Qn : std_logic_vector(12 downto 0);
signal Z      : std_logic;
signal I      : std_logic_vector(12 downto 0);
begin

Detector: process(Qp)
   begin   
	  if qp="1111010000100" then
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


end Behavioral;

