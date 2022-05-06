library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FFD_1b is
    Port ( A : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
			  e : in  STD_LOGIC;
           SA : out  STD_LOGIC);
end FFD_1b;

architecture Behavioral of FFD_1b is

begin

process(Clk, Clr)
begin
      if (Clr='0') then
		SA <='1';
      elsif (Clk'event and Clk='1') then
		if(e = '1') then
      SA <= A;
		end if;
     end if;
end process;	

end Behavioral;

