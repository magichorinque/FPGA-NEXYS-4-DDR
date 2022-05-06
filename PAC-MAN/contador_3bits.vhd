library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity contador_3bits is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           e : in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (2 downto 0));
end contador_3bits;

architecture Behavioral of contador_3bits is

signal Qp, Qn : std_logic_vector(2 downto 0);

begin

process (e,Qp)
begin
	if (e = '1') then
	Qn <= Qp + 1;
	else 
	Qn <= Qp;
	end if;
end process;	
	
	Secuencial: process(RST,CLK)
   begin
      if (RST='0') then
         Qp <= (others => '0');
      elsif (CLK'event and CLK='1') then 
         Qp <= Qn;
      end if;
   end process Secuencial;

 s <= Qp;


end Behavioral;

